var http = require('http');
var express = require('express');
var app = express();
//http.createServer gibt http-server mit callback-function zurück. request-, response-object 
//werden der callback-function bei jedem request übergeben.
//Im request-object befindet sich der request header, im response-object der response-header.
//app ist die callback-function.
var http_server = http.createServer(app);

//bekommt http_server ein request mit switching-protocolls im header (101), dann sendet der http-server
//automatisch einen response mit einer bestätigung im response-header (Konstruktor verändert http_server).
//Der http-server holt nicht länger die Daten vom socket, sondern der websocket-server (io) holt sich diese.
var io = require('socket.io')(http_server);




//http_server.listen() erstellt einen serverSocket, der bei erfolgreichem tcp-aufbau
//ein Socket für die Verbindung erzeugt. Das Server-Programm erzeugt eine Schleife, in der 
//es darauf wartet, bis der serverSocket ein socket erstellt hat. Wurde ein socket erstellt, 
//sendet das OS die socket-id an den Prozess bzw. an die Funktion die sich in einer Schleife 
//befindet. Die Schleife wird dann beendet und die Funktion gibt die Socket-ID zurück.
//Mithilfe der Socket-ID kann der Server-Prozess in den Socket Schreiben und aus ihm Lesen.
http_server.listen(8000);

//-----Broadcasting-----//
//-> Nachricht an alle User senden.
//      3 Möglichkeiten: an alle User mit io.sockets.emit, an User in einem Namespace,
//      oder an User in einem bestimmten Room.
//-> Nachricht an alle senden auser an den der an den Server gesendet hat und somit den
//      Broadcast ausgelöst hat socket.broadcast.emit()
//
