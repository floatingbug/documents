## Was ist Aggregation?

Operationen wie Filtern, Gruppieren, Sortieren und Berechnen von Werten werden von dem DBMS, also dem mongod-Prozess durchgeführt, wobei dem DBMS durch Kommandos mitgeteilt wird, welche Operationen durchgeführt werden sollen.

### Wofür wird Aggregation verwendet?

- **Statistiken berechnen:** z. B. Durchschnitt, Summe, Minimum, Maximum.
- **Daten gruppieren:** z. B. Umsätze pro Region, Anzahl der Benutzer pro Land.
- **Filtern und transformieren:** z. B. nur Dokumente anzeigen, die bestimmte Kriterien erfüllen.
- **Daten zusammenfassen:** z. B. Berichte erstellen oder Daten in ein bestimmtes Format bringen.
- **Sortieren und Anreichern:** z. B. Sortieren der Ergebnisse oder Hinzufügen neuer Felder basierend auf Berechnungen.

---

# Aggregation-Stages Überblick

Aggregation Stages führen auf dem mongod-server nacheinander Operationen aus.

**Beispiel:**
```javascript
const pipeline = [
  {
    $match: {
      userId: '686d2f729a4d48c011a12af8'
    }
  },
  {
    $addFields: {
      spaceObjectId: { $toObjectId: "$spaceId" }
    }
  },
  {
    $lookup: {
      from: "spaces",
      localField: "spaceObjectId",
      foreignField: "_id",
      as: "space"
    }
  }
];

const cursor = await db.collection("bookings").aggregate(pipeline);
const result = cursor.toArray();                                   
```

### 1. `$match`: Nur Bookings eines bestimmten Users
- **Was es macht:** Diese Stage filtert alle Dokumente in der `bookings`-Collection und lässt nur die durch, bei denen das Feld `userId` dem angegebenen Wert entspricht.
    
- **Warum:** Damit **nur die Bookings eines bestimmten Users** geladen wird.

### **2. `$addFields`: spaceId-String in ObjectId konvertieren**

- **Was es macht:** Fügt jedem Booking-Dokument ein neues Feld `spaceObjectId` hinzu, indem es das bestehende Feld `spaceId` (ein **String**) mit `$toObjectId` in einen echten `ObjectId` umwandelt.
    
- **Warum:** Weil in der `spaces`-Collection das `_id`-Feld vom Typ `ObjectId` ist – und MongoDB `lookup`-Verknüpfungen nur funktionieren, wenn **beide Felder denselben Datentyp** haben.
    
- Ohne diese Umwandlung würde der Join mit `spaces._id` fehlschlagen.
    

#### **3. `$lookup`: Verknüpft zugehörige Spaces**

- **Was es macht:** Führt eine "Left Outer Join"-Operation durch:
    
    - Für jedes Dokument aus `bookings` (das jetzt `spaceObjectId` hat),
        
    - sucht es in der Collection `spaces` nach Dokumenten, bei denen `_id == spaceObjectId`.
        
    - Die gefundenen Space-Dokumente werden im Array `space` gespeichert.
        
- **Warum:** Damit **Details über den Space** (Name, Ort, Beschreibung usw.) bekommst, zu dem das jeweilige Booking gehört.

---

# Aggregation-Stages

### Lookup Operator

Mit dem Lookup Operator können mehrere documents geladen werden, die durch ID's miteinander in Relation stehen. Die geladenen documents werden dann zusammengeführt (aggregiert), sodass aus den in Beziehung stehenden documents ein document wird.

**Beispiel:**
```javascript
// Ein document in collectionA
{
	userId: 1111,
	orderId: 2222,
}

// Ein document in collectionB
{
	orderId: 2222,
	orders: [
	]
}

db.collectionA.aggregate({
	$lookup: {
		from: "collectionB",
		localField: "orderId", // von document aus collectionA
		foreignField: "orderId", // von document aus collectionB
		as: "orders"
	}
})

// zurückgegebene aggregation (Zusammenführung)
{
	userId: 1111,
	orderId: 2222,
	orders: {
		orderId: 2222,
		orders: [
		]
	}
}
```

- `from`: Name der collection in der sich das document befindet.
- `localField`: Name des Feldes das die id des documents beinhaltet, das aggregiert werden soll.
- `foreignField`: Name des Feldes vom document aus collectionB, dass die document id enthält.
- `as`: Name für die aggregierten Daten von dem document aus collectionB.

Wenn ein document mehrere documents referenziert und alle documents aggregiert werden sollen, dann wird der Funktion aggregate anstatt eines objects ein array übergeben. Beispiel: `db.collection.aggregate([{}])` in dem array steht dann wieder das `$lookup` object.

