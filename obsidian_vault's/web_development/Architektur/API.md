
# **MVC + Service Layer Architektur**

![[3-layer-architecture.png]]

### Verzeichnisstruktur

```bash
/myapp  
  ├── /controllers  
  │     ├── userController.js  
  ├── /routes  
  │     ├── userRoutes.js  
  ├── /models  
  │     ├── userModel.js  
  ├── /services  
  │     ├── userService.js  
  ├── /config  
  │     ├── db.js  
  ├── /middleware  
  │     ├── errorMiddleware.js
  ├── /utils  
  │     ├── response.js
  ├── /validations  
  │     ├── userValidation.js     
  ├── server.js  
  ├── package.json  

```

**Bei großen Projekten für jedes Feature ein eigenes Modul anlegen:**

```bash
/modules
 ├── users/
 │   ├── userService.js
 │   ├── userController.js
 │   ├── userUtils.js 
 ├── auth/
 │   ├── authService.js
 │   ├── authController.js
 │   ├── authUtils.js  
```


##### server.js

```javascript
import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import { userRoutes } from "./routes/userRoutes.js";
import { connectDB } from "./config/db.js";
import { errorHandler } from "./middleware/errorMiddleware.js";

// `.env`-Variablen laden
dotenv.config();

// Express-App erstellen
const app = express();

// Middleware
app.use(cors()); // CORS aktivieren
app.use(express.json()); // JSON-Parsing aktivieren

// Datenbank verbinden
connectDB();

// Routen einbinden
app.use("/api/users", userRoutes);

// Fehler-Handling Middleware
app.use(errorHandler);

// Server starten
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`✅ Server läuft auf Port ${PORT}`));

```


##### /config/db.js

```javascript
import { MongoClient } from "mongodb";
import dotenv from "dotenv";

dotenv.config();

const client = new MongoClient(process.env.MONGO_URI);
let db;

export async function connectDB() {
    try {
        await client.connect();
        db = client.db();
        console.log("✅ Mit MongoDB verbunden");
    } catch (error) {
        console.error("❌ Fehler bei der DB-Verbindung:", error);
        process.exit(1); // App beenden, falls keine Verbindung möglich
    }
}

export function getDB() {
    if (!db) throw new Error("❌ Datenbank nicht verbunden!");
    return db;
}

```


##### middleware/errorMiddleware.js

```javascript
const { createLogger, transports, format } = require("winston");

const logger = createLogger({
    level: "info",
    format: format.combine(
        format.timestamp(),
        format.printf(({ timestamp, level, message }) => `[${timestamp}] ${level.toUpperCase()}: ${message}`)
    ),
    transports: [
        new transports.Console(),
        new transports.File({ filename: "logs/errors.log", level: "error" })
    ]
});

export function errorHandler(err, req, res, next) {
	logger.error(err.message);
    res.status(err.status || 500).json({
        success: false,
        message: err.message || "Interner Serverfehler"
    });
}

```


##### /validations/userValidation.js

```javascript
const Joi = require("joi");

const userSchema = Joi.object({
    name: Joi.string().min(3).max(50).required(),
    email: Joi.string().email().required()
});

function validateUser(req, res, next) {
    const { error } = userSchema.validate(req.body);
    
	if (error) {
		return res.status(400).json({ 
			success: false, 
			message: error.details[0].message 
			});
		}
	} 
	
    next();
}

module.exports = validateUser;

```



##### /utils/response.js

```javascript
function successResponse(res, data, message = "Erfolg") {
    res.status(200).json({ success: true, message, data });
}

function errorResponse(res, statusCode, message) {
    res.status(statusCode).json({ success: false, message });
}

module.exports = { successResponse, errorResponse };

```


##### /routes/userRoutes.js

```javascript
import express from "express";
import { userController } from "../controllers/userController.js";

const router = express.Router();

router.post("/", userController.createUser);
router.get("/", userController.getUsers);
router.get("/:id", userController.getUserById);
router.delete("/:id", userController.deleteUser);

export const userRoutes = router;

```


##### /controllers/userController.js

```javascript
import { userService } from "../services/userService.js";
import { successResponse, errorResponse } from "../utils/response.js";

export const userController = {
    async createUser(req, res, next) {
        try {
            const { name, email } = req.body;
            const newUser = await userService.registerUser(name, email);
            successResponse(res, newUser, "Benutzer erfolgreich erstellt", 201);
        } catch (error) {
            next(error); // Fehler an die Middleware weitergeben
        }
    },

    async getUsers(req, res, next) {
        try {
            const users = await userService.getAllUsers();
            successResponse(res, users, "Benutzerliste abgerufen");
        } catch (error) {
            next(error);
        }
    },

    async getUserById(req, res, next) {
        try {
            const { id } = req.params;
            const user = await userService.getUserById(id);
            if (!user) return errorResponse(res, 404, "Benutzer nicht gefunden");
            successResponse(res, user, "Benutzer gefunden");
        } catch (error) {
            next(error);
        }
    },

    async deleteUser(req, res, next) {
        try {
            const { id } = req.params;
            const result = await userService.deleteUser(id);
            if (!result) return errorResponse(res, 404, "Benutzer nicht gefunden");
            successResponse(res, null, "Benutzer erfolgreich gelöscht");
        } catch (error) {
            next(error);
        }
    }
};

```



##### /services/userService.js

```javascript
const userModel = require("../models/userModel");

async function registerUser(name, email) {
    const existingUser = await userModel.getUserByEmail(email);
    if (existingUser) throw new Error("User existiert bereits");

    return await userModel.createUser({ name, email });
}

module.exports = { registerUser };

```



##### /models/userModel.js

```javascript
const { getDB } = require("../config/db");

function createUser(userData) {
    const db = getDB();
    return await db.collection("users").insertOne(userData);
}

function getUserByEmail(email) {
    const db = getDB();
    return await db.collection("users").findOne({ email });
}

module.exports = { createUser, getUserByEmail };

```



### Fehlerbehandlung
### 1. **Fatale Fehler (Datenbankverbindung, Serverfehler etc.)**

Fatale Fehler wie eine **gescheiterte Datenbankverbindung** oder **Serverfehler** sind nicht erwartete Fehler und können die gesamte Anwendung betreffen. Diese Fehler sollten nicht an den Client zurückgegeben werden, sondern von einer zentralen Fehler-Middleware abgefangen und protokolliert werden. In diesem Fall ist es wichtig, dass der Client keine Details zu diesen internen Fehlern erhält, sondern stattdessen eine generische Fehlernachricht (z. B. "Internal Server Error") bekommt.

### 2. **Fehler bei Geschäftslogik (Benutzer nicht gefunden, ungültige Eingaben)**

Geschäftslogikfehler, wie etwa **"Benutzer nicht gefunden"** oder **"Ungültige Eingabe"**, sind erwartete Fehler und sollten dem Client klar und verständlich mit einer spezifischen Fehlermeldung übermittelt werden. Diese Art von Fehlern ist oft eine normale Situation, mit der der Client umgehen kann, und erfordert keine zentrale Fehlerbehandlung.

### **Empfohlene Fehlerbehandlung:**

#### 1. **Fatale Fehler (z. B. Datenbankverbindung)**

Diese Fehler sollten direkt in der **Service-Schicht** oder sogar in einem globalen Fehler-Handler abgefangen und an die zentrale Fehler-Middleware weitergegeben werden. Die Middleware sollte dann entscheiden, wie der Fehler behandelt und dem Client präsentiert wird.

#### 2. **Geschäftslogikfehler (z. B. "Benutzer nicht gefunden")**

Fehler, die mit der Geschäftslogik zu tun haben und die der Client erwarten kann, sollten im **Controller** direkt behandelt werden, indem eine verständliche Antwort zurückgegeben wird.