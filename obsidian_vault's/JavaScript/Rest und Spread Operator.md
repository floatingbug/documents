
# Unterschied Rest- und Spread-Operator

Der Spread-Operator entpackt properties aus einem object oder Elemente aus einem array.

Der Rest-Operator sorgt dafür, dass nur die properties, die vorher noch nicht destrukturiert wurden, verwendet werden. Es wird nur der Rest verwendet, der noch übrig ist, bspw. `const {id, password, ...user} = user;` in user werden dann alle properties außer id und password gespeichert. Anderes Beispiel: `const { id, password, ...rest } = user;` hier werden alle properties bis auf id und password in `rest` gespeichert.
### Filtern

Durch den **Rest-Operator: (`...`)**  werden nur die Eigenschaften eines Objekts verwendet, die vorher noch nicht destrukturiert wurden. Der Rest wird also noch verwendet.
	
**Beispiel:** 
```javascript
users.map(({ _id, password, ...user }) => user);
```

- Aus jedem Objekt in users wird id und password destrukturiert.
- durch ...user erstellt die js-engine ein neues Objekt mit den Eigenschaften, die noch vorhanden sind mit den Name user.
	- Dieses Objekt wird dann als Argument genutzt `(user) => user`.

