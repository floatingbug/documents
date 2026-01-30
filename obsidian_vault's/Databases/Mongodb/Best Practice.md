# 1️⃣ MongoDB denkt **dokument-zentriert**, nicht tabellen-zentriert

MongoDB fragt sich immer:

> „Welche **Informationen gehören natürlich zusammen** und werden **meist gemeinsam gelesen**?“


### Nicht Welche Entität?

In relationalen DBs bedeutet _Entität_:
- ein fachliches Objekt
- das **meist 1:1 einer Tabelle entspricht**

Beispiele:
- Entität **User** → Tabelle `users`
- Entität **Task** → Tabelle `tasks`
- Entität **Tag** → Tabelle `tags`

Relationale Modellierung denkt:

> „Welche Dinge existieren in der Realität? → jede Sache bekommt eine Tabelle“

MongoDB denkt **nicht zuerst in Entitäten**, sondern in **Datenpaketen für einen Zweck**.

Sondern:
- Was braucht der Code **in einem Zugriff**?


### Nicht Welche Normalform?

Normalformen sind **Regeln aus der relationalen Welt**, um Tabellen zu „zerlegen“.

Ganz einfach gesagt:

- Daten sollen **nicht doppelt** vorkommen
- jede Information soll **nur an einer Stelle** existieren

Beispiel (stark vereinfacht):

❌ **nicht normalisiert**
```text
task_id | task_title | user_name | user_email
```

✅ **normalisiert**
``` text
tasks(task_id, title, user_id)
users(user_id, name, email)
```

Ziel:
- keine Redundanz
- saubere Trennung
- Konsistenz durch Fremdschlüssel

👉 **MongoDB ignoriert diese Denkweise bewusst**, weil:
- doppelte Daten = schneller lesen
- Konsistenz oft auf App-Ebene reicht


### Nicht Welche Fremdschlüssel?

In relationalen DBs:
- Fremdschlüssel = **Verbindung zwischen Tabellen**    
- sie erzwingen Regeln wie:
    - „Dieser Task MUSS zu einem User gehören“

Beispiel:
```sql
tasks.user_id REFERENCES users.id
```

Das führt zu:
- Joins
- mehreren Tabellen
- mehreren Abfragen oder teuren Queries

MongoDB sagt:

> „Warum trennen, wenn ich es zusammen speichern kann?“

Statt:
```text
tasks → user_id → users
```

Eher:
```js
{
  title: "Buy milk",
  user: {
    id: "...",
    name: "Tom"
  }
}
```

➡️ **kein Fremdschlüssel nötig**, weil:

- MongoDB keine referenzielle Integrität erzwingt    
- die App die Kontrolle hat

# Was braucht der Code in einem Zugriff?

Das ist **der wichtigste Punkt**.

Ein _Zugriff_ = **eine DB-Abfrage** (`findOne`, `find`, etc.)

Frage an  Entwickler:

> „Wenn mein Frontend eine View rendert – welche Daten braucht es **JETZT sofort**?“

Beispiel:  
**Task-Liste anzeigen**

Frontend braucht:
- title
- priority
- dueDate
- tags
- evtl. userName

MongoDB-Denken:

> „Kann ich all das mit **einem einzigen `find()`** bekommen?“

Wenn ja → gutes Modell . Beispiel: Alle Felder in einem document.
Wenn nein → Modell überdenken. Beispiel: userName ist noch nicht im document, also mit in das document aufnehmen.

# Lesemuster > Datenmodell

Beispiel:
Der Client braucht: 
- title
- priority
- description
- tags

Diese Felder werden gemeinsam und regelmäßig gelesen.

Ein Lesemuster beschreibt:  
👉 **Welche Felder werden gemeinsam und regelmäßig gelesen?**

Daher:
- diese vier Felder werden **zusammen**
- für **denselben Zweck**
- in **einer View / einem Request**  
    benötigt

MongoDB hört das und denkt:

„Okay, dann speichere ich sie **zusammen in einem Dokument**.“

Deshalb:
**Lesemuster > Datenmodell**

# 🧠 Ein Satz zum Merken

**SQL denkt:**

> „Wie speichere ich Daten korrekt?“

**MongoDB denkt:**

> „Wie bekomme ich Daten schnell dahin, wo sie gebraucht werden?“

---

# 2️⃣ “Data lives where it’s used”

Ein Kerngedanke:

> **Du modellierst für Queries, nicht für Entitäten**

### Nicht: Daten logisch trennen

Relationale Denkweise:
`tasks tags task_tags`

Gedanke dahinter:
- Tasks sind etwas Eigenes
- Tags sind etwas Eigenes
- Beziehungen werden extra modelliert

---

### Sondern: Daten dort speichern, wo sie gebraucht werden

MongoDB-Denkweise:

`{   _id,   title,   priority,   tags: ["work", "urgent", "backend"] }`

Warum?

