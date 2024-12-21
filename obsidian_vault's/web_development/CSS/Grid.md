# Grid Container Element

Hat ein Element die Eigenschaft `display: grid`, werden die Kindelemente auf einem Raster angeordnet.
Das Raster besteht aus Zellen und jedes Kindelement wird einer Zelle zugeordnet.

# Grid Container-Eigenschaften

### Spalten

**Elemente zentrieren:** Elemente werden in ihren Zellen zentriert.

```css
.container {
	display: grid;
	place-items: center;
}
```

**Spaltenanzahl angeben:** Im Beispiel werden drei Spalten erzeugt. Es werden immer drei Elemente in einer Reihe dargestellt. Einheit ist fr (fraction), jedes Element ist 1/3 so breit, wie der grid-container.

```css
.container {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
}
```

**Spaltenanzahl mit repeat angeben:** Wie im oberen Beispiel werden drei Spalten erzeugt.

```css
.container {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
}
```

**Responsive:** Durch `auto-fit` werden soviele Spalten wie möglich erzeugt. Durch `minmax` darf eine Spalte nicht kleiner als 300px werden. Wird der grid-container kleiner als 600px, können zwei Spalten in einer Reihe nicht mehr dargestellt werden und die eine Spalte wird 1fr groß (gesamter verfügbarer Platz im Container).

```css
.container {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
}
```

### Zeilen

**Zeilenanzahl angeben:** Im Beispiel sollen die Zeilen 400px hoch sein. Durch auto-fit werden soviele Zeilen erzeugt, wie es notwendig ist.

```css
.container {
	display: grid;
	grid-template-rows: repeat(auto-fit, 400px);
}
```

### gap

**Beispiel:**
```css
.container {
	column-gap: 1rem;
	row-gap: 1rem;
}
```

### Elemente in den Zellen horizontal positionieren

**Element nimmt die gesamte Breite der Zelle an.**

**Beispiel:**
```css
.container {
	justify-self: stretch;
}
```

**Element steht horizontal am Anfang der Zelle.**

**Beispiel:**
```css
.container {
	justify-self: start;
}
```


**Element steht horizontal an Ende der Zelle.**

**Beispiel:**
```css
.container {
	justify-self: end;
}
```


**Element in der Zelle Zentrieren.**

**Beispiel:**
```css
.container {
	justify-self: center;
}
```


### Elemente in den Zellen vertikal positionieren

**Hat die selben Werte wie für justify-self.**

**Beispiel:**
```css
.container {
	align-self: stretch;
}
```

### justify- und align-self in einer Zeile

**Erstes Argument ist align-self, zweites Argument ist justify-self.**

**Beispiel:**
```css
.container {
	place-self: start end;
}
```

---

# Grid Kind-Elemente

```css
.container {

}
```

```css
.container {

}
```

```css
.container {

}
```

```css
.container {

}
```

```css
.container {

}
```