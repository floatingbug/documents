
# **Der Referenzpunkt eines Elements**:

- Standardmäßig ist der Referenzpunkt eines Elements (auch als Transformations-Ursprungspunkt bekannt) die obere linke Ecke des Elements. Dieser Punkt ist der Ausgangspunkt für jede `transform`-Operation wie `translate`, `rotate`, `scale` usw.

---

# transform: translate()

- Mit `transform: translate(X, Y)` kann ein Element entlang der X- und Y-Achse verschoben werden. Die Verschiebung erfolgt relativ zu der Position, die das Element ohne `transform` hätte.
- Wenn `transform: translate(-50%, -50%)` angewendet wird, verschiebt sich das Element um 50% seiner eigenen Breite nach links (X-Achse) und um 50% seiner eigenen Höhe nach oben (Y-Achse).

**Beispiel:** 
```css
.el{
	transform: translate(-50%, -50%)
}
```
