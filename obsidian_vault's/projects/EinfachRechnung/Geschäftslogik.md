# 1. Status-System

## Definition

invoice.status = [  
  "draft",  
  "sent",  
  "paid",  
  "overdue",  
  "cancelled"  
]

## Regeln

- Eine Rechnung startet immer mit:
    - `status = "draft"`
- Status-Übergänge:

|von|nach|Bedingung|
|---|---|---|
|draft|sent|Rechnung wurde versendet|
|sent|paid|Betrag vollständig bezahlt|
|sent|overdue|Zahlungsziel überschritten|
|overdue|paid|Betrag vollständig bezahlt|
|*|cancelled|manuell storniert|

## Einschränkungen

- `paid` ist final (keine Änderung erlaubt)
- `cancelled` ist final
- `draft` darf nicht als XRechnung exportiert werden

---

# 2. Zahlungslogik

## Felder

invoice.totalAmount  
invoice.paidAmount  
invoice.dueDate

## Regeln

- `paidAmount <= totalAmount`
- Rechnung ist vollständig bezahlt wenn:

paidAmount === totalAmount

→ dann:

status = "paid"

---

## Teilzahlungen

- erlaubt
- Status bleibt:
    - `sent` oder `overdue`

---

## Überfällig

Wenn:

currentDate > dueDate && paidAmount < totalAmount

→ dann:

status = "overdue"

---

# 3. Berechnungen

## Position

item.total = item.quantity * item.unitPrice

## Rechnung

invoice.netTotal = sum(item.total)  
invoice.taxAmount = netTotal * taxRate  
invoice.grossTotal = netTotal + taxAmount

## Regeln

- alle Werte müssen deterministisch berechnet werden
- keine manuelle Überschreibung erlaubt
- Rundung auf 2 Nachkommastellen

---

# 4. Validierung

## Pflichtfelder

- customer.name
- customer.address
- invoice.issueDate
- mindestens eine Position

---

## Positionsregeln

- quantity > 0
- unitPrice >= 0

---

## Rechnungsregeln

- totalAmount > 0
- dueDate >= issueDate

---

# 5. Verknüpfungen

## Kunde

invoice.customerId

- muss existieren

---

## Produkte (optional für V1!)

👉 Empfehlung:

- erstmal **nicht implementieren**
- nur freie Positionen

---

## Verträge

👉 raus aus V1

---

# 6. Events / Trigger

## Rechnung erstellt

event: "invoice.created"

→ optional:

- E-Mail senden

---

## Überfällig

event: "invoice.overdue"

→ optional:

- Mahnung

---

## Bezahlt

event: "invoice.paid"

→ automatisch:

- Status setzen