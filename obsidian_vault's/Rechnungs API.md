
# Wörterbuch

### ZRE / PEPPOL

##### ZRE: 
- Senden von Rechnung an Behörden
##### PEPPOL: 
- Senden von Rechnungen an Firem (International)

**Beispiel:**
```js
function sendInvoice(invoice){
  if (invoice.receiver.type === "government"){
    return sendToZRE(invoice)
  }
  else if (invoice.receiver.type === "business"){
    return sendToPeppol(invoice)
  }
  else {
    return sendByEmail(invoice)
  }
}
```

# Umsatzsteuer / Vorsteuer

##### Umsatzsteuer (Output Tax)
- Muss an das Finanzamt gezahlt werden.
- Von der Umsatzsteuer kann die Vorsteuer abgezogen werden.

##### Vorsteuer (Input Tax)
- Wird dem Kaufpreis hinzugerechnet.

---

# Geschäftslogik

### 1. Status-System

invoice.status = [  
  "draft",  
  "sent",  
  "paid",  
  "overdue",  
  "cancelled"  
]

### 2. Zahlungslogik

- bezahlt / nicht bezahlt
- Teilzahlungen
- Zahlungsziel

### 3. Berechnungen

- Netto / Steuer / Brutto
- Summen müssen stimmen

### 4. Validierung

- Pflichtfelder
- korrekte Daten

### 5. Verknüpfungen

- Kunde
- Produkte
- Verträge

### 6. Events / Trigger

- Rechnung erstellt → E-Mail
- Rechnung überfällig → Mahnung
- bezahlt → Status ändern
