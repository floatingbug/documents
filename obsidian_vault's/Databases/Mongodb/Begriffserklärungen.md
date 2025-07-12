
### Fields

Properties in documents werden in MongoDB als fields bezeichnet.

### **Unterschied: Query vs Aggregation**

| **Query**                                                         | **Aggregation**                                                              |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| Einfache Abfragen mit Operatoren wie `$match`, `$in`, `$all` usw. | Verarbeitungspipeline, in der Daten schrittweise transformiert werden        |
| Schnell und effizient bei einfachen Bedingungen                   | Flexibel bei komplexen Abfragen (z. B. Gruppierungen, Berechnungen, Lookups) |
| Beispiel: `find({ age: { $gt: 18 } })`                            | Beispiel: `aggregate([{ $match: { age: { $gt: 18 } } }])`                    |

**Quelle:** [MongoDB – Queries vs Aggregations](https://www.mongodb.com/docs/manual/applications/read/#read-operations-overview)

---

### **Was ist eine Projection?**

Eine **Projection** gibt an, **welche Felder** in der Ergebnis-Ausgabe erscheinen sollen (inkludieren oder ausschließen):

js

KopierenBearbeiten

`db.collection.find({ name: "Anna" }, { name: 1, email: 1, _id: 0 })`

→ Zeigt nur `name` und `email`, aber kein `_id`.

Auch in Aggregationen mit `$project` möglich:

js

KopierenBearbeiten

`{ $project: { name: 1, email: 1, _id: 0 } }`

**Quelle:** [MongoDB – Projection](https://www.mongodb.com/docs/manual/tutorial/project-fields-from-query-results/)

---

### **Was ist ein View?**

Ein **View** ist wie eine **gespeicherte Aggregation**, also eine „virtuelle Collection“, basierend auf einer Aggregation:

- Read-only (man kann keine Daten direkt in Views schreiben)
    
- Nützlich, um z. B. nur bestimmte Felder/Strukturen bereitzustellen
    
- Definiert mit `db.createView(...)`
    

Beispiel:

js

KopierenBearbeiten

`db.createView("simpleUsers", "users", [   { $project: { name: 1, email: 1, _id: 0 } } ])`

→ `simpleUsers` ist jetzt ein View auf `users`.

**Quelle:** [MongoDB – Views](https://www.mongodb.com/docs/manual/core/views/)