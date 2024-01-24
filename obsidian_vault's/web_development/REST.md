## Einführung

- REST steht für Representational State Transfer.
- Daten und Funktionalitäten werden als Ressourcen angesehen.
	- Werden vom Client durch eine URI (Uniform Resource Identifier) aufgerufen.
- Menge an Operationen um Ressource zu bearbeiten.
	- GET: Ruft eine Ressource ab.
	- POST: Erstellt eine Ressource.
	- PUT: Ändert eine Ressource.
	- DELETE: Entfernt eine Ressource.
- Darstellung der Ressourcen in verschiedenen Formaten.
	- HTML, XML, JSON usw.
- Zustandslos: Der Server speichert keine Zustände, die der Client hervorgerufen hat.

---

## Anwendung
### Beispiel: 
1. Eine Ressource wird über eine URI aufgerufen
2. Dadurch wird aus einer Datenbank Daten abgefragt.
3. Diese Daten werden in ein Representationelles Format, bspw. JSON umgewandelt und an den Client versendet.
	- Dafür steht das R in REST, da die Daten in Representative Daten umgewandelt werden, bevor diese an den Client gesendet werden.
	- Der Server sendet somit den Aktuellen Zustand (State Transfer).

- Zusammengefasst: Bei einer API-Anfrage sendet der Server in Representativer Form, bspw. JSON, den aktuellen Zustand. 

---

## Bedingungen
#### API-Key
- muss bei jedem API-Request mit gesendet werden.

#### HTTP-Header

---

