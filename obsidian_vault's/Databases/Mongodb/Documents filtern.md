### Skip

Ist eine cursor function.
Durch skip können, bei einem query, die ersten documents weggelassen werden.

**Beispiel:** Die ersten beiden documents werden nicht in result gespeichert.
```javascript
const cursor = await coll.find();
cursor.skip(2);
const result = await cursor.toArray();
```

### limit

Ist eine cursor function.
Durch limit wird die Anzahl an documents, die bei einem query zurückgegeben werden, begrenzt.

**Beispiel:** Maximal 5 documents werden in result gespeichert.
```javascript
const cursor = await coll.find();
cursor.skip(2);
cursor.limit(5);
const result = await cursor.toArray();
```

### sort

Ist eine cursor function.
Durch limit wird das Ergebnis, das bei einem query zurückgegeben wird, sortiert.

**Beispiel:** In result werden documents der Reihe nach gespeichert, angefangen vom niedrigsten Wert von propName bis zum höchsten Wert von propName.
```javascript
const cursor = await coll.find();
cursor.skip(2);
cursor.limit(5);
cursor.sort("propName", 1)
const result = await cursor.toArray();
```
