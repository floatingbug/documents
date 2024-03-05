**ist ein Objekt, das beim scrollen Elemente überprüft, ob diese in einem bestimmten Bereich des Viewports (Anzeigefenster des Browsers) sind oder nicht. Alternativ kann auch ein Rootelement statt des Viewports genutzt werden, dann wird das Element geprüft, ob es sich in einem bestimmten Bereich des Rootelements befindet.**

Das Objekt IntersectionObserver enthält eine Callback. Diese Callback wird immer aufgerufen, wenn sich ein Element in einem bestimmten bereich im Viewport oder Rootelement befindet oder nicht. Die Callback hat ein Parameter, dem alle Elemente, die im bestimmten Bereich eintreten oder verlassen, als Argument übergeben werden. Der Name des Parameters ist beliebig. Der Parameter ist immer ein Array, auch wenn ein Element übergeben wird, das sich in keinem Array befindet.

Beispiel: 
```javascript
const element = document.querySelector(".classname");

const observer = new IntersectionObserver((entries)=>{
	console.log(entries);
});

//Das Element, das beim scrollen überprüft werden soll. Dieses Element wird der Callback als Argument übergeben, wenn das Element in einem bestimmten Bereich eintritt.
observer.observe(element); 
```

---

# Options
**Der zweite Parameter des IntersectionObserver ist ein Objekt mit Optionen das optional übergeben werden kann.**

### root
Alternativ zu dem Viewport kann auch ein root-Element angegeben werden, in dem dann geprüft wird, ob sich das jeweilige Element in einem bestimmten bereich des root-Elements befindet. Der Standartwert ist null.

### threshold
Wert von 0 bis 1. Gibt an, wie viel vom Element im bestimmten Bereich sichtbar sein muss, damit die Callback ausgelöst wird. bei dem Wert 1 muss sich das komplette Objekt im Bereich befinden, bei einem Wert von 0.1 reichen 10% aus.

### rootMargin
Der Bereich in dem Elemente sein müssen, um die Callback auszulösen, kann mit rootMargin verkleinert werden. Die Einheiten px und % sind erlaubt. bei rootMargin: "-100px"; wird der Bereich oben und unten um 100px verkleinert.

Beispiel:
```javascript
const element = document.querySelector(".classname");
const options = {
	threshold: 1,
	rootMargin: "-100px"
};

const observer = new IntersectionObserver((entries)=>{
	console.log(entries);
}, options);

observer.observe(element);
```