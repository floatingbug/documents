API-Beispiel Dokumentation

---

Endpunkte:
- /users
  - GET: Abrufen aller Benutzer
  - POST: Erstellen eines neuen Benutzers

- /users/{id}
  - GET: Abrufen eines bestimmten Benutzers
  - PUT: Aktualisieren eines bestimmten Benutzers
  - DELETE: Löschen eines bestimmten Benutzers

---

Parameter:
- GET /users
  - Keine Parameter

- POST /users
  - Name: String (Erforderlich)
  - Email: String (Erforderlich)

- PUT /users/{id}
  - Name: String (Optional)
  - Email: String (Optional)

- DELETE /users/{id}
  - Keine Parameter

---

Antwortcodes:
- 200: Erfolgreiche Anfrage
- 201: Erfolgreich erstellt
- 400: Ungültige Anfrage
- 404: Nicht gefunden
- 500: Serverfehler

---

Authentifizierung:
- Authentifizierung ist erforderlich für /users und /users/{id}
- Verwenden Sie den Token im Authorization-Header für die Authentifizierung
- Beispiel: Authorization: Bearer {token}
