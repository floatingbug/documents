
**Beispiel 1:** Wenn das Schlüsselwort `await` vor einer Funktion steht (z.B. `asynchroneFunktion`), die ein Promise zurückgibt, wird der nachfolgende Code erst ausgeführt, wenn das Promise entweder erfüllt  oder abgelehnt wurde, also wenn `resolve`  oder `reject` aufgerufen wurde.
```javaScript
async function asynchroneFunktion(){}

const result = await asynchroneFunktion();
```

**Beispiel 2:** Die Funktion foo ersetzt die Händler-Funktion, die man normalerweise then() übergibt und in der definiert wird, was geschehen soll, wenn die asynchrone Funktion einen Wert zurückgegeben hat.
```javascript
async function foo() {
    try {
        const result = await asynchroneFunktion();
        console.log(result); // Wird ausgeführt, wenn das Promise erfüllt ist.
    } catch (error) {
	    console.error(error); // Wird ausgeführt, wenn das Promise abgelehnt                                      wird.
    }
}

function asynchroneFunktion() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve("Hello, Promise!");
            // Oder, um einen Fehler zu simulieren:
            reject(new Error("Something went wrong!"));
        }, 1000);
    });
}

foo();
```

In diesem Beispiel:

- `foo` ist eine asynchrone Funktion, die `await` verwendet, um auf das Ergebnis von `asynchroneFunktion` zu warten.
- `asynchroneFunktion` gibt ein Promise zurück, das nach einer Sekunde entweder erfüllt wurde  (`resolve("Hello, Promise!")`) oder abgelehnt (`reject(new Error("Something went wrong!"))`) wird.
- Der `try`-Block in `foo` fängt das Ergebnis ab, wenn das Promise erfüllt ist, und der `catch`-Block fängt den Fehler ab, wenn das Promise abgelehnt wird.

**Beispiel 3:** Eine Funktion die mit async definiert wurde, gibt immer ein Promise zurück.
Wenn fun_b ausgeführt wird, sorgt die JavaScript-Engine dafür, dass ein Promise zurück gegeben wird und erst wenn fun_b etwas zurück gibt, ist das Promise erfüllt. Daher wird fun_a, an der stelle an der fun_b aufgerufen wird, erst fortgesetzt, wenn fun_b etwas zurück gibt. 
```javascript
async fun_a(){
	try{
		const result = await fun_b();
	}
	catch(err){
		console.log(err)
	}
}

async fun_b(){
	return "some return data"
}
```
