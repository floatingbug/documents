### Filtern

Durch den **Rest-Operator: (`...`)**  werden nur die Eigenschaften eines Objekts verwendet, die vorher noch nicht destrukturiert wurden. Der Rest wird also noch verwendet.
	
**Beispiel:** 
```javascript
users.map(({ _id, password, ...user }) => user);
```

- Aus jedem Objekt in users wird id und password destrukturiert.
- durch ...user erstellt die js-engine ein neues Objekt mit den Eigenschaften, die noch vorhanden sind mit den Name user.
	- Dieses Objekt wird dann als Argument genutzt `(user) => user`.

