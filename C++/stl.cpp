/*
-> stl steht für standart template libraries
-> Sind template Klassen
-> Diese Klassen dienen zur Erstellung von Datenstrukturen wie arrays,
  lists, stacks... .
-> Ist also eine library aus container-Klassen aber auch functions,
  iterators, algorithms.
->
*/

//vector//
/*
vector<T> v; Deklariert v als leeren vector, der Daten vom Typ T aufnimmt.
vector<T> v(n); Deklariert v als vector, der bereits n default-konstruierte Elemente vom Typ T enthält.
vector<T> v(n, val); Deklariert v als vector, der bereits n Elemente vom Typ T mit dem Wert val enthält.

v[n]; Repräsentiert das n. Element in v (ohne zu prüfen, dass n existiert).
v.at(n); Repräsentiert das n. Element in v (prüft, ob n im erlaubten Bereich liegt).
v.size(); Liefert die Anzahl aller Elemente in v.
v.capacity(); Liefert die Anzahl der Elemente die in v gespeichert werden können.
v.reserve(n); Setzt die Anzahl der Elemente von v auf n.
v.push_back(val); Fügt die Daten aus val ans Ende von v an.
v.pop_back(); Entfernt das letzte Element aus v.
v.front(); Liefert eine Referenze auf das erste Element in v.
v.back(); Liefert eine Referenze auf das letzte Element in v.
vcp = v; Erstellt vcp als eine Kopie von v.
v.clear(); Entfernt alle Elemente aus v; leert v.

v.begin(); Liefert einen iterator vom ersten Element in v
v.end(); Liefert einen iterator vom letzten Element in v (genaugenommen das Element nach dem letzten Element)
v.erase(i); Entfernt das Element i aus v.
v.insert(i, val); Fügt ein neues Element mit dem Wert val vor das Element i in v ein.
*/
#include <vector>

std::vector<int> v(10);
