 ### Documents anhand von Elementen im Array finden

**Beispiel:**

Document: 
```javascript
location: ["ger", "usa"]
```

query:
```javascript
db.collection.find({
	location: "usa"
})
```

Alle documents bei denen im array location "usa" als element vorhanden ist, werden aus der collection geladen.

---

### Array ersetzen

update:
```javascript
db.collection.updateOne({
	location: "usa"
}, {
	$set: {
		location: {
			["ger", "UK"]
		}
	}
})
```

---

### Documents anhand von feldern in embedded documents finden

Document:
```javascript
{
	users: [
		{
			name: "bob",
			age: 55,
		},
	]
}
```

query:
```javascript
const query = {
	"users.name": "bob",
}

db.collection.find(query);
```

---
### Documents anhand von Elementen im Array finde mit Bedingungen

**Beispiel:**

Document: 
```javascript
location: ["ger", "usa", "uk"]
```

query:
```javascript
const query = {
	location: {
		$in: ["ger", "uk"]
	}
};

db.collection.find({
	location: "usa"
})
```

Alle documents bei denen im array location "ger" ODER "uk" als element vorhanden ist, werden aus der collection geladen.

---

### Elemente aus einem array entfernen

##### Beispiel: 

**Ausgangspunkt:**
Ein document hat ein array movies. Die Elemente sind Objekte. Jedes Objekt hat die property movieId.

**Problem:**
Wenn movieId mit einer ID aus movieIdsArray übereinstimmt, soll das Objekt gelöscht werden.

**Lösung:**
`$pull`: 
`$in:`

```javascript

        // Entferne Elemente aus dem Array `movies`, deren `movieId` im Array `movieIdsArray` enthalten ist
        const result = await collection.updateMany(
            {}, // Leeres Filterkriterium bedeutet, dass alle Dokumente berücksichtigt werden
            {
                $pull: {
                    movies: {
                        movieId: { $in: movieIdsArray }
                    }
                }
            }
        );


const movieIdsToDelete = [1100782, 1234567];
deleteMoviesByIds(movieIdsToDelete);

```

### Element einem array hinzufügen

```javascript
const result = await collection.updateOne(
	{movielistId},
	{
		$push: {
			movielist: "newMovie"
		}
	},
)
```