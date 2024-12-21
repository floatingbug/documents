Ein proxy object besteht aus dem:
-  target: Das object, das vom proxy object umgeben ist.
-  handler: Konfiguration in der Methoden enthalten sind (sie werden traps genannt),  die Operationen abfangen, bspw. `get` trap um von einem property vom target zu  lesen oder `set` trap um in ein property des targets zu schreiben.

```javascript
let proxy = new Proxy(target, handler)
```

Ist der handler leer, werden alle operationen an das target weitergereicht.

### JavaScript low level Methoden

Wenn in JavaScript auf ein property zugegriffen oder ein Wert zugewiesen wird, wird intern die Methoden `[[get]]` und `[[set]]` aufgerufen: `obj.key => [[get]]` und `obj.key = "value" => [[set]] obj.key = "value"`.

Proxy object fangen diese Methodenaufrufe ab.

**Beispiel:** 
```javascript
let numbers = [0, 1, 2];

numbers = new Proxy(numbers, {
	get(target, prop){
		if(prop in target) return target[prop]
		else return 0
	}
})

console.log(numbers[1])

// Ausgabe: 1
```

-  Beim Aufruf von `numbers[1]` wird `[[get]] numbers[1]` aufgerufen.
-  Das proxy object fängt die `[[get]]` Methode ab und ruft stattdessen seine get Methode auf.
	-  Die `get` Methode erhält als Parameter das array, also `target` und den index der in `numbert[1]` übergeben wird als `prop`.
-  Mit `return target[prop]` wird dann das Element zurückgegeben.

### Vorteile von Proxys

Der Hauptvorteil von Proxys liegt in ihrer Fähigkeit, zusätzliche Logik (wie Logging, Validierung oder Modifikation von Werten) hinzuzufügen, bevor oder nachdem der Wert aus dem Zielobjekt abgerufen wird.