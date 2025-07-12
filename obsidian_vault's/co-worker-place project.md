## 🔧 Tech-Stack

- **Backend:** Node.js, Express.js
    
- **Datenbank:** MongoDB (mit Mongoose)
    
- **Frontend:** Vue.js (Composition API empfohlen)
    
- **Authentifizierung:** JSON Web Tokens (JWT)
    
- **Deployment (optional):** Render / Vercel / MongoDB Atlas
    

---

## 📐 Datenmodell

### User

```
{
  _id,
  name,
  email,
  passwordHash,
  role: "user" | "admin",
  createdAt
}
```

### Space

```
{
  _id,
  name,
  location,
  description,
  amenities: [String],
  capacity,
  hourlyRate,
  createdBy: ObjectId (User),
  createdAt
}
```

### Booking

```
{
  _id,
  userId: ObjectId,
  spaceId: ObjectId,
  startTime: Date,
  endTime: Date,
  totalPrice,
  createdAt
}
```

---

## 🔐 Authentifizierung & Autorisierung

- **Registrierung / Login**
    
- **JWT Token** im Header senden
    
- Middleware prüft Token + Rolle (`isAdmin`, `isUser`)
    

---

## 📤 API-Endpunkte (Beispiele)

### Auth

- `POST /api/register`
    
- `POST /api/login`
    

### Spaces

- `GET /api/spaces`
    
- `GET /api/spaces/:id`
    
- `POST /api/spaces` _(nur Admin)_
    
- `PUT /api/spaces/:id` _(nur Admin)_
    
- `DELETE /api/spaces/:id` _(nur Admin)_
    

### Bookings

- `GET /api/bookings` _(eigene Bookings)_
    
- `POST /api/bookings`
    
- `DELETE /api/bookings/:id`
    

---

## 🖼️ Frontend Pages (Vue.js)

- **Home**: Liste aller Spaces
    
- **Login/Register**
    
- **Space Detail**: mit Buchungsformular
    
- **Dashboard (User/Admin)**
    
    - User: Buchungen verwalten
        
    - Admin: Spaces verwalten

### Navigationsbar

### 🔓 **Für alle (auch nicht eingeloggte Nutzer):**

- `Home` (`/`) – Übersicht aller Spaces
    
- `Login` (`/login`)
    
- `Register` (`/register`)
    

---

### 🔐 **Für eingeloggte User (Rolle: `user`):**

- `Home` (`/`)
    
- `Meine Buchungen` (`/dashboard/bookings`)
    
- `Logout`
    

---

### 🛠️ **Für Admins (Rolle: `admin`):**

- `Home` (`/`)
    
- `Spaces verwalten` (`/dashboard/spaces`)
    
- `Logout`

---

## ✅ Features

- Überprüfung von Überschneidungen bei Buchungen
    
- Validierung mit `express-validator`
    
- Error-Handling (z. B. 400, 401, 404, 500)
    
- Preisberechnung auf Basis Zeitspanne × Stundensatz
    

---

## ⏩ Nächste Schritte

1. Projektstruktur im Backend anlegen (`routes`, `models`, `controllers`, `middleware`)
    
2. API mit Postman testen
    
3. Frontend mit Vue.js erstellen und API anbinden
    
4. Auth & State Management mit Pinia oder Vuex
    

---