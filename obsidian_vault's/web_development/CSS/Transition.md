### Was sind Transitions (Übergänge)
**Um Übergänge von einem Zustand in den Nächsten zu definieren.**
Elemente haben bspw. folgende Zustände: Normalzustand, Hover-Zustand, Acriv-Zustand usw.

---

### CSS Transition Eigenschaften
#### transition-duration 
**Legt fest, wie lange der Übergang dauert.**

**Beispiel:** Das Element wird Aktiv, wenn sich der Mauszeiger über diesem befindet (hover). Im Aktiven zustand ist das Element weis, aber der übergang vom Normal-Zustand in der Aktiv-Zustand dauert 500ms, wodurch das Element über die Zeit immer mehr die Farbe Weis annimmt.
```css
.box {
	background-color: black;
	transition-duration: 500ms;
}

.box:hover {
	background-color: white;
}
```

#### transition-property
**Legt fest, welche Eigenschaft beim Übergang betroffen ist.**

**Beispiel:** Es gibt kein Übergang von Schwarz zu Weis, nur die Breite erhält ein Übergang.
```css
.box {
	width: 300px;
	background-color: black;
	transition-duration: 500ms;
	transition-property: width;
}

.box:hover {
	background-color: white;
	width: 500px;
}
```

#### transition-timing-function
**Legt die Beschleunigung und das langsammer werde der Übergänge fest.**

**Werte für transition-timing-function:** 
- **linear:** Überhang hat von Anfang bis Ende die gleiche Geschwindigkeit. 
- **ease-in:** Beschleunigt von Anfang bis Ende.
- **ease-out:** Wird immer langsammer.
- **ease-in-out:** Kombination aus ease-in und ease-out.
- **Eigene Werte erstellen: Möglich im Browser.**

**Beispiel:** Die Geschwindigkeit des Übergangs ist linear.
```css
.box {
	width: 300px;
	transition-duration: 500ms;
	transition-timing-function: linear;
}

.box:hover {
	width: 500px;
}
```

#### transition-delay
**Legt fest, wie lange der Übergang verzögert werden soll.**

**Beispiel:** Erst in 100ms beginnt der Übergang.
```css
.box {
	width: 300px;
	transition-duration: 500ms;
	transition-delay: 100ms;
}

.box:hover {
	width: 500px;
}
```

#### transition
**Kurzschreibweise für alle transition Eigenschaften.**

**Syntax der transition Eigenschaft (ohne Anführungszeichen):**
transition: "duration" "delay (optional)" "timing (optional)" "Element", "nächster Übergang ist durch ein Komma getrennt"

**Beispiel:** Erst in 100ms beginnt der Übergang.
```css
.box {
	transition: 500ms 100ms ease-in transform
}

.box:hover {
	transform: rotate(30deg);
}
```