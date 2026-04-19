## 🏢 Rechnungssteller (Verkäufer)

- Firmenname → **Benutzer-Settings**
- Rechtsform (z. B. GmbH, UG, Einzelunternehmen) → **Benutzer-Settings**
- Straße → **Benutzer-Settings**
- Postleitzahl → **Benutzer-Settings**
- Stadt → **Benutzer-Settings**
- Land → **Benutzer-Settings**
- USt-IdNr. ODER Steuernummer → **Benutzer-Settings**
- Handelsregister + Nummer (falls vorhanden) → **Benutzer-Settings**

---

## 👤 Rechnungsempfänger (Kunde)

- Name → **Rechnung**
- Straße → **Rechnung**
- Postleitzahl → **Rechnung**
- Stadt → **Rechnung**
- Land → **Rechnung**
- USt-IdNr. (bei B2B / EU) → **Rechnung (optional)**

---

## 🧾 Rechnungsinformationen

- Rechnungsnummer → **automatisch generiert (System, NICHT manuell)**
- Rechnungsdatum → **automatisch (Default: heute, überschreibbar)**
- Leistungsdatum / Leistungszeitraum → **Rechnung (Default möglich aus System)**

---

## 📦 Positionen (pro Item)

- Bezeichnung / Name → **Rechnung**
- Beschreibung → **Rechnung (optional, aber empfohlen)**
- Menge → **Rechnung**
- Einzelpreis netto → **Rechnung**
- Steuersatz (%) → **Rechnung**

---

## 💰 Beträge

- Nettobetrag gesamt → **berechnet**
- Steuerbetrag je Steuersatz → **berechnet**
- Gesamtsteuer → **berechnet**
- Bruttobetrag → **berechnet**
- Währung (z. B. EUR) → **Benutzer-Settings**

---

## 🧾 Steuerangaben (Pflicht je nach Fall)

### Standardfall:

- Steuersatz + Steuerbetrag → **berechnet**

### Kleinunternehmer (§19 UStG):

- Hinweistext → **Benutzer-Settings**
    - „Gemäß §19 UStG wird keine Umsatzsteuer berechnet.“

### Reverse Charge (EU B2B):

- Hinweistext → **Rechnung (automatisch je nach Fall)**

---

## 💳 Zahlungsinformationen

- Zahlungsziel (z. B. 14 Tage) → **Benutzer-Settings (Default) + optional überschreibbar**
- IBAN → **Benutzer-Settings**
- BIC → **Benutzer-Settings (optional)**
- Bankname → **Benutzer-Settings**
- Zahlungsbedingungen (Text) → **Benutzer-Settings**

---

## 📝 Optional (aber sehr sinnvoll)

- Notiz → **Rechnung**
- Kunden-E-Mail → **Rechnung**
- Projektreferenz / Kundennummer → **Rechnung**
- Leistungszeitraum (von/bis) → **Rechnung**