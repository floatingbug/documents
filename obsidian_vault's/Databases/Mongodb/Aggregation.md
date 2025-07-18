## Was ist Aggregation?

Operationen wie Filtern, Gruppieren, Sortieren und Berechnen von Werten werden von dem DBMS, also dem mongod-Prozess durchgeführt, wobei dem DBMS durch Kommandos mitgeteilt wird, welche Operationen durchgeführt werden sollen.

### Wofür wird Aggregation verwendet?

- **Statistiken berechnen:** z. B. Durchschnitt, Summe, Minimum, Maximum.
- **Daten gruppieren:** z. B. Umsätze pro Region, Anzahl der Benutzer pro Land.
- **Filtern und transformieren:** z. B. nur Dokumente anzeigen, die bestimmte Kriterien erfüllen.
- **Daten zusammenfassen:** z. B. Berichte erstellen oder Daten in ein bestimmtes Format bringen.
- **Sortieren und Anreichern:** z. B. Sortieren der Ergebnisse oder Hinzufügen neuer Felder basierend auf Berechnungen.

---

# Lookup Operator

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
		localField: "orderId",
		foreignField: "orderId",
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

