### HTTP-Module nutzt das Net-Module 
Das HTTP Module nutzt das Net-Module. Dieses ist für den Aufbau von TCP-Verbindungen verantwortlich. Durch den Aufruf von http.listen(3000) teilt das HTTP Module, mit hilfe des Net Module, dem Betriebssystem mit, dass das Betriebssystem einen Server Socket erstellen soll. Sobald eine TCP-Verbindung aufgebaut wurde, kann das HTTP Module mit Hilfe des Net Module in den Socket schreiben und von dem Socket lesen. 

### Verarbeitung von HTTP-Anfragen
##### Web-Server-Object:

```javascript
const http = require('http');
const server = http.createServer((request, response) => {

});
```

Mit createServer wird das web-server-object erstellt.
Das Web-Server-Object das von createServer zurück gegeben wird, ist ein [[EventEmitter]].
Das Oben erstellte Web-Server-Object ist eine verkürzte Schreibweise für:

```javascript
const server = http.createServer();
server.on('request', (request, response) => { 
});
```

1. **libuv beauftragt beim Betriebssystem einen Server-Socket zu erstellen.** 
	- Dies geschiet durch den Aufruf von server.listen(), wobei libuv socket() aus der glibc Bibliothek aufruft.

2. **Nach einem erfolgreichen TCP-Handshake teilt das betriebssystem dies libuv mit, worauf libuv die Funktion accept() aufruft.**
	- accept() signalisiert dem Betriebssystem, dass libuv die eingehende Verbindung akzeptiert.
	- accept() gibt den File Descriptor (fd) des neu erstellten Client-Sockets zurück.
	- Libuv speichert diesen fd und verwendet ihn für die Kommunikation mit dem Client-Socket. erstellt das Betriebssystem einen Client-Socken und übergibt libuv den fd des Client-Socket.

3. **Nachdem das Betriebssystem Daten empfangen und diese in den Client-Socket geschrieben hat, signalisiert es libuv über einen Mechanismus wie epoll (Linux), kqueue (macOS/BSD) oder IOCP (Windows), dass Daten zum Lesen im Client-Socket verfügbar sind.**

4. **Nachdem libuv das Signal erhalten und die Daten aus dem Client-Socket gelesen hat, fügt libuv ein I/O-Event in die Event-Queue ein.** 
	 - In diesem Event ist ein Zeiger auf den Puffer, indem die Daten, die libuv aus dem socket gelesen hat, von libuv gespeichert wurden.

5. **Die Node.js-Event-Loop entnimmt dieses Event der Event-Queue, speichert den Zeiger in das "data"-Event und löst das "data"-Event aus.**

6. **Die Event-Loop entnimmt das data-Event und übergibt den Zeiger als Argument an die cb die für das data-Event registriert wurde.**

7. **Dann setzt die Event-Loop die cb in die Callback-Queue.**

8. **wird die cb auf dem stack ausgeführt, kann diese durch den Zeiger direkt auf die Daten zugreifen.**
##### Verarbeitung der HTTP-Anfrage
Das "request"-Ereignis wird ausgelöst, wenn das Webserver-Object die vollständige HTTP-Anfrage durch das Net-Modul erfangen hat. Das Websocket-Object überprüft die Daten auf HTTP-Anfragezeichen und handhabt den Aufbau und das Parsen von HTTP-Anfragen (es erstellt also die Objekte req und res mit Hilfe der HTTP-Anfrage).
#### Für jede Anfrage eine Instanz des Request Handler
Jede Anfrage wird von einer eigenen Instanz der Rquest Handler Funktion verarbeitet. Jede Instanz ist einem Socket zugeordnet, sodass mehrere Nutzer gleichzeitig Anfragen stellen können.

##### Was Passiert bei einer asynchronen Operation?
1. Wenn in einem Request-Handler eine asynchrone Operation aufgerufen wird, wird die Ausführung des Handlers pausiert.
2. In der Callback der asynchronen Operation, bspw. fs.readFile("phat", callback), wird der Verweiß auf die Request-Handler Instanz und Information über die Stelle, an der die Ausführung fortgesetzt werden soll, gespeichert.
	1. Dadurch kann die Callback später auf dem Call-Stack den Request-Handler wieder an der richtigen Stelle aufrufen.
3. Die Kontrolle wird an die Event Loop übergeben.
4. Der Call Stack wird während der asynchronen Operation geleert.

Wenn die asynchrone Operation abgeschlossen ist:

1. Die Callback-Funktion der asynchronen Operation wird in die Callback-Queue gesetzt.
2. Die Callback-Funktion enthält das Ergebnis der asynchronen Operation sowie den Verweiß der Request-Handler Instanz und Informationen darüber, wo die Ausführung, bei dieser Instanz, fortgesetzt werden soll.
4. Die Callback-Funktion wird von der Callback Queue, durch die Event Loop, auf den Call Stack verschoben, wenn dieser leer ist.
5. Die Ausführung der Instanz des Request-Handlers wird an der Stelle fortgesetzt, an der sie unterbrochen wurde.