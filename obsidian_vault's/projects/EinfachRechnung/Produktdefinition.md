
**Zielgruppe:**  
Kleine deutsche Handwerksbetriebe mit 1–20 Mitarbeitern.

**Problem:**  
Diese Betriebe müssen Rechnungen erstellen und zunehmend auch als E-Rechnung ausgeben können, haben aber oft keine einfache Lösung dafür und wollen sich nicht mit technischen Standards beschäftigen.

**Produkt:**  
Eine einfache Web-App, in der Rechnungsdaten normal eingegeben werden und daraus eine exportierbare E-Rechnung erzeugt wird.

**Kernversprechen:**  
Normale Rechnungsdaten eingeben, E-Rechnung exportieren.

**V1-Scope:**

- Firmendaten verwalten
- Kundendaten eingeben
- Rechnung erstellen
- Positionen erfassen
- Summen berechnen
- Rechnung speichern
- E-Rechnung exportieren

**Nicht Teil von V1:**  
Buchhaltung, Angebote, Termine, Lager, Mahnungen, Teams, Integrationen, komplexe Automatisierungen.

---

# 🔥 Die eigentliche Trennung

## UI-getrieben (dein SaaS)

- create
- findById
- findMany
- addPayment
- send
- cancel

👉 das ist dein Produkt

---

## Infrastruktur / API (später Geld!)

- exportXrechnung

👉 DAS ist später dein API-Business

---

# 💡 Warum das wichtig ist

Der Handwerker will:

❌ „API nutzen“  
❌ „Endpoints verstehen“

👉 der will:

> „Rechnung schreiben und fertig“

---

# 💡 Wer deine API wirklich nutzt

Nicht der Handwerker.

👉 Sondern:

- andere SaaS-Tools
- ERP-Systeme
- Buchhaltungssoftware
- Plattformen

---

# 🧠 Beispiel Real-World

Ein Tool für Handwerker nutzt deine API:

- erstellt Rechnung intern
- ruft deine API:
    - `/exportXrechnung`
- bekommt XML
- sendet es weiter

👉 Das ist dein echtes B2B-Modell

---

# 🧠 Fazit (wichtig)

|Endpoint|Nutzer|Zweck|
|---|---|---|
|create|Handwerker (UI)|Rechnung erstellen|
|findById|UI + System|Detail anzeigen|
|findMany|UI + System|Liste / Filter|
|addPayment|Handwerker|Zahlung erfassen|
|send|Handwerker|Status setzen|
|cancel|Handwerker|Rechnung stornieren|
|exportXrechnung|UI + Systeme|XML erzeugen|

---

# 🔥 Wichtigste Erkenntnis für dich

👉 Du baust 2 Produkte gleichzeitig:

## 1. SaaS

für Handwerker

## 2. API

für andere Software

---

Wenn du willst, kann ich dir als nächsten Schritt zeigen:

👉 wie du genau aus deiner API ein **bezahlbares API-Produkt machst (Pricing + Zugang + Keys)**