#Datenstrukturen-> Strukturen um Ansammlung verwanter Daten zu Speichern.
#Es gibt drei solcher Strukturen in Python: Listen, Tupel, Dictionaries (Wörterbücher).

#######
#Listen
#######

#Listen sind Datenstrukturen die Objekte, angeordnet als Abfolge (Sequenz), Speichern.
einkaufsliste = ["Aepfel", "Mangos", "Karotten", "Bananen"]
print(len(einkaufsliste)) #Ausgabe: 4.

for ding in einkaufsliste:
    print(ding)             #Ausgabe: Aepfel, Mangos, Karotten, Banane.

einkaufsliste.append("Reis")
print(einkaufsliste)            #Ausgabe: ["Aepfel", "Mangos", "Karotten", "Bananen", "Reis"].

#Entfernt Objekt an Stelle 2, also Karotten.
del einkaufsliste[2]

######
#Tupel
######

#Wie Listen nur unveränderlich.
zoo = ("Wolf", "Elefant", "Pinguin")

#Verkettete Tupel-> ("Affe", "Delfin", ("Wolf", "Elefant", "Pinguin"))
zoo_neu = ("Affe", "Delfin", zoo)

#Zugriff auf erstes Tupel zweites Element.
print(zoo_neu[1]) #Ausgabe: Delfin.

#Zugriff auf zweites Tupel zweites Element.
print(zoo_neu[2][1]) #Ausgabe: Elefant.

for i in range(0, 2):
    print(zoo_neu[i]) #Ausgabe: Affe, Delfin.

for i in range(0, 3):
    print(zoo_neu[2][i]) #Ausgabe: Wolf, Elefant, Pinguin.

##################
#Tupel und print()
##################

name = "Tom"
age = 55
print("Name: %s, age: %d" % (name, age))
#Ausgabe: Name: Tom, age: 55

print("age: %d" % age)
#Ausgabe: age: 55

############################
#Dictionaries (Wörterbücher)
############################

#Alle erstellten dictionaries sind Objekte der Klasse dict.
d = {
    'schluessel1': 'wert1',
    'schluessel2': 'wert2',
    'schluessel3': 'wert3'
}

#Key:value hinzufügen
d["Schluessel4"] = "wert4"

#key:value entfernen
del d["schluessel2"]

for schluesse, wert in d.items(): #item() gibt jeweils Schlüssel/Wert-paar zurück.
    print("Schlüssel: %s, Wert: %s" % (schluesse, wert))
