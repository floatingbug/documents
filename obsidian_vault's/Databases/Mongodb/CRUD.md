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

# Delete

## Ein Dokument aus einer Collection entfernen

```javascript
const result = collection.deleteOne(query)
```

