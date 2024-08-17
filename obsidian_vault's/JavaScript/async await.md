
**Beispiel:** Wenn das Schlüsselwort `await` vor einer Funktion steht (z.B. `asynchroneFunktion`), die ein Promise zurückgibt, wird der nachfolgende Code erst ausgeführt, wenn das Promise entweder erfüllt (`resolve` aufgerufen) oder abgelehnt (`reject` aufgerufen) wurde. Die JavaScript-Engine setzt dann die Ausführung der Funktion `foo` an der Stelle fort, an der `await asynchroneFunktion` aufgerufen wurde, und das Ergebnis, das dem `resolve` übergeben wurde, wird als Rückgabewert von `await asynchroneFunktion` verwendet.

Hier ist ein konkretes Beispiel, um das zu verdeutlichen:
```javascript
async function foo() {
    try {
        const result = await asynchroneFunktion();
        console.log(result); // Wird ausgeführt, wenn das Promise erfüllt ist.
    } catch (error) {
        console.error(error); // Wird ausgeführt, wenn das Promise abgelehnt wird.
    }
}

function asynchroneFunktion() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve("Hello, Promise!");
            // Oder, um einen Fehler zu simulieren:
            // reject(new Error("Something went wrong!"));
        }, 1000);
    });
}

foo();
```

In diesem Beispiel:

- `foo` ist eine asynchrone Funktion, die `await` verwendet, um auf das Ergebnis von `asynchroneFunktion` zu warten.
- `asynchroneFunktion` gibt ein Promise zurück, das nach einer Sekunde entweder erfüllt (`resolve("Hello, Promise!")`) oder abgelehnt (`reject(new Error("Something went wrong!"))`) wird.
- Der `try`-Block in `foo` fängt das Ergebnis ab, wenn das Promise erfüllt ist, und der `catch`-Block fängt den Fehler ab, wenn das Promise abgelehnt wird.

Das `await`-Schlüsselwort hält die Ausführung der Funktion `foo` an, bis die Funktion resolve oder reject des Promise Objekts von der Callback Funktion aufgerufen wurde. 