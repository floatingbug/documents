
# Responsive

### Breakpoints

**Beispiel:** Ab dem breakpoint `sm` wird die breite auf 4 gesetzt.
```html
<div class="w-16 sm:w-4"></div>
```

- Auf jede klasse können breakpoints als prefix angegeben werden, bspw. `sm`.

### Container

**Beispiel:** Container horizontal Zentrieren.
```html
<div class="container mx-auto">
	<div></div>
</div>
```

### Eigene CSS-Klassen erstellen

**Beispiel:** 
```css
.ownClass-button {
	@apply px-4 py-2 text-black rounded;
}
```

