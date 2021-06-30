let net = require('net');

let sockets = [];

let server = net.createServer(function(socket){
  socket.name = socket.remoteAdress + ':' + socket.remotePort;
  sockets.push(socket);

  socket.write("hi " + socket.name + "\n");

  socket.on('data', function(data){

    console.log(data.toString());

    for(let i = 0; i < sockets.length; i++){
      if(sockets[i] == socket){
        return;
      }
      sockets[i].write(data);
    }
  });
});

server.listen(8000);

console.log("server running on pot: 8000");
