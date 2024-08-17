
**Beispiel:** Das Bild nimmt die gesamte Breite des Elternelements ein. Durch `height: auto` wird die Höhe des Bildes automatisch eingepasst, sodass das bild nicht gestaucht wird.

```css
.image {
	width: 100%;
	height: auto;
}
```

## Die eigenschaft object-fit

**Beispiel:** Das Bild behält seine Originalgröße. Durch `object-fit: cover` wird das Bild zentriert und alles was über dem Elternelement hinausragt, wird nicht dargestellt. Dadurch wird nur das dargestellt, was sich in der Mitte des Bildes befindet, wenn das Bild größer ist als das Elternelement. 

```css
.image {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
```