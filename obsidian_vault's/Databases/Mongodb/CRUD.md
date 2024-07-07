# Create
## Ein Dokument einer Kollektion hinzufügen

```javaScript
const result = collection.insertOne(Dokument)
```

### Rückgabe:
`insertOne` gibt ein Objekt zurück. 
Die properties des Objekts sind:
- acknowledged: true oder false.
- insertedId: ID des eingefügten Dokuments.

---

# Read

## Ein Dokument Abfragen

```javaScript
const result = collection.findOne(query)
```

### Rückgabe:

`findOne` gibt entweder das gefundene Dokument zurück oder null.

## Mehrere Dokumente Abfragen

```javascript
const result = collection.find(query)
```

### Parameter
- Objekt mit Kriterien.
- Keine Parameter: Alle Dokumente werden zurück gegeben.

### Return
- FindCursor: wenn mindestens ein Dokument gefunden wurde.
- null: wenn kein Dokument gefunden wurde.

### FindCursor
Ist ein Objekt mit Methoden und einem Zeiger auf die geladenen Dokumente.
Über FindCursor kann iteriert werden und zwar mit der `for await...of` syntax.
Beispiel: 
```javascript
await client.connect();
const cursor = await collection.find(query);
for await (const doc of cursor){
    documents.push(doc); 
}
return documents;
```

Außerdem hat FindCursor zwei Methoden, mit denen über die Ergebnisse iteriert werden kann: 
- next(): 
	- Gibt ein Dokument aus, dann zeigt der cursor auf das nächste Dokument, sodass beim nächsten Aufruf von next() das nächste Dokument zurück gegeben wird.
		Beispiel:
		```javascript 
		const docs = await cursor.toArray() 
		```

- toArray(): 
	- Gibt ein Array zurück, das alle Dokumente enthält.
		Beiapiel: 
		```javascript 
		const docs = await cursor.toArray() 
		```

---

# Update

## Ein Dokument ändern

Um ein Dokument zu ändern wird den Methoden updateOne oder update ein update-document übergeben, sowie ein filter document um das zu ändernde document auswählen zu können.
Das update document enthält den update operator als property. Dieser gibt an, welche Art von Update durchgeführt werden soll, bspw. ein Wert ersetzen oder ein property entfernen.

Im folgenden Beispiel wird durch den update operator $set der Wert der property quantity auf 5 gesetzt.

```javascript
const filter = {
	id: 123
}

const updateDocument = {
	$set: {
		quantity: 5,
	},
};

const result = await coll.update(filter, updateDocument);
```

## update operators

**$set:** Ein Wert einer property ersetzen.

**$rename:** Den property Namen ändern.

**$unset:** Ein property entfernen.

**$inc:** Den Wert einer property erhöhen oder senken (Inkrement, Dekrement).

# updateOne

updateOne gibt volgendes Objekt zurück:
```javascript
{ 
	"acknowledged": true, 
	"matchedCount": 1, 
	"modifiedCount": 0, 
	"upsertedId": null 
}
```

- **acknowledged**: Gibt an, ob die Operation erfolgreich vom Server bestätigt wurde. Dies ist normalerweise `true`, es sei denn, es tritt ein Fehler auf.
- **matchedCount**: Die Anzahl der Dokumente, die mit dem Filter übereinstimmen. Dies gibt an, wie viele Dokumente für eine mögliche Aktualisierung in Frage kamen.
- **modifiedCount**: Die Anzahl der tatsächlich geänderten Dokumente. Selbst wenn ein Dokument übereinstimmt, wird `modifiedCount` 0 sein, wenn das Dokument bereits die gewünschten Änderungen enthält.
- **upsertedId**: Falls ein `upsert` (Update oder Insert) durchgeführt wurde, enthält dieses Feld die ID des neu eingefügten Dokuments. Andernfalls ist es `null`.

---

# deleteOne

## Ein Dokument aus einer Collection entfernen

```javascript
const result = collection.deleteOne(query)
```

## Rückgabe

deleteOne gibt folgendes Objekt zurück.
```javascript
{
  acknowledged: true,
  deletedCount: 1
}
```