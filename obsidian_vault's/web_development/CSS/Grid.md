# Grid Container Element

Hat ein Element die Eigenschaft `display: grid`, werden die Kindelemente auf einem Raster angeordnet.
Das Raster besteht aus Zellen und jedes Kindelement wird einer Zelle zugeordnet.

# Grid Container-Eigenschaften

## Spalten

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

**Responsive:** Durch `auto-fit` werden soviele Spalten wie möglich erzeugt. Durch `minmax` darf eine Spalte nicht kleiner als 300px werden. Wird der grid-container kleiner als 600px, können zwei Spalten in einer Reihe nicht mehr dargestellt werden und die eine Spalte wird 1fr groß.

```css
.container {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
}
```

## Zeilen

**Zeilenanzahl angeben:** Im Beispiel sollen die Zeilen 400px hoch sein. Durch auto-fit werden soviele Zeilen erzeugt, wie es notwendig ist.

```css
.container {
	display: grid;
	grid-template-rows: repeat(auto-fit, 400px);
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