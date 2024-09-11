
# Eigenschaften
- Alle flex-items passen sich dem verfügbaren Platz des flex-containers an.
- Ist im flex-container, flex-direction: row; eingestellt, wachsen und schrumpfen die flex-items nur horizontal. Bei flex-direction: column; wachsen und schrumpfen die flex-items nur vertikal.

## flex-basis

**Beispiel:** Ein Element mit flex-basis: 200px; hat folgende Eigenschaften:

- Element wird erst kleiner, wenn im flex-container für das Element weniger Platz ist als 200px.
- Element wächst ab 200px.
- Wenn im flex-container die Eigenschaft flex-wrap: wrap; gesetzt ist, wird das Element auf der nächsten Zeile springen, sobalt für das Element weniger Platz als 200px vorhanden ist.

