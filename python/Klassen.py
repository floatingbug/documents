class User:
    pass

user1 = User()

#bestehende Objekte können Felder und Methoden hinzugefügt werden
user1.name = "tomson"

#***********
#Konstruktor
#***********





class User2:
    def __init__(self, full_name, birthday):
        self.name = full_name
        self.birthday = birthday

    def multiply(self, a, b):
        print(a*b)

# Die variable erhält die Adresse zum erstellten Objekt. Diese Adresse wird der Klasse User2
# bzw. der __init__ Funktion übergeben und zwar über den Parameter self.
# Alle Variablen werden, Mithilfe der Adresse/Refferenz, im neu erstellten Objekt gespeichert.
user5 = User2("tom tomson", "09.01.1984")

#Aufruf einer Objekt-Methode
user5.multiply(2, 2)
#Der Kompiler ersetzt den oberen Code in den Unteren
User2.multiplay(user2, 2, 2)
#  |               |
#  |               Referenz zu dem Objekt
#  |
#  Referenz zum Klassen-Objekt

# Bei jedem Objekt-Aufruf wird das Klassen-Objekt aufgerufen und die Adresse/Referenz von
# dem Objekt an das Klassen-Objekt übergeben.
