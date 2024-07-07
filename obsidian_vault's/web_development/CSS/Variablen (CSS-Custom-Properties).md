# :root Selektor

CSS-Variablen werden im :root Selektor definiert. Dadurch sind sie im gesamten Dokument verfügbar, da der :root Selektor dem HTML-Element entspricht.

```css
:root {
    --primary-color: #3498db;
    --secondary-color: #2ecc71;
    --accent-color: #e74c3c;
    --base-font-size: 16px;
}
```

## Variablen verwenden

Variablen werden mit der var() Funktion verwendet.

```css
body { 
	font-size: var(--base-font-size); 
	color: var(--primary-color); 
} 

h1 { 
	color: var(--accent-color); 
} 

.secondary { 
	background-color: var(--secondary-color); 
}
```

```css

```
