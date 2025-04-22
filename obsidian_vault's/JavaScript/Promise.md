
### **Erklärung**

- Wenn `then` auf ein Promise (`A`) angewendet wird, erzeugt es **immer ein neues Promise (`B`)**.
- Die Callback-Funktion (`CB`) von `then` wird **erst ausgeführt**, wenn `Promise A` entweder **resolved** oder **rejected** ist.
- Das neue `Promise B` wird erst **resolved**, wenn `CB` entweder:
    - Einen **Wert zurückgibt** (dann wird `Promise B` mit diesem Wert resolved).
    - Ein **Promise zurückgibt** (dann wird `Promise B` erst resolved, wenn dieses zurückgegebene Promise sich auflöst

![[promise.excalidraw.png]]

Beispiel 1: Einfache Werte werden direkt weitergegeben
```javascript
Promise.resolve(1)
    .then(value => {
        console.log("CB A:", value);
        return value * 2; // Dieser Wert wird an CB B weitergegeben
    })
    .then(value => {
        console.log("CB B:", value); // 2 wird hier ausgegeben
    });
```


Beispiel 2: Ein Promise wird zurückgegeben (CB B wartet auf die Auflösung)
```javascript
Promise.resolve(1)
    .then(value => {
        console.log("CB A:", value);
        return new Promise(resolve => setTimeout(() => resolve(value * 2), 1000));
    })
    .then(value => {
        console.log("CB B:", value); // 2 wird erst nach 1 Sekunde ausgegeben
    });
```