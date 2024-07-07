
# Properties

### @keyframes
**Gibt an, von wo die Animation gestartet wird und wo sie beendet wird.**

**Beispiel:** Erhält ein Element den Animationsname, wird die Animation bei diesem Element angewendet.
mit from wird der Start der Animation bestimmt und mit to das Ende.
```css
@keyframes Animationsname {
	from{
		transform: translateX(-300px);
	}

	to{
		transform: translateX(0);
	}
}
```

Es können auch Prozentangaben gemacht werden
 ```css
@keyframes Animationsname {
	0%{
		transform: translateX(-300px);
	}

	50%{
		transform: translateX(0);
	}

	100%{
		transform: translateX(-300px);
	}
}
```
### animation
**Enthält als Wert den Animationsnamen der im @keyframes-Property angegeben wurde.
```css
.some-element{
	animation: Animationsname
}
```

### animation-duration
**Dauer der Animation.
```css

```

### animation-timing-function
**Beschleunigungsverhalten
```css

```

### animation-delay
**Animation wird erst ausgefürht wenn der Zeitwert, der animation-delay zugewießen wurde, abgelaufen ist.
```css

```

### animation-iteration-count
**Legt fest, wie oft die Animation abgespielt werden soll.**
```css

```

### animation-direction

```css

```

### animation-fill-mode
**Legt fest, welche Eigenschaften das Element am Ende der Animation haben soll. Bei dem Wert forwards erhält das Element die letzten Eigenschaften, die in @keyframes angegeben wurden.**

Beispiel: Am ende der Animation behält some-element den Wert translateX(0) bei. Ohne forwards würde some-element, am Ende der Animation, wieder den Wert translateX(-300px) bekommen.
```css
@keyframes Animationsname {
	from{
		transform: translateX(-300px);
	}

	to{
		transform: translateX(0);
	}
}

.some-element{
	animation-fill-mode: forwards;
	animation: Animationsname 500ms;
}
```

### Kurzschreibweise
```css
.some-element{
	animation: Animationsname dauer animation-timing-function animation-delay animation-iteration-count animation-direction animation-fill-mode
}
```
