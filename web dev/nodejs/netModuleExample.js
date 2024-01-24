const net = require('net');

//Die äußere cb wird jedes mal aufgerufen, wenn eine tcp-verbindung aufgebaut wurde.
//Als parameter wird dieser cb der socket übergeben, über den der datenaustausch statt findet.
//Daher wird erst nachdem ein socket erstellt wurde, die äußere cb aufgerufen und der socket wird
//dieser als parameter übergeben.
//Für jeden socket wird eine instanz der inneren cb erstellt und diese instanz der inneren cb ist dann
//für den datentransver verantwortlich.
//Das heißt, werden daten in den socket geschrieben, wird die innere cb aufgerufen und die daten als
//parameter der inneren cb übergeben.
//Zusammengefasst: die äußere cb wird also nur aufgerufen, um instanzen der inneren cb zu erzeugen.
const server = net.createServer((socket)=>{
	socket.on('data', (data)=>{
		console.log(data.toString())
		socket.end();
	})
})

//erstellung des serverSocket.
server.listen(8000)
