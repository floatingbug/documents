
**async function:**
- Gibt sofort ein Promise zurück.
- Promise wird auf fullfilled gesetzt, wenn etwas zurück gegeben wird.

**await:**
- Solange das Promise im zustand pending ist, wird die Funktion, in der await aufgerufen wurde pausiert.
- Ist das Promise im Zustand resolve oder rejected, fügt die JS-Engine den Code, der ab der Zeile await pausiert wurde, in die Microtask-Queue.

**Beispiel 1:**  
1. fun_a wird aufgerufen und der EC wird auf den Callstack gelegt.
	- fun_a gibt sofort ein Promise zurück, das aber nicht in result gespeichert wird, Stattdessen wird der code der Funktion fun_a, bis zu return "Hello Promise.", ausgeführt.

2. Der EC der umgebenden Funktion (die die fun_a aufgerufen hat) wird vom Callstack entfernt.
	- Vorher speichert die Engine folgendes:
		- Den EC.
		- Den Punkt, an dem die Ausführung angehalten wurde (also **nach** dem `await`).
			- Eine Art „Wiederaufnahme-Punkt“, der angibt, wo der Code fortgesetzt werden soll, wenn das Promise erfüllt ist.


3. Bei return "Hello Promise." setzt die JS-Engine das Promise auf fullfilled und übergibt dem Promise den Wert, der von fun_a zurückgegeben wurde.

4. Die Engine fügt aus dem Code-Bereich des gespeicherten EC den Code nach await in die Microtask-Queue.
	- Durch den gespeicherten "Wiederaufnahme-Punkt", weiß die Engine ab welcher Zeile sie den Code in die Microtask-Queue speichern muss.

5. Der EC von fun_a wird vom Callstack entfernt.

6. Ist der Code in der Microtask-Queue an der Reihe, wird ein EC für diesen Code erstellt und auf den Callstack gelegt.
	- Noch bevor der Code-Bereich des EC ausgeführt wird, wird das Ergebnis von der engine aus dem Promise in result gespeichert. Erst dann wird der Code-Bereich des EC ausgeführt und console.log(result) aufgerufen.

```javaScript
async function fun_a(){
	return "Hello Promise."
}

const result = await fun_a();
console.log(result);
```

**Beispiel 2:** 
```javascript
async function foo() {
    try {
        const result = await asynchroneFunktion();
        console.log(result); 
    } catch (error) {
	    console.error(error); 
	}
}

function asynchroneFunktion() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve("Hello, Promise!");
            reject(new Error("Something went wrong!"));
        }, 1000);
    });
}

foo();
```


**Beispiel 3:**  
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
