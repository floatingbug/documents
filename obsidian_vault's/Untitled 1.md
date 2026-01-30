# Lesemuster > Datenmodell

Beispiel:
Der Client braucht: 
- title
- priority
- description
- tags

Diese Felder werden gemeinsam und regelmäßig gelesen.

Ein Lesemuster beschreibt:  
👉 **Welche Felder werden gemeinsam und regelmäßig gelesen?**

Daher:
- diese vier Felder werden **zusammen**
- für **denselben Zweck**
- in **einer View / einem Request**  
    benötigt

MongoDB hört das und denkt:

„Okay, dann speichere ich sie **zusammen in einem Dokument**.“

Deshalb:
**Lesemuster > Datenmodell**