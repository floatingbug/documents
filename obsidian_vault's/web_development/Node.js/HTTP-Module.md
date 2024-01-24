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
Für jeden HTTP-Request wird die übergebene Callback-Funktion aufgerufen, also immer wenn das HTTP Module mit hilfe des Net Module aus einem Socket eine HTTP Anfrage erhält. Diese Callback-Funktion wird auch request handler genannt.
Das Web-Server-Object das von createServer zurück gegeben wird, ist ein [[EventEmitter]].
Das Oben erstellte Web-Server-Object ist eine verkürzte Schreibweise für:

```javascript
const server = http.createServer();
server.on('request', (request, response) => { 
});
```

Sobald das Web-Server-Object mit Hilfe des Net Module ein HTTP-Request von einem Socket erhält, löst das Web-Server-Object das "request" event aus und die handler Funktion wird auf den Call Stack ausgeführt, sobald dieser frei ist. Außerdem übergibt das Webserver object das Objekt request, das alle Information zum Request enthält und das Objekt response, das alle Methoden enthält, um ein HTTP-Response zu verschicken, an die Request Handler Funktion.

##### Wie gelangt das HTTP-Modul an die HTTP-Anfrage?
1. Wenn Daten im Socket eingetroffen sind, sendet das Betriebssystem das "data"-Ereignis an Node.js.
2. Node.js speichert das Ereignis "data" in die Event-Queue.
3. Die Event Loop entnimmt das [[Ereignis "data"]] aus der Event-Queue, wenn es an der reihe ist und  ruft die Callback-Function auf, die für das Ereignis "data" registriert wurde: socket.on("data", callback).
5. Das `net`-Modul von Node.js reagiert auf dieses Ereignis und liest dann die Daten aus dem Socket des Betriebssystems und übergibt sie an das Webserver-Object.

##### Verarbeitung der HTTP-Anfrage
Das "request"-Ereignis wird ausgelöst, wenn das Webserver-Object die vollständige HTTP-Anfrage durch das Net-Modul erfangen hat. Das Websocket-Object überprüft die Daten auf HTTP-Anfragezeichen und handhabt den Aufbau und das Parsen von HTTP-Anfragen.
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