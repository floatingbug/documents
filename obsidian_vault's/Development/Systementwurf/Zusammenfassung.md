# **1. Anforderungen (Requirements Engineering)**

## **1.1 Fachliche Anforderungen (Business Requirements)**

Diese beschreiben **was das System leisten soll**, aus Sicht des Geschäfts oder der Domäne:

- Geschäftsziele definieren (z. B. Buchungsprozesse, E-Commerce, Reporting).
- Rollen & Berechtigungen bestimmen (z. B. Admin, User, Moderator).
- Fachprozesse auflisten und Regeln definieren (z. B. Stornierungsfristen, Genehmigungen, Workflows).
- Edge Cases und Sonderfälle identifizieren (z. B. gleichzeitige Aktionen, fehlerhafte Eingaben).
- Abhängigkeiten zu anderen Systemen festhalten (z. B. externe APIs, Payment Provider).

---

## **1.2 Funktionale Anforderungen (Functional Requirements)**

Diese beschreiben **wie das System sichtbar funktioniert**, also die konkreten Features:

- Authentifizierung & Rollenmanagement (Login, Registrierung, Rechte).
- Kernfunktionalitäten der Domäne (z. B. Buchung, Produktverwaltung, Reporting).
- CRUD-Operationen für zentrale Entitäten (Create, Read, Update, Delete).
- Validierungen und Geschäftslogik (z. B. Zeitkonflikte, Limits, Pflichtfelder).
- Integrationen mit externen Diensten (Payment, Email, Notification).
- Logging, Monitoring und Systemmeldungen.

---

## **1.3 Nicht-funktionale Anforderungen (NFRs)**

- Performance & Skalierbarkeit (z. B. Antwortzeiten, Lastverhalten).
- Sicherheit (z. B. Passwort-Hashing, Input-Sanitization, Rollenprüfungen).
- Usability / UX (z. B. Responsive Design, Barrierefreiheit).
- Verfügbarkeit / Reliability (z. B. 99% Uptime, Backup/Recovery).
- Wartbarkeit & Erweiterbarkeit (Code-Struktur, Modularität).

---

# **2. Domänenanalyse (Domain Analysis)**

- Domänenobjekte / Entitäten identifizieren.
- Beziehungen und Kardinalitäten definieren.
- Domänenregeln, Constraints und Policies dokumentieren.
- Abhängigkeiten zwischen Entitäten festhalten.

---

# **3. Datenmodellierung (Data Modeling)**

- Entitäten, Attribute, Primär- und Fremdschlüssel bestimmen.
- Beziehungen (1:1, 1:n, n:m) modellieren.
- Indexierung und Performance-Optimierungen planen.
- Konsistenzregeln, Constraints, Validierungen festlegen.

---

# **4. API-Design / Schnittstellenspezifikation**

- Endpoints, Ressourcen und HTTP-Methoden festlegen.
- Request- und Response-Formate definieren.
- Fehlercodes und Standardantworten dokumentieren.
- Authentifizierungs- und Rollenregeln definieren.
- Versionierung planen.

---

# **5. Architekturplanung**

- Softwarearchitektur festlegen (Monolith, Microservices, Modular Monolith).
- Schichtenmodell / Modulstruktur definieren (Controller, Service, Model).
- Technologie-Stack auswählen.
- Infrastruktur und Deployment planen (Server, Container, CI/CD, Cloud).
- Sicherheitskonzept erstellen (Auth, Roles, OWASP-Maßnahmen).

---

# **6. UX/UI-Vorplanung**

- User-Flows / Szenarien erstellen.
- Wireframes oder Mockups erstellen.
- Layoutsystem und Design-Richtlinien definieren (Farbpalette, Typografie, Komponenten).
- Mobile- und Desktop-Design planen (Responsivität).

---

# **7. Prototyping / Mocking**

- Mock-APIs oder Dummy-Daten erzeugen.
- Frontend-Prototypen bauen, auch ohne echtes Backend.
- MVP-Flow testen, um frühes Feedback zu bekommen.

---

# **8. Start der Implementierung**

- Projektstruktur anlegen.
- Module / Komponenten in geplanter Reihenfolge implementieren.
- Logging, Error Handling, Tests und Validierungen einbauen.
- Deployment und CI/CD einrichten.
- Iterative Weiterentwicklung nach vorher definierten Anforderungen.
