
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


### Was geschieht, wenn eine TCP-Verbindung aufgebaut wurde?

- Wenn eine **neue TCP-Verbindung** hergestellt wird, erzeugt **libuv** ein **`socket`-Objekt**, das Informationen über die neu erstellte Verbindung enthält (z. B. Client-Adresse, Port und andere Verbindungsdetails).
- libuv erstellt das connection Event, fügt diesem das socket-object hinzu und setzt das connection Event in die I/O-Queue.

- Wenn die Event-Loop das Event entnimmt, fügt sie die für das Event registrierte CB in den Call-Stack `server.on("connection", (socket) => {})`.
	- Vorher übergibt die Event-Loop der CB das Socket-Object als Argument (das Socket-Object befindet sich in dem connection Event).

- In der CB von `(socket) => {}` wird eine weitere CB registriert `socket.on("data", (chunk) => {});`

##### Wenn Daten empfangen werden passiert folgendes:

- Der Kernel schreibt eintreffende TCP-Pakete in einen Kernel-Buffer und signalisiert libuv, dass Daten zum lesen bereitstehen.
- libuv kopiert die Daten aus dem Kernel Buffer in einen eigenen Buffer im user-space.
- libuv fügt das das data Event in die I/O-Queue.
	- Vorher speichert libuv die Referenz aus den Buffer in das data Event.
- Wenn die Event-Loop das Event entnimmt, fügt sie die für das Event registrierte CB in den Call-Stack `socket.on("data", (chunk) => {})`.
	- Vorher übergibt die Event-Loop der CB die Referenz auf den Buffer als Argument (die Referenz befindet sich in dem data Event).