
# Partikel Bewegung entgegengesetzt der Mausposition


Erst müssen die richtigen Vektoren berechnet werden (Vektor für hozizontale und Vektor für vertikale Bewegung). Dann ändert man particle.x und particle.y mit diesen Vektoren. Damit die Maus und das Partikel sich immer auf eine Linie befinden (wärend der änderung von particle.x und particle.y), benötigt man die vektoren. 

**Vektoren berechnen**

- Mit dem Arkustangens berechnet man den Winkel Apha.
	- Math.atan2(x, y) gibt den Winkel im Boganmaß zurück, von -π bis +π. Bei einem Winkel von 135° wäre das  3/4π, 3/4π sind ungefär 2.3561945. Bei einem Winkel von 225° wäre das 5/4π aber atan2 gibt nur Werte von -π zu π zurück. atan2 würde -3/4π zurück geben, was ebenfalls einen Winkel von 225° entspricht und somit auch 5/4π. Der Wert -3/4π ist ungefär -2.3561945.
- Horizontaler Vektor: sin(alpha).
- Vertikaler Vektor: cos(alpha).

Beispliel: Vektor x := 0,2 (sinus) und Vektor y := 0,8 (cosin).
- Das heißt, dass die Ankathete 0,2 mal so groß ist wie die Hypotenuse und die Gegenkathete ist 0,8 mal so groß wie die Hypotenuse.
- Wenn 
- Dann wird zum Partikel addiert: p.x = x; und p.y = y.
- Dadurch befinden sich die Mausposition und das Partikel auf dem Radius.

**3. **Zusammenfassung der Schritte:**

1. **Berechne den Winkel:** Verwende `Math.atan2(mouse.y - p.y, mouse.x - p.x)`, um den Winkel zwischen dem Partikel und der Maus zu berechnen.
    
2. **Berechne die Verschiebung:** Verwende `Math.cos(angle)` und `Math.sin(angle)` für den berechneten Winkel, um die Verschiebung in x- und y-Richtung zu berechnen.
    
3. **Update der Position:** Ziehe die berechnete Verschiebung von der aktuellen Position des Partikels ab, um die neue Position zu berechnen.
    

**Beispielcode:****

```javascript
function particleMouseInteraction(particles, maxDistance, mouse) {    
    particles.forEach(p => {                                         
        const dx = mouse.x - p.x;                                    
        const dy = mouse.y - p.y;                                    
        const distance = Math.sqrt(dx * dx + dy * dy);
        
        if (distance <= maxDistance) {                                 
            const angle = Math.atan2(dy, dx); // Berechnung des Winkels
            p.x -= Math.cos(angle); // Verschiebung in x-Richtung
            p.y -= Math.sin(angle); // Verschiebung in y-Richtung
        }
    });
}
```

In diesem Code:

- `Math.atan2(dy, dx)` berechnet den Winkel zwischen dem Partikel und der Maus.
- `Math.cos(angle)` und `Math.sin(angle)` berechnen die Verschiebung in x- und y-Richtung basierend auf diesem Winkel, um die Bewegung des Partikels zu bestimmen.

Durch die Anwendung dieser Konzepte kannst du effektive Partikelbewegungen in deinem Projekt erstellen.