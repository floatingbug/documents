# Mit dem mongod verbinden

## Verbinden mit replicaset

### 1. **Verbindungs-URI**

Die URI sollte die Adressen aller Knoten im Replikat-Set enthalten, um sicherzustellen, dass die Verbindung auch bei Ausfällen einzelner Knoten aufrechterhalten werden kann.

```javascript
const { MongoClient } = require('mongodb');

const uri = 'mongodb://host1:port,host2:port,host3:port/?replicaSet=rs0';

const client = new MongoClient(uri);

async function connect() {
  try {
    await client.connect();
    console.log('Connected to MongoDB');
    
    const db = client.db('mydatabase');
    const collection = db.collection('mycollection');
    
    // Perform operations with the collection
    
  } catch (err) {
    console.error('Error connecting to MongoDB:', err);
  }
}
```

- **`host1:port,host2:port,host3:port`**: Eine durch Kommas getrennte Liste von Adressen für die Knoten im Replikat-Set.
- **`replicaSet=rs0`**: Der Name des Replikat-Sets.

