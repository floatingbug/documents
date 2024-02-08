# Element::before
**Fügt am Anfang, innerhalb eines Elements, Kontent hinzu.**
Damit etwas hinzugefügt werden kann, muss mit der CSS-Eigenschaft [[content]] ein Element erstellt werden.

**Beispiel:**
**Beispiel:** Innerhalb des Elements mit der Klasse .box wird am Content Anfang dieses Elements Content hinzugefügt.
```css
.box {
}

.box::befor {
	content: '';
}
```

---

# Element::after
**Fügt am Ende, innerhalb eines Elements, Kontent hinzu.

**Beispiel:**
**Beispiel:** Innerhalb des Elements mit der Klasse .box wird am Content Anfang dieses Elements Content hinzugefügt.
```css
.box {
}

.box::after {
	content: '';
}
```


---

# : oder ::
Beides Funktioniert aber seit CSS3 sind zwei Doppelpunkte spezifiziert, also **::** .

---

# Pseudo-Element funktionieren nicht bei Bilder

---