- ein Task wird fast immer **mit seinen Tags gelesen**
    
- Tags sind klein und überschaubar
    
- der Client braucht sie **sofort**
    
- ein Join bringt keinen Mehrwert
    

MongoDB denkt also:

> „Wenn Daten fast immer gemeinsam gelesen werden,  
> dann sollten sie auch gemeinsam gespeichert werden.“

➡️ **Data lives where it’s used**

---

# 3️⃣ Embedding > Referencing (meistens)

MongoDB fragt sich zuerst:

> „Kann ich das **einbetten**, statt zu referenzieren?“

---

### ✅ Embed, wenn:

- es eine **1:n-Beziehung** ist
    
- `n` **begrenzt** ist
    
- Parent und Child **zusammen gelesen** werden
    
- Child **ohne Parent keinen Sinn ergibt**
    

Beispiel:

`{   title: "Task",   comments: [     { text: "Do this", createdAt },     { text: "Urgent!", createdAt }   ] }`

Gedanke:

- Kommentare gehören **fachlich** zur Task
    
- ohne Task existieren sie nicht
    
- beim Anzeigen der Task werden sie direkt gebraucht
    

---

### ❌ Referenzen, wenn:

- `n` **unbegrenzt** wachsen kann
    
- Daten **unabhängig** voneinander gelesen werden
    
- viele Parents sich dieselben Children teilen
    
- Pagination nötig ist
    

Beispiel:

`{   taskId,   text,   createdAt }`

MongoDB ist also:

> **nicht anti-Relationen**,  
> sondern **anti-unnötige Relationen**.

---

# 4️⃣ MongoDB liebt **Denormalisierung**

In SQL:

> „Redundanz ist böse“

In MongoDB:

> „Redundanz ist Performance“

Beispiel:

`{   taskId,   user: {     id: ObjectId,     name: "Tom",     avatar: "..."   } }`

Ja:

- `name` und `avatar` sind redundant
    

Aber:

- kein Join
    
- keine zweite Query
    
- UI bekommt alles sofort
    
- Konsistenzprobleme sind meist akzeptabel
    

MongoDB denkt:

> **Reads sind billig und häufig**  
> **Writes dürfen etwas Arbeit machen**

---

# 5️⃣ Schema ist flexibel – aber nicht beliebig

MongoDB ist **schema-optional**, nicht schema-los.

### Gutes MongoDB-Denken:

- Struktur ist **im Code definiert**
    
- Validierung passiert im Controller / Service
    
- DB-Validatoren nur als zusätzliche Absicherung
    

➡️ Das Schema lebt in der Anwendung, nicht in der DB.

---

### Schlechtes Denken:

`{ foo: 1 } { bar: [] } { lol: "???", nested: { wtf: true } }`

Das führt zu:

- unvorhersehbaren Daten
    
- komplizierten Queries
    
- kaputten Views
    

➡️ **Form follows queries**, nicht Chaos.

---

# 6️⃣ Updates passieren auf Dokument-Ebene

MongoDB denkt nicht:

> „Ich update eine einzelne Zeile“

Sondern:

> „Ich ändere ein Dokument“

Das bedeutet:

- ein Dokument ist die **kleinste konsistente Einheit**
    
- Updates sind atomar **pro Dokument**
    
- Dokumente sollten **nicht riesig** sein
    

Ein Dokument ist gedacht als:

- atomar
    
- in sich konsistent
    
- meist ohne Transaktionen nutzbar
    

---

# 7️⃣ Aggregation statt Join-Orgie

MongoDB denkt:

> „Verarbeite Daten **schrittweise**“

Aggregation Pipeline:

`[   $match,   $group,   $project,   $sort ]`

Mentales Modell:

- wie `Array.filter`
    
- dann `map`
    
- dann `reduce`
    

Nicht:

`SELECT ... JOIN ... JOIN ... JOIN ...`

➡️ **Daten fließen durch Schritte**, statt hart verbunden zu sein.

---

# 8️⃣ Skalierung ist eingebautes Denken

MongoDB ist von Anfang an gebaut für:

- Replikation
    
- Sharding
    
- horizontale Skalierung
    

Das beeinflusst das Schema:

- vermeide Dokumente, die **ständig geändert werden**
    
- vermeide globale Zähler
    
- wähle Shard Keys nach **Zugriffsmustern**
    

MongoDB denkt:

> „Daten werden verteilt laufen –  
> also dürfen sie nicht voneinander abhängig sein.“

---

# 9️⃣ Kurz gesagt – MongoDBs Mindset

MongoDB denkt in:

✅ **Use-Cases**  
✅ **Lesemustern**  
✅ **Dokumenten als abgeschlossene Einheiten**  
✅ **Redundanz als Feature**  
✅ **Ein Query = möglichst alles, was der Client braucht**

Nicht in:

❌ Normalformen  
❌ Joins  
❌ künstlichen Entitäten