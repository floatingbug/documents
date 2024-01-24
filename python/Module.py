#-> Hauptblock eines Modules
	#-> Alle Anweisungen die nicht eingerückt sind.
#thirt-party-libraries sind ebenfalls Module, die in Ordner mit dem Namen site-packages gespeichert werden.
#system-packages sind Module, die Teil der standart-librarie von Python sind.
#Mit dir() lassen sich alle, in den RAM geladene, Module anzeigen.
#modules sind Datein mit der Endung .py und beinhalten bspw. Funktionen.
#In der sys.path Variable stehen die Pfade zu den Modulen.
#Zuerst sucht der interpreter bei einem import in dem aktuellen Verzeichnis
#nach dem Modul, dann in dem sys.path eingetragenen pfaden
#und dann im default Pfad.
import sys
for dir in sys.path:
    print(dir)

#mögliche Ausgabe
#/usr/lib/python3.2
#/usr/lib/python3.2/plat-linux2
#/usr/lib/python3.2/lib-dynload
#/usr/local/lib/python3.2/dist-packages
#/usr/lib/python3/dist-packages

#In PYTHONPATH eingetragene Pfade werden sys.path hinzugefügt.
export PYTHONPATH=/pfadZuDemPaket:$PYTHONPATH

#Das Modul sys enthält Funktionalität, die mit dem Python-Interpreter
#selbst und dessen Umgebung zu tun hat.
#Das heißt: Auch wenn sys nicht importiert wird, wird das Module verwendet.

#Wird das python-programm über den Kommandozeileninterpreter aufgerufen,
#werden übergebene Argumente in sys.argv gespeichert.
# $Python programm.py argument1 argument2

#Immer wenn der Python-Interpreter ein module aufruft, erstellt er
#bestimmte Variablen wie __name__, in der immer der Name des modules steht, dessen Hauptblock zuletzt aufgerufen wurde.
#Das erste module das aufgerufen wird, ist das main-mudule.
#Der Interpreter erstellt für dieses module die Variable
#__name__ mit dem Inhalt "__main__", also ein String.

#herausfinden wo sich ein Modul befindet
>>> import numpy
>>> numpy.__file__
#mögliche Ausgabe
#'/usr/lib/python3/dist-packages/numpy/__init__.py'

>>> import math
>>> math.__file__
#Traceback (most recent call last):
#  File "<stdin>", line 1, in <module>
#: 'module' object has no attribute '__file__'
# math ist ein c-modul und in dem interpreter implementiert

#*******************
#module importieren
#*******************
#Datei: hallo.py
def sag_hallo:
    print("hallo")

#Datei: main.py
import hallo
    hallo.sag_hallo

#******
#Pakete
#******
#Mehrere Module könen in Pakete (packages) zusammengefasst werden
#In dem packege (einfach ein Verzeichnis) muss die Datei __init__.py
#enthalten sein. Sie kann leer sein oder in ihr kann code stehen, der
#beim importieren des packages ausgeführt wird.

#Datei: main.py
from simplePackage import a, b
a.hallo_a()
b.hallo_b()

#Im Ordner simplePackage liegen die Dateien/modules: a.py, b.py, __init__.py
#Datei: a.py
def hallo_a():
    print("hallo von modul a")

#Datei: b.py
def hallo_b():
    print("hallo von modul b")

#Durch den eintrag kann man die module mit einem einfachen import importieren
#Datei: __init__.py
import simplePackage.a
import simplePackage.b

#Datei: Main.py
import simplePackage
    simplePackage.a.hallo_a()
    simplePackage.b.hallo_b()

#####
#pip
#####

#-> pip Akronym für "pip installs packages"

#listet alle installierten module auf.
#-> $pip list

#Speichern der benötigten module in einer Textdatei.
#-> $pip freeze listeDerModule.txt

#aus einem requirement-file alle modules installieren.
#-r steht für requirement-file
#pip installs -r filename.txt
