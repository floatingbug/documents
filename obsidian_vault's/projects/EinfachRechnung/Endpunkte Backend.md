# 1. `create`

## Wer?

👉 Handwerker (über UI)

## Wann?

- neue Rechnung erstellen
    

## Flow:

- Formular ausfüllen
    
- „Rechnung erstellen“ klicken
    
- → API wird aufgerufen
    

## Wichtig:

Das ist dein **Core-Feature**

## Route

POST /invoices

## Params

- keine
    

## Query

- keine
    

## Body

```json
{  
  "seller": {  
    "name": "Krajcik Inc",  
    "street": "43183 Ritchie Villages",  
    "city": "Lindgrenport",  
    "postalCode": "56068",  
    "countryCode": "DE",  
    "vatId": "DE305674019",  
    "email": "jermaine_koepp30@hotmail.com"  
  },  
  "customer": {  
    "name": "Erdman - Leuschke",  
    "street": "8030 Berta Junction",  
    "city": "New Krystal",  
    "postalCode": "53111",  
    "countryCode": "DE",  
    "vatId": "DE305674019",  
    "email": "alene6@hotmail.com"  
  },  
  "invoiceDate": "2026-04-01",  
  "dueDate": "2026-04-15",  
  "currency": "EUR",  
  "items": [  
    {  
      "name": "Handcrafted Plastic Shoes",  
      "description": "Sit dolor reiciendis architecto asperiores corrupti saepe distinctio dicta voluptas.",  
      "quantity": 10,  
      "unitPrice": 77,  
      "taxRate": 19  
    }  
  ],  
  "note": "Test Administrator"  
}
```

## Body-Felder (Beschreibung)

### seller

- `seller.name`  
    Name des Rechnungsstellers (Firma oder Person)
    
- `seller.street`  
    Straße und Hausnummer des Rechnungsstellers
    
- `seller.city`  
    Stadt des Rechnungsstellers
    
- `seller.postalCode`  
    Postleitzahl des Rechnungsstellers
    
- `seller.countryCode`  
    Ländercode im ISO-Format (z. B. `DE`)
    
- `seller.vatId`  
    Umsatzsteuer-ID des Rechnungsstellers
    
- `seller.email`  
    E-Mail-Adresse des Rechnungsstellers
    

---

### customer

- `customer.name`  
    Name des Kunden (Firma oder Person)
    
- `customer.street`  
    Straße und Hausnummer des Kunden
    
- `customer.city`  
    Stadt des Kunden
    
- `customer.postalCode`  
    Postleitzahl des Kunden
    
- `customer.countryCode`  
    Ländercode des Kunden (ISO-Format)
    
- `customer.vatId`  
    Umsatzsteuer-ID des Kunden (optional je nach Fall)
    
- `customer.email`  
    E-Mail-Adresse des Kunden
    

---

### invoice

- `invoiceDate`  
    Datum der Rechnungserstellung
    
- `dueDate`  
    Fälligkeitsdatum der Rechnung (Zahlungsziel)
    
- `currency`  
    Währung der Rechnung (z. B. `EUR`)
    

---

### items

- `items[].name`  
    Name der Leistung oder des Produkts
    
- `items[].description`  
    Detaillierte Beschreibung der Position
    
- `items[].quantity`  
    Menge der Position (z. B. Stunden oder Stück)
    
- `items[].unitPrice`  
    Preis pro Einheit (netto)
    
- `items[].taxRate`  
    Steuersatz in Prozent (z. B. `19`)
    

---

### note

- `note`  
    Freitext für zusätzliche Informationen (z. B. Zahlungsbedingungen)
    

---

## Vom Client gesendet

- `seller.name`
    
- `seller.street`
    
- `seller.city`
    
- `seller.postalCode`
    
- `seller.countryCode`
    
- `seller.vatId`
    
- `seller.email`
    
- `customer.name`
    
- `customer.street`
    
- `customer.city`
    
- `customer.postalCode`
    
- `customer.countryCode`
    
- `customer.vatId`
    
- `customer.email`
    
- `invoiceDate`
    
- `dueDate`
    
- `currency`
    
- `items[].name`
    
- `items[].description`
    
- `items[].quantity`
    
- `items[].unitPrice`
    
- `items[].taxRate`
    
- `note`
    

## Vom Server gesetzt oder berechnet

- `_id`  
    Eindeutige Datenbank-ID der Rechnung
    
- `invoiceNumber`  
    Automatisch generierte Rechnungsnummer
    
- `items[].netTotal`  
    Netto-Betrag der Position (`quantity * unitPrice`)
    
- `items[].taxAmount`  
    Steuerbetrag der Position
    
- `items[].grossTotal`  
    Bruttobetrag der Position
    
- `netTotal`  
    Gesamter Netto-Betrag der Rechnung
    
- `taxAmount`  
    Gesamte Steuer der Rechnung
    
- `grossTotal`  
    Gesamtbetrag inkl. Steuer
    
- `paidAmount`  
    Summe aller eingegangenen Zahlungen
    
