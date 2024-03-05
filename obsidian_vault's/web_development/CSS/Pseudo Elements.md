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

# :is(), :where(), :has()

## :is()
**Alle Elemente einer Klasse werden selektiert, die als Argument an :is() übergeben wurden.**

Beispiel:
```css
.classname :is(h1, a){
	color: red;
}
```

## :has()
**Alle Elemente einer Klasse werden selektiert, wenn diese Eelemente enthalten, die :has() als Argumente übergeben wurden**

Beispiel:
```css
.classname :is(a){
	color: red;
}
```

