# Gradient

## linear-gradient

**Farbverlauf der farben findet auf einer Linie statt.**

**Beispiel:** Die Linie zwischen den Farbein ist bei 0 grad horizontal (farbe1 ist über farbe2), 90 grad vertikal (farbe1 ist links und farbe2 rechts), 180 grad (farbe1 ist unter farbe2)
```css
.background-wrapper {
	background: linear-gradient(180deg, <farbe1>, <farbe2>);
}
```

## radial-gradient

**Erste Farbe befindet sich kreisfürmicht in der mitte. Jede Folgende Farbe umgibt die vorige Farbe.**

**Beispiel:** Der erste Parameter gibt die Form an, bspw. circle.
```css
.background-wrapper {
	background: radial-gradient(circle at center, <farbe1>, <farbe2>);
}
```

---

# svg filter

---

