
**async function:**
- Gibt sofort ein Promise zurück.
- Promise wird auf fullfilled gesetzt, wenn etwas zurück gegeben wird.

**await:**
- Solange das Promise im zustand pending ist, wird die Funktion, in der await aufgerufen wurde pausiert.
- Ist das Promise im Zustand resolve oder rejected, fügt die JS-Engine den Code, der ab der Zeile await pausiert wurde, in die Microtask-Queue.

**Beispiel 1:**  fun_a gibt sofort ein Promise zurück, das aber nicht in result gespeichert wird, Stattdessen wird der code der Funktion fun_a, bis zu return "Hello Promise.", weiter ausgeführt.
Solange das Promise im Zustand pending ist, wird die Funktion, die fun_a aufgerufen hat, pausiert.
Bei return "Hello Promise." setzt die JS-Engine das Promise auf fullfilled und übergibt dem Promise den Wert, der von fun_a zurückgegeben wurde.
Dann wird der Code, nach der Zeile in der await steht, in die Microtask-Queue gespeichert. 
Wird der Code im Callstack aufgerufen, wird das Ergebnis von der engine aus dem Promise in result gespeichert und console.log(result) aufgerufen.
```javaScript
async function fun_a(){
	return "Hello Promise."
}

const result = await fun_a();
console.log(result);
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
