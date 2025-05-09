# Create
## Ein Dokument in einer Kollektion hinzufügen

```javaScript
const result = collection.insertOne(doc)
```

### Rückgabe:
`insertOne` gibt ein Objekt zurück. 

Die properties des Objekts sind:
- acknowledged: true oder false.
- insertedId: ID des eingefügten Dokuments.

`insertOne` gibt entweder das Objekt zurück oder es wird ein Fehler geworfen.


## Mehrere Dokumente in einer Kollektion hinzufügen

```javascript
const result = collection insertMany(docs)
```

### Parameter:
- Array mit Objekten (jedes Objekt ist ein Dokument).

### Rückgabe:

`insertMany` gibt ein Objekt zurück.
Properties des Objekts sind:
- acknowledged: true/false.
- insertedCount: number.
- insertedIds: string

## Achtung

Auch wenn kein Dokument hinzugefügt wurde, gibt insertMany ein Objekt mit dem Wert true des propery acknowledged zurück, wenn insertMany ein leeres array übergeben wurde.

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
- FindCursor: Es wird auch ein cursor zurückgegeben wenn kein document gefunden wurde.
- null: Wenn ein Fehler bei der Datenbankoperation auftrat.

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

## Read Operators

## Logische Operatoren

**$or**: Das Dokument wird ausgewählt, wenn min. eine Eigenschaft übereinstimmt.
```js
{ $or: [{ field1: condition1 }, { field2: condition2 }] }
```

---

# Update

### Ein Dokument ändern

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

### update operators

**$set:** Ein Wert einer property ersetzen.

**$rename:** Den property Namen ändern.

**$unset:** Ein property entfernen.

**$inc:** Den Wert einer property erhöhen oder senken (Inkrement, Dekrement).

### Beispiel: einem Array ein element hinzufügen

```javascript
const filter = {id: idNumber};
const update = { $push: { arrayField: "newElement" } };

const result = await collection.update(filter, update)
```

### Beispiel: Prüfen, ob eine ID aus einem Array (`arrayAusIds`) in einem Objekt innerhalb eines Arrays von Objekten (`arrayMitObjecten`) vorhanden ist.

```javascript 
const query = {
	arrayAusObjekten: {
		$elemMatch: {
			id: {
				$in: ["id1", "id2", "id3"]
			}
		}
	}
}

const result = await db.collection.find(query);
```

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
const result = collection.deleteOne(doc)
```

## Rückgabe

deleteOne gibt folgendes Objekt zurück.
```javascript
{
  acknowledged: true,
  deletedCount: 1
}
```