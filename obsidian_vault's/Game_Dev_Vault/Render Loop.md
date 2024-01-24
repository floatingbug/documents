In einem Render Loop werden alle Objekte in einer stage aktuallisiert und dann auf dem Bildschirm gezeichnet (gerendert). Dieser Vorgang wird dann immer wieder wiederholt.

### Was passiert in einem Frame (ein durchlauf des Render Loops)?
##### Running Ticker Callbacks
- Berechnen wie viel Zeit seit dem letzten Frame vergangen ist.
	- Diese Zeit wird dem Callback des Tickers übergeben.

##### Updating the Scene Graph
- Alle Objekte des Scenen Graph, bspw. sprites und text.

##### Rendering the Scene Graph
- Alle Objekte des scene-graph (app.stage) werden vom ersten Objekt (dem root-object), bis zum letzten Objekt gerendert (gezeichnet).

[[Beispiel 1]]
