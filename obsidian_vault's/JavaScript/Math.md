# Math.random()

Gibt eine Kommazahl zurück. Die erste Kommazahl liegt immer zwischen 0 und 9, bspw. 0.3523423425235.

Multipliziert man die Zufallszahl mit einer Ganzzahl, bspw. 5, erhält man eine zufällige Zahl zwischen 0 und 4. 
**Beispiele:** 0.0 * 5 = 0,  0.1 * 5 = 0.5, 0.2 * 5 = 1, 0.9 * 5 = 4.5.

Damit man eine ganze Zahl erhält, muss die Kommazahl noch abgerundet werden.
**Beispiel**: 0.1 -> 0, 0.9 -> 0, 2.5 -> 2, 4.5 -> 4.

**Beispiel:**
```javascript
const randomNumber = Math.floor(Math.random()*5) +1
```
random() gibt die Zufallszahl zurück, die mit 5 multipliziert wird.
floor rundet die Zahl ab, sodass eine zufällige Zahl zwischen 0 und 4 entsteht.
Um Zufallszahlen zwischen 1 und 5 zu erhalten, wird 1 addiert.