# 🧩 **Systementwurf für eine Buchungs-App**


---

# **1. Anforderungen (Requirements Engineering)**

## **1.1 Funktionale Anforderungen**

- User können sich registrieren, einloggen und ihr Profil verwalten.
    
- Hosts können Spaces erstellen, bearbeiten und löschen.
    
- User können Spaces durchsuchen, Details ansehen und Zeiträume buchen.
    
- Buchungen können bestätigt, storniert und bezahlt werden.
    
- Zahlungen werden über einen externen Payment Provider (Stripe) abgewickelt.
    
- User können Spaces bewerten.
    
- Die App muss mobil und Desktop-tauglich sein.
    

## **1.2 Nicht-funktionale Anforderungen**

- Hohe Zuverlässigkeit und Konsistenz der Buchungsprozesse.
    
- Antwortzeiten unter 300 ms im Durchschnitt.
    
- Skalierbarkeit bis zu 100.000 Usern.
    
- Sichere Passwort-Speicherung (BCrypt).
    
- API-spezifische Rate Limits.
    
- GDPR-Konformität (Datenminimierung, Löschbarkeit von Userdaten).
    

## **1.3 Rollen & Berechtigungen**

- **User**: buchen, bewerten, Spaces ansehen
    
- **Host**: Spaces verwalten, Buchungen bestätigen/ablehnen
    
- **Admin**: Vollzugriff + Monitoring
    

## **1.4 Geschäftsprozesse**

- Buchung: Select Date/Time → Check Availability → Payment → Confirmation
    
- Storno (User): möglich bis 24h vorher → Refund-Prozess
    
- Storno (Host): möglich vor der Bestätigung
    
- Payment-Failure → Booking bleibt `pending`, aber nicht `confirmed`
    

---

# **2. Domänenanalyse (Domain Analysis)**

## **2.1 Begriffe**

- **Space**: buchbare Ressource
    
- **Booking**: Zeitraum-basierte Reservierung
    
- **Payment**: transaktionsbezogene Zahlung
    
- **Review**: Nutzerbewertung
    
- **Availability**: definierte Zeiträume, in denen ein Space angeboten wird
    

## **2.2 Domänenregeln**

- Ein Space darf nur gebucht werden, wenn kein Overlap mit bestehenden Buchungen existiert.
    
- Eine Zahlung darf nur für `pending` Buchungen initiiert werden.
    
- Eine Buchung wird erst nach erfolgreichem Payment auf `confirmed` gesetzt.
    
- Stornierungen verändern Availability **nicht**, weil Availability vom Host definiert wird.
    

## **2.3 Domänenstruktur**

Siehe Beziehungen:

- User 1–n Booking
    
- User 1–n Review
    
- Host 1–n Space
    
- Space 1–n Booking
    
- Booking 1–1 Payment
    

---

# **3. Datenmodellierung**

## **3.1 Collections**

- `users`
    
- `spaces`
    
- `bookings`
    
- `payments`
    
- `reviews`
    
- `availability`
    

## **3.2 Schlüsselfelder**

### Users

E-Mail unique, Rollen-Feld, Passwort gehasht.

### Spaces

Coordinates (Geolocation), Preis, Amenities, Bilder, Host-Referenz.

### Bookings

Zeiträume (`from`, `to`) müssen per Index optimiert werden.

### Payments

Fremdschlüssel → `bookingId`, Payment Provider Metadata.

## **3.3 Index-Planung (MongoDB)**

- `spaces.hostId`
    
- `bookings.spaceId`
    
- `bookings.from` + `bookings.to` (für Date-Range Queries)
    
- `reviews.spaceId`
    

## **3.4 Datenbankregeln**

- Keine Embeds für Bookings → können sehr groß werden
    
- Embeds bei Space Images sinnvoll
    
- Strong consistency auf Payment → per Transaktion (MongoDB Sessions)
    

---

# **4. API-Design**

## **4.1 Ressourcen**

- `/auth/*`
    
- `/spaces/*`
    
- `/bookings/*`
    
- `/payments/*`
    
- `/reviews/*`
    
- `/availability/*`
    

## **4.2 Anfrage-/Antwortformate**

JSON-Formate mit klaren Validierungsregeln (Strings, Dates, Numbers, Enums).

## **4.3 Fehlerdesign**

- `400` → invalid input
    
- `401` → not logged in
    
- `403` → insufficient role
    
- `404` → resource not found
    
- `409` → booking conflict (Overlapping times)
    

## **4.4 Sicherheitsregeln**

- Alle Booking-/Space-Pfade hinter Auth
    
- Payment nur über Backend, niemals direkt vom Frontend
    
- JWT Access Tokens + Refresh Token Rotation
    
- Rate Limit: 60 req/min
    

---

# **5. Architekturplanung**

## **5.1 Software-Architektur**

- **Backend**: Node.js
    
- **Schichtenmodell:**
    
    - **Controller** (Validierung + API Interface)
        
    - **Service** (Business Logik)
        
    - **Model** (DB-Kommunikation)  
        _→ exakt wie du es in deiner Standardstruktur verwendest._
        

## **5.2 Technologien**

- Node.js + Express/Fastify
    
- MongoDB (+ Mongoose optional, aber du nutzt native Driver)
    
- Redis für Caching & Rate Limiting
    
- Stripe als Payment-Gateway
    
- JSON Web Tokens für Auth
    

## **5.3 Infrastruktur**

- Docker Compose
    
- Staging + Production
    
- MongoDB Atlas Cluster
    
- CI/CD (GitHub Actions)
    

## **5.4 Security-Konzept**

- Passwort-Hashing mittels BCrypt
    
- Input Sanitization
    
- OWASP Schutz (NoSQL Injection, XSS, CSRF im Frontend)
    
- HTTP Security Headers
    
- Logs ohne PII
    

---

# **6. UX/UI-Vorplanung**

## **6.1 User Flows**

- **Booking Flow**: Home → Space → Datum → Checkout → Payment → Confirmation
    
- **Host Flow**: Login → Dashboard → Space erstellen → Verfügbarkeiten → Buchungen verwalten
    
- **Review Flow**: Nach completed Booking → Bewertung abgeben
    

## **6.2 Wireframes**

- Login/Register
    
- Dashboard Host + User
    
- Space Detail Page
    
- Booking Calendar
    
- Checkout Page
    

## **6.3 Layoutsystem**

- Tailwind / PrimeFlex / CSS Grid
    
- Responsives 12-Spalten Layout
    
- Komponenten: Card, List, Form, Calendar, Modal, Toasts
    

---

# **7. Prototyping / Mocking**

## **7.1 Mock API**

- Swagger generiert
    
- Mock-Daten: 20 Spaces, 100 Bookings
    
- Endpunkte geben statische JSONs zurück
    

## **7.2 Dummy Frontend**

- Navigation + Basis-Komponenten
    
- Calendar und Checkout als Mock
    
- Zeigt früh den kompletten Flow
    

## **7.3 Technischer MVP**

- Fake Payments (Payment Simulator)
    
- Keine echte Datenbank
    
- Kein Auth → hart codierter Test-User
    

---

# **8. Start der Implementierung**

## **8.1 Repos anlegen**

- Backend
    
- Frontend
    
- Shared (optional)
    

## **8.2 Basis implementieren**

- Projektstruktur erzeugen
    
- Config Loading
    
- Logger
    
- Error Handler
    
- JWT Auth
    
- User Module
    
- Danach: Spaces → Bookings → Payments → Reviews
    

## **8.3 Tests**

- Unit-Tests (Services)
    
- Integration-Tests (API mit MongoMemoryServer)