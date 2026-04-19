# Node wird zum ersten mal Aufgerufen

 wenn eine Node Anwendung zum ersten mal aufgerufen wird, werden alle JS-Dateien einmal von V8 ausgeführt, so auch der folgende Code:
```js
const server = net.createServer();
```
server befindet sich nach diesem Aufruf im Heap.

 Die callback "callback_a" wird in diesem server Object gespeichert:
```js
const server.on("connection", (socket) => {
  console.log("Neue Verbindung!");
});
```

Ergebnis:
```js
server._events = {
  connection: [callback_a],
};
```
- `server` **erbt von `EventEmitter`**
- `_events` ist eine **interne Datenstruktur des EventEmitter**
- Node speichert eine liste, in der events auf cb's gemapt sind:
```text
"connection" -> server
```
- Node ruft dann über die V8-library-API auf:
```js
server.emit("connection", socket);
```


Node registriert bei libuv eine callback "callback_b".
```js
server.listen(...)
```

# Neue TCP-Verbindung

- OS hat den TCP-Handshake beendet und setzt den server-socket auf readable.
- durch epoll erkennt libuv, dass der server-socket auf readable gesetzt wurde und führt accept() aus, wodurch das OS einen neuen client-socket erstellt.
-  accept() gibt den FD des neuen client-sockets zurück.
- libuv ruft in der poll-phase callback_b auf.
- node ruft innerhalb von callback_b eine v8-api auf, um folgenden JS-Code auszuführen:
  ```js
  server.emit("connection")
  ```
Dadurch werden alle Callbacks in \_events ausgeführt, die für das connection-event registriert wurden, also bspw. callback_a:
```js
server._events = {
  connection: [callback_a],
};
```

# Daten aus dem client-socket-buffer

- wenn Daten im client-socket-buffer des kernels vorhanden sind, wird libuv vom OS informiert.
- libuv ließt die Daten aus dem client-socket-buffer und speichert sie in ein userspace-buffer.
	- Das geschieht nur, wenn node libuv durch folgenden aufruf mitgeteilt hat, dass gelesen werden kann: uv_read_start().
	- node ruft uv_read_start() auf, wenn bspw. `socket.emit("data", buffer);` von node aufgerufen wird.
- libuv ruft in der poll-phase die entsprechende callback auf und übergibt dieser als Argumente Pointer auf Buffer und Länge des Buffers.
- node speichert die Daten, mit hilfe des Pointers, in ein js-buffer-object und ruft innerhalb dieser callback eine v8-api auf, um folgenden JS-Code auszuführen:
```js
socket.emit("data", buffer);
```
Dadurch werden alle Callbacks in \_events ausgeführt, die für das data-event registriert wurden, also bspw. callback_a:
```js
server._events = {
  data: [callback_a],
};
```

# Daten in den client-socket schreiben

- wenn der JS-Code Daten in den Socket schreiben möchte, z. B.:
```js
socket.write("Hallo Client");
```

- Node erstellt zunächst einen **JS-Buffer** aus den Daten, die geschrieben werden sollen.
- Node ruft eine **V8-API** auf, um den Buffer in den nativen Layer zu übergeben.
- Im nativen Layer ruft Node dann **libuv-Funktionen** auf, z. B. `uv_write()`, und übergibt:
    - den **Client-Socket** (repräsentiert durch den FD intern)
    - einen **Pointer auf den Userspace-Buffer** mit den zu schreibenden Daten
    - die Länge des Buffers
    - optional einen Callback für Write-Completion


- libuv übergibt die Daten an das **OS**, das sie in den **Kernel-Sendepuffer des Client-Sockets** schreibt.    
- Sobald die Daten erfolgreich gesendet wurden (oder ein Fehler auftritt), ruft libuv den Write-Completion-Callback im Node-Layer auf.
- Node kann daraufhin eine **V8-API** aufrufen, um z. B. `callback` auszuführen, der im JS-Code registriert ist:
```js
// optionaler Callback bei socket.write
socket.write("Hallo Client", () => {
  console.log("Daten wurden gesendet");
});
```

- **Merksatz:** JS greift **nie direkt** auf den Kernel-Sendepuffer zu. Node und libuv übernehmen:
    - FD-Identifikation des Sockets
    - Kopieren von Daten in den Kernel-Sendepuffer
    - Eventuelle Callbacks bei erfolgreichem Senden