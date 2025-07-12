Wenn ein Feld ein Objekt als Wert hat, wird dieses Objekt als embedded document angesehen, daher ein document in einem document.

---

### Ändern von Feldern in embedded documents

**Beispiel:**

document:
```javascript
{
	embeddedOne: {
		embeddedTwo: {
			locations: ["usa", "uk"]
		}
	}
}
```

update:
```javascript
const filter = {
	name: "bob"
}

const update = {
	$set: {
		"embeddedOne.embeddedTwo": ["ger", "d"]
	}
}

db.collection.updateOne(filter, update)
```

---

### Documents anhand von Feldern in embedded documents filtern

**Beispiel:**

document:
```javascript
{
	embeddedOne: {
		embeddedTwo: {
			locations: ["usa", "uk"]
		}
	}
}
```

update:
```javascript
const filter = {
  "embeddedOne.embeddedTwo.locations": { $in: ["uk"] }
};

db.collection.findOne(filter);
```

