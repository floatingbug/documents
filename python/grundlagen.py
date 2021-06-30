#->Ausführung: python programm.py-->compiler-->bytecode-->pvm-->hw-cpu
    #->Der CPython compiler wird automatisch aufgerufen.
#->Es gibt andere Interpreter, die zusätzlich java oder anderen code ausführen können.
    #->Jython-Interpreter in Java geschrieben. ermöglicht zugriff auf Java-Klassen.
    #->CPython erstellt python-bytecode den die pvm ausführen kann. (wird automatisch aufgerufen).
#Nicht der bytecode kommuniziert mit der hw-cpu sondern der Interpreter bzw.
#die virtualmashine (virtual-cpu) des Interpreters.
#Die virtual-cpu versteht den bytecode und führt ihn mit hilfe der hw-cpu aus.
#Python ist nicht typenbasiert, der Typ muss zur Laufzeit ermittelt werden (mehr zeit benötigt).



#**************
#Variablen
#**************

#integer
int_variable = 1000

#float
float_variable = 3.333

#boolean
boolean_variable = True

#Strings
string_variable = "das ist ein string"

string_mit_mehreren_zeilen = """
    String
    mit mehreren
    zeilen.
"""

#Initialisierung mehrerer Variablen in einer zeile
#x = 22, y = 32, z = 1
x, y, z = 22, 32, 1

#x und y bekommen den gleichen Wert zugewiesen
x = y = 22

#Alle Typen, auch primitive, sind Instanzen (Objekte) von Klassen z.B. int
x = 5
print(type(x))
print(type(1.1))
print(type(True))
print(type(""))
#ausgabe: <class 'int'>
#         <class 'float'>
#         <class 'bool'>
#         <class 'str'>

#---------------------------------------------------------------------------
#Ein int-Objekt wird erstellt, x besitzt die Speicheradresse zu dem Objekt
x = 1

#garbage-collector löscht das Objekt (x = 1) ein neues wird erstellt
#und die Referenz in x gespeichert
x = x + 1

#Nach Aufruf von append wird kein neues Objekt erzeugt
x = [1, 2, 3]
x.append(4)
#---------------------------------------------------------------------------

#*******
#Strings
#*******
#len() zeigt Anzahl der Elemente an
string = "string"
liste = [1, 2, 3]
print(len(string))
print(len(liste))
#Ausgabe: 6, 3

vorname = "tom"
nachname = "tomson"
voller_name = f"{vorname} {nachname} {2 + 3}"
print(voller_name)
#Ausgabe: tom tomson 5

#Entfernt alle Leerzeichen am anfang und ende des Strings
string = "     das ist ein string";
print(string.strip());

#Strings können multipliziert werden.
print("Hello World")
print("*" * 10)
#****************************************************************************

#Konventieren int(), fload(), bool(), str()
x = "4"
x = int(x)

#User Eingaben
x = input("eine Zahl eingeben: ")
x = int(x);

#*************
#if-Bedingung
#*************

#if-Bedingung: Keine {}, stattdessen :, und einrücken für den code-block
x, y = 35, 33
if x<35:
    print("x ist kleiner")
elif x>y:
    print("x ist größer")
else:
    print("x und y sind gleich groß")

#Logische Operatoren statt: &&, ||, !, gibt es: and, or, not
name = ""
if not name:
    print("name is empty")

if 22 > 10 and 22 < 28:
    print("true")
#oder
if 22 > 10 < 28:
    print("true");

#************
#for-Schleife
#************
for x in "Python":
    print(x)

for x in [0, 1, 2, 3, 4]:
    print(x)

#Ausgabe 0, 1, 2, 3, 4
for x in range(5):
    print(x)

#Ausgabe 2, 3, 4
for x in range(2, 5):
    print(x)

#Nur gerade Zahlen werden Ausgegeben: 0, 2, 4, 6, 8
for x in range(0, 10, 2):
    print(x)

#Nach dem ersten Schleifendurchlauf wird die Schleife
#durch break abgebrochen, daher wird nur einmal print() ausgeführt
names = ["tom", "tomson"]
for name in names:
    if name.startswith("t"):
        print("Found")
        break

#**************
#while-Schleife
#**************
geraten = 0
zu_raten = 5

while zu_raten != geraten:
    geraten = int(input("Eingabe: "))

#**********
#Funktionen
#**********

#def steht für definition oder function-definition
def increment(number, by):
    return number + by

print(increment(1, 5))

#Multiple Argumente
#Übergebene Argumente werden in dem Parameter args als Tupel gespeichert
#Tupel können nur gelesen und nicht geschrieben werden
def multiply(*args):
    sum = 1
    for n in args:
        sum *= n

    print(sum)

multiply(4, 4, 4)

#Übergabe von key:value Paaren
#In args werden key:value Paare als Json gespeichert
def save_user(**args):
    print(args["id"])
    print(args["username"])

save_user(id=1, username="tomson")

#DocString: Steht in einer Funktion, Klasse oder Modul. Steht Immer
#in der ersten logischen Zeile(erste Anweisung).
#Erster Satz beschreibt, was z.B. eine Funktion tut. Der erste Satz
#beginnt mit einem Großbustaben und endet mit einem Punkt.
#Es folgt eine Leerzeile und dann die Beschreibung, wie die Funktion
#anzuwenden ist.
"""Die Funktion macht genau das.

Genaue Beschreibung der Funktion."""
#Über das Attribut __doc__ der Funktion, ruft man den docString auf.
print(__doc__.funtionsname)
#Oder
help(funktionsname)

#******
#Lists
#******

#elemente geordnet
#gleiche elemente mehrmals möglich
#index

#erstellung
example = []
example = list()
example = [23, "string", True, 23.33]

#*****
#sets
#*****

#elemente ungeordnet
#doppelte elemente nicht möglich
#kein index

#erstellung
example = set()
example.add(4.332)
example.add(False)
example.add([234.53, False, 343, "string"])
example.remove(343)

#*************
#dictionaries
#*************

#erstellung
example = {"userid": 392, "message": "this is a message"}
#beim Aufruf des Konstruktors werden, für die keys, keine Anführungszeichen benutzt.
example = dict(key1=value1, key2=value2)
example["key3"] = value3
