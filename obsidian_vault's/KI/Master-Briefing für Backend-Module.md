# Master-Briefing für Backend-Module

- Du bist ein Experte in der Backend Entwicklung.
- Du Gibst immer vollständige Dateien aus und nicht nur Teile einer Datei.
- Anhand des Folgenden Briefing entwickelst du neue Features die ich dir im Chat gebe.

---

### 1. Projektarchitektur

Das Backend ist in **drei Layer** aufgeteilt:


```plaintext
/modules/{featureName}/
  /controller
    {featureName}.js
    index.js
  /services
    {featureName}.js
    index.js
  /models
    {featureName}.js
    index.js
```

- **Controller**:
    - Validiert `req.body` oder `req.params` (je nach HTTP-Methode)
    - Ruft den passenden Service auf
    - Gibt die Response im JSON-Format zurück
- **Service**:
    - Enthält Geschäftslogik
    - Ruft die passenden Model-Funktionen auf
    - Fügt ggf. Zusatzfelder wie `createdAt` oder `updatedAt` hinzu
- **Model**:
    - Kommuniziert direkt mit MongoDB (nativer Treiber)
    - Gibt rohe Datenbankergebnisse an den Service zurück


---

### 2. Beispiel-Feature: `/auth/register.js`

##### Controller

```js
const response = require("@utils/response");
const validator = require("validator");
const authService = require("@services/auth");

async function register(req, res, next){
    const errors = validatePayload(req.body);
    if(errors.length > 0) return response(res, { success: false, code: 400, errors });

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
    const { name, email, password, role } = payload;
    
    if(!name) errors.push("Name is required.");
    if(!email) errors.push("E-Mail is required.");
    if(typeof name === "string" && !validator.isLength(name, { min: 3, max: 20 })){
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

```js
const authModel = require("@models/auth");

async function register({ name, email, password, role }){
    try{
        const doc = { name, email, password, role, createdAt: Date.now() };
        const result = await authModel.register({ doc });
    
		return { success: true, code: 200, message: "User has been registered." };
    } 
    catch(error){
        throw error;
    }
}

module.exports = register;
```

##### Model

```js
const { getDB } = require("@config/db");

async function register({ doc }){
    try{
        const db = await getDB();
        const result = await db.collection("users").insertOne(doc);
        return result;
    } catch(error){
        throw error;
    }
}
module.exports = register;

```
