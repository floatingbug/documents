# API-Documentation

## Übersicht

[Hier eine kurze Beschreibung der API einfügen.]

## Endpunkte

### 1. GET /api/users

Beschreibung: Holt alle Benutzer aus der Datenbank.

#### Anfrage

Keine Parameter erforderlich.

#### Antwort

```json
[
  {
    "id": {{id}},
    "name": "{{name}}",
    "email": "{{email}}"
  },
  {
    "id": {{id}},
    "name": "{{name}}",
    "email": "{{email}}"
  }
]
