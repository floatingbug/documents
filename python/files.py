###############
#Dateien öffnen
###############

#Damit Dateien editiert werden können, müssen sie vorher
#geöffnet werden.

myFile = open('myFile.txt')

#open wird ein zweiter Parameter übergeben, um zu spezifzieren, wie
#die Datei editiert werden soll (read, write, binary).
#binary wird benutzt, wenn es sich nicht um .txt Dateien handelt und
#mit binären Dateien gearbeitet werden soll.

#read mode
myFile = open('myFile.txt', 'r')
myFile = open('myFile.txt')

#write mode
myFile = open('myFile.txt', 'w')

#binary mode
myFile = open('myFile.txt', 'b')

#Wenn eine Datei geöffnet ist, muss sie auch wieder geschlossen werden.
myFile.close()

#Aus Datei lesen
myFile = open('myFile.txt', 'r')
content = myFile.read()
print(content)
myFile.close()

#Ließt von einer Datei erst 8 byte, dann 4, byte.
#Als letztes wird der rest der Datei gelesen (kein Argument wird übergeben).
#Nachdem alles aus der Datei gelesen wurde, kann man nicht weiter aus der Datei lesen,
#da das ende (end of line) der Datei erreicht hat.
print(myFile.read(8))
print(myFile.read(4))
print(myFile.read())

#Speichert jede einzelne Zeile als Element in eine liste
myFile = myFile.readlines()