- `openAmount`  
    Noch offener Betrag
    
- `paymentStatus`  
    Zahlungsstatus (`unpaid`, `partial`, `paid`)
    
- `status`  
    Status der Rechnung (`draft`, `sent`, `cancelled`)
    
- `payments`  
    Liste aller Zahlungen zur Rechnung
    
- `createdAt`  
    Zeitpunkt der Erstellung
    
- `updatedAt`  
    Zeitpunkt der letzten Änderung
    

---

# 2. `findById`

## Route

GET /invoices/:invoiceId

## Params

- `invoiceId`  
    Eindeutige ID der Rechnung (MongoDB `_id`)
    

## Query

- keine
    

## Body

- keiner
    

---

# 3. `findMany`

## Route

GET /invoices

## Query

- `status`  
    Filter nach Rechnungsstatus (z. B. `draft`, `sent`)
    
- `customerName`  
    Filter nach Kundenname (Teilstring möglich)
    
- `page`  
    Seitenzahl für Pagination
    
- `limit`  
    Anzahl der Ergebnisse pro Seite
    

## Body

- keiner
    

---

# 4. `addPayment`

## Route

POST /invoices/:invoiceId/payments

## Params

- `invoiceId`  
    ID der Rechnung, zu der die Zahlung gehört
    

## Body

```json
{  
  "amount": 300,  
  "paidAt": "2026-04-02",  
  "method": "bank_transfer",  
  "reference": "PAY-2026-0001"  
}
```

## Body-Felder (Beschreibung)

- `amount`  
    Höhe der Zahlung
    
- `paidAt`  
    Datum der Zahlung
    
- `method`  
    Zahlungsart (z. B. `bank_transfer`, `cash`)
    
- `reference`  
    Referenz zur Zahlung (z. B. Verwendungszweck oder Transaktions-ID)
    

## Serverseitig veränderte Felder

- `payments`
    
- `paidAmount`
    
- `openAmount`
    
- `paymentStatus`
    
- `updatedAt`
    

---

# 5. `send`

## Route

PATCH /invoices/:invoiceId/send

## Params

- `invoiceId`  
    ID der Rechnung
    

## Body

- keiner
    

## Wirkung

- Setzt den Status der Rechnung auf „gesendet“
    

## Serverseitig veränderte Felder

- `status`
    
- `updatedAt`
    
- optional später: `sentAt`
    

---

# 6. `cancel`

## Route

PATCH /invoices/:invoiceId/cancel

## Params

- `invoiceId`  
    ID der Rechnung
    

## Body

- keiner
    

## Wirkung

- Markiert die Rechnung als storniert
    

## Serverseitig veränderte Felder

- `status`
    
- `updatedAt`
    
- optional später: `canceledAt`, `cancelReason`
    

---

# 7. `exportXrechnung`

## Route

GET /invoices/:invoiceId/export-xrechnung

## Params

- `invoiceId`  
    ID der Rechnung
    

## Body

- keiner
    

## Response

- XML-Datei der Rechnung im XRechnung-Format
    

## Header

```
Content-Type: application/xml; charset=utf-8  
Content-Disposition: attachment; filename="invoice-<invoiceId>.xml"
```

---

# Beispielhafte Rechnungsstruktur

```json
{  
  "_id": "69cd0fd4deb3a51128448a10",  
  "invoiceNumber": "INV-2026-804526",  
  "seller": {  
    "name": "Krajcik Inc",  
    "street": "43183 Ritchie Villages",  
    "city": "Lindgrenport",  
    "postalCode": "56068",  
    "countryCode": "DE",  
    "vatId": "DE305674019",  
    "email": "jermaine_koepp30@hotmail.com"  
  },  
  "customer": {  
    "name": "Erdman - Leuschke",  
    "street": "8030 Berta Junction",  
    "city": "New Krystal",  
    "postalCode": "53111",  
    "countryCode": "DE",  
    "vatId": "DE305674019",  
    "email": "alene6@hotmail.com"  
  },  
  "invoiceDate": "2026-04-01",  
  "dueDate": "2026-04-15",  
  "currency": "EUR",  
  "items": [  
    {  
      "name": "Handcrafted Plastic Shoes",  
      "description": "Sit dolor reiciendis architecto asperiores corrupti saepe distinctio dicta voluptas.",  
      "quantity": 10,  
      "unitPrice": 77,  
      "taxRate": 19,  
      "netTotal": 770,  
      "taxAmount": 146.3,  
      "grossTotal": 916.3  
    }  
  ],  
  "note": "Test Administrator",  
  "netTotal": 770,  
  "taxAmount": 146.3,  
  "grossTotal": 916.3,  
  "paidAmount": 0,  
  "openAmount": 916.3,  
  "paymentStatus": "unpaid",  
  "status": "draft",  
  "payments": [],  
  "createdAt": "2026-04-01T12:30:12.918Z",  
  "updatedAt": "2026-04-01T12:30:12.918Z"  
}
```