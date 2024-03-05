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

1. Wenn eine Anfrage an ein Socket gesendet wurde, wird das "data" Event vom Betriebssystem direkt in die Event-Queue des Node-Prozess gespeichert. Das Event enthält die Daten aus dem Socket und den Dateidescriptor.
3. Ist das "data" Event an der Reihe, speichert die Event-Loop die für dieses Event registrierte Callbal-Function in die Callback-Queue ( die Callback-Function vom Net-Module (socket.on("data", cb)) ). Der Callback-Function wird das Event data als Argument übergeben.
4. In der Callback-Function wird geprüft, ob es sich um eine HTTP-Anfrage handelt. Wenn dem so ist, wird das request Event emitiert, das die HTTP-Anfrage enthält. Zuvor wird die HTTP-Anfrage als Objekte (request und response) geparst und in dem request Event gespeichert.
5. Die Callback-Function vom http-module (server.on("request", cb)) wird aufgerufen, und dieser das request-event übergeben.
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