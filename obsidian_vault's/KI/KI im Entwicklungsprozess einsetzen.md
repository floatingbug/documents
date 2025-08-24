## **Briefing-Beispiel: Inbox Feature**

---

### **1. Projektarchitektur**

Unser Backend ist in drei Layer aufgeteilt:


```pgsql
/modules/inbox/
  /controller
    featurename.js
    index.js
  /services
	featurename.js
    index.js
  /models
	featurename.js
    index.js
```



##### Controller 
- Validiert `req.body` und ruft den entsprechenden Service auf.
- **Beispiel: /auth/register.js**
```js
const response = require("@utils/response");
const validator = require("validator");
const authService = require("@services/auth");


async function register(req, res, next){
    const errors = validatePayload(req.body);

    if(errors.length > 0) return response(res, {
        success: false,
        code: 400,
        errors,
    });


    try{
        const result = await authService.register({
            name: req.body.name,
            email: req.body.email,
            role: req.body.role,
            password: req.body.password,
        });

        response(res, result);
    }
    catch(error){
        next(error);
    }
}


function validatePayload(payload){
    const errors = [];
    const {name, email, password, role} = payload;


    if(!name) errors.push("Name is required.");
    if(!email) errors.push("E-Mail is required.");


    if(typeof name === "string" && !validator.isLength(name, {min: 3, max: 20})){
        errors.push("'Name' must have at least 3 and at most 20 characters.");
    }
    if(typeof email === "string" && !validator.isEmail(email)){
        errors.push("No valid E-Mail.");
    }

    return errors;
}


module.exports = register;

```

##### Service
- Enthält Geschäftslogik und ruft die passenden Model-Funktionen auf.
- **Beispiel: /auth/register.js**
```js
const authModel = require("@models/auth");


async function register({name, email, password, role}){
    try{
        const doc = {
            name,
            email,
            password,
            role,
            createdAt: Date.now(),
        };
    
        const result = await authModel.register({doc});

        return {
            success: true,
            code: 200,
            message: "User has been registered.",
        };
    }
    catch(error){
        throw error;
    }
}   
    

module.exports = register;

```

##### Model
- Kommuniziert direkt mit MongoDB (nativer Treiber).
- **Beispiel: /auth/register.js**
```js
const {getDB} = require("@config/db");


async function register({doc}){
    try{
        const db = await getDB();
        const result = await db.collection("users").insertOne(doc);

        return result;
    }       
    catch(error){
        throw error;
    }
}

        
module.exports = register;
```

---

### **2. Code-Stil**

- Genau so wie in den zuvor gezeigten Beispielen.

---

### **3. Payload vom Frontend**

Das Frontend sendet beim Erstellen einer neuen Nachricht folgendes JSON an den Controller:


```json
{
  "senderId": "64f2a9c12345",
  "receiverId": "64f2a9c67890",
  "subject": "Frage zur Bestellung",
  "message": "Hallo, wann wird mein Paket verschickt?",
  "attachments": [
    { "type": "image", "url": "https://example.com/file1.jpg" }
  ]
}
```

---

### **4. Validierungsregeln im Controller**

- `senderId`, `receiverId`, `subject`, `message` sind **Pflichtfelder**
- `attachments` ist optional, muss aber ein Array aus Objekten mit `type` & `url` sein
- Bei fehlenden Pflichtfeldern → HTTP 400 mit Fehlermeldun

---

### **5. Service-Logik**

- Übergibt die Daten 1:1 an das Model
- Fügt automatisch ein Feld `createdAt: new Date()` hinzu
- Gibt die vom Model zurückgegebene Nachricht an den Controller zurück

---

### **6. Model-Logik**

- Speichert die Nachricht in der Collection `inbox`
- Gibt das erstellte Dokument zurück

---

### **7. Aufgabe an das LLM**

> Erstelle die Datei `modules/inbox/controller/create.js`,  
> die auf Basis der obigen Architektur und Regeln den POST-Request validiert,  
> den `create`-Service aufruft und das Ergebnis als JSON zurückgibt.  
> Verwende exakt den beschriebenen Coding-Style.