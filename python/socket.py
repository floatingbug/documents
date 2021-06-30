#!/usr/bin/python3

import socket

#################
#Server Beispiel
#################

ss = socket.socket()
port = 8000

ss.bind(('', port))

#listen() erstellt den Server-Socket.
ss.listen(5)

#accept() erzeugt eine Schleife in der der Server-Socket
#nach erfolgreichen TCP-Verbindungen abgefragt wird.
#Wurde eine aufgebaut, erzeugt das OS einen Socket für 
#die Verbindung und die Schleife wird verlassen.
#accept() gib ein Socket-Objekt zurück, mit dem
#auf den OS-Socket zugegriffen werden kann.
#Außerdem wird die IP-Adresse des Clients zurückgegeben.
s, addr = ss.accept()
print(addr)

#recv() erzeugt eine Schleife, die immer verlassen wird, wenn
#die angegebene Menge an Daten im Socket vorhanden ist.
#Dann wird die Schleife verlassen und die Daten werden von
#recv() zurück gegeben.
#Wird die TCP-Verbindung getrennt, befindet sich im Socket
#ein leerer Byte-String den recv() zurück gibt.
while True:
	data = s.recv(7000)
	if not data:
		break
	s.sendall(data)

s.close()

