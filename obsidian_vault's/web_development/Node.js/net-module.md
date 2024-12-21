
**Beispiel:**
```javascript
const net = require("net"); 

const server = net.createServer((socket) => {
	let fullData = "";
	
	//chunk ist immer eine Referenz auf ein Buffer
   socket.on("data", chunk => {
		fullData += chunk;
    });

	socket.on("end", () => {
		console.log(fullData.toString())
	})
}); 
 server.listen(8001);
  
//das gleiche ohne die verkürzte schreibweise
const net = require("net");
const server = net.createServer();

server.on("connection", (socket) => {
   let fullData = "";

	//chunk ist immer eine Referenz auf ein Buffer
   socket.on("data", chunk => {
		fullData += chunk;
    });

	socket.on("end", () => {
		console.log(fullData.toString())
	})
});
   
  
server.listen(8001);
```

### TCP-Verbindungsaufbau 
- **libuv** führt die Funktion **accept** aus, wodurch ein client-socket erstellt wird. 

### Wenn TCP-Verbindung aufgebaut ist
- **libuv** fügt das **connection** event mit den Informationen über den client-socket in die event-queue ein.
- Die **Event Loop** entnimmt das **connection** event aus der event-queue.
- Die **Event Loop** ruft die callback auf, die für das **connection** event registriert wurde (wurde durch Aufruf von createServer registriert bzw. durch .on("connection") ohne der verkürzten Schreibweise) und übergibt dieser als argument das socket-object aus dem **connection** event, dass Informationen über den erstellten client-socket enthält.
	- Die callback von createServer wird immer aufgerufen, wenn ein neuer client-socket erstellt wurde.
	- Das socket-object enthält methoden bspw. um daten in den socket zu schreiben.		
		- Diese Methoden verwenden die libuv library.
		- Der client-socket ist ein Duplex-Stream.
- Das **data** event enthält immer eine Referenz zu dem erstellten client-socket.
	- Dadurch, dass die callback Funktion für das **data** event mit dem client-socket verbunden ist und die Referenz des client-socket im **data** event ist, weiß die Event-Loop welche callback für das **data** event ausgeführt werden soll.

### Wenn Daten im client-socket verfügbar sind
- libuv ließt die Daten aus dem client-socket.
- libuv fügt das **data** event in die event-queue.
- **Event-Loop** entnimmt das **data** event und ruft für dieses den entsprechenden Handler auf.
	- **Event-Loop** übergibt dem Händler die Daten, die sich im **data** event befinden als Argument.
	- Wenn noch eine Instanz der callback Funktion für das **data** event existie