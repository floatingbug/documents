
**Beispiel:**
```javascript
  1 const net = require("net");
  2 
  3 const server = net.createServer((socket) => {
  4     socket.on("data", data => {
  5         console.log(data.toString());
  6         socket.end();
  7     });
  8 });
  9 
 10 
 11 server.listen(8001);
```

-  Hat libuv Daten aus dem socket gelesen, fügt libuv das IO-Event in die Event-Queue.
-  Wenn die Event-Loop das IO-Event verarbeitet, fügt die Evenl-Loop die Callback von createServer in den Call-Stack und übergibt ihr als parameter ein socket-object, das bspw. den fd des speichers enthält in dem libuv die daten aus dem socket gespeichert hat.
- Dieses socket-object registriert einen handler der aufgerufen wird, wenn das data-event behandelt wird. Dem handler wird als Parameter den Zeiger auf die daten übergeben.