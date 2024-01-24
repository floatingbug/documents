##### Renderer:
- Zeichnet den scene graph auf den Bildschirm.
- Nutzt WebGL für das Zeichnen.

##### Scene Graph
- Wird auch als stage bezeichnet.
- Enthält alle Elemente, die aktuallisiert und vom renderer dargestellt werden sollen.
#stage #scene-graph
#### Container:
- Können mehrere Objekte enthalten, bspw. mehrere sprites.
	- Alle objekte verhalten sich dann gleich. Wird die Rotation des Containers verändert, ändert sich die Rotation bei allen Objekten des Containers.
- Kann als Element/Objekt einem scene-graph/stage hinzugefügt werden.
#container
#### Loader:
- Läd asynchron Resourcen wie bspw. Audio und Bilddateien.
- Loader ist veraltet, stattdessen wird Assets genutzt.
#### Ticker:
- Führt die Spiel-Logik einmal pro Frame aus.

#### Application:
- Ist ein Helper-Object.
- Beinhaltet: Renderer, Loader und Ticker.

#### Interaction:
- Für berührungs- als auch mausbasierte Interaktionen.
- Macht Objekte anklickbar, bspw. Hover-Events.
