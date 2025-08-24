
**Beispiele:** GPT, o-GPT, GEMINI...

### Wo werden LLM's eingesetzt?

##### Chat

- Eingaben des Nutzers werden an LLM übertragen.
- LLM Verarbeitet die Eingabe des Benutzers (Prompt) incl. dem Chatverlauf, Anhänge usw.
- LLM überträgt die Antwort an den Chat-Prozess, der die Antwort im Chatverlauf anzeigt.

---

# Context Window

 Es beschreibt den **maximalen Umfang an Text**, den das Modell gleichzeitig "sehen" und berücksichtigen kann, um eine Antwort zu generieren.

Ein Kontextfenster ist wie ein **Gedächtnisrahmen**:  
Das Modell kann nur eine bestimmte Anzahl von **Tokens** (also Textbausteinen wie Wörter oder Satzzeichen) gleichzeitig "im Kopf behalten" und daraus Schlussfolgern.

### 🔢 Beispiel mit Token-Anzahl

| Modell  | Kontextfenster (max. Tokens) |
| ------- | ---------------------------- |
| GPT-3   | 2.048 Tokens                 |
| GPT-3.5 | 4.096 Tokens                 |
| GPT-4   | 8.192 oder 32.768 Tokens     |
| GPT-4o  | bis zu 128.000 Tokens        |

- **1 Token ≈ 0,75 Wörter (im Englischen)**.  
    Beispiel:  
    → 100 Tokens ≈ 75 englische Wörter  
    → 1.000 Tokens ≈ ~750 Wörter (~1 A4-Seite Text)  
    → 128.000 Tokens ≈ über 300 Seiten Text
    

---

### 🧠 Wozu dient das Kontextfenster?

- Es enthält:
    - deinen Prompt (Frage, Text, Code usw.)
    - vorherige Teile der Konversation
    - eventuell eingebettete Dokumente oder Chatverlauf

- Das Modell verwendet den gesamten Kontextfenster, um:
    - relevante Informationen zu erkennen
    - kohärente Antworten zu geben
    - sich an frühere Anweisungen zu „erinnern“


---

### 📉 Begrenzung

Wenn du zu viel Text (z. B. ein ganzes Buch) eingibst, **wird der Anfang abgeschnitten**, sobald das Limit überschritten wird. Das kann z. B. bedeuten, dass frühere Anweisungen verloren gehen, wenn du sehr lange Inputs verwendest.

---

### 🛠 Was zählt alles als Kontext?

- Deine Eingabe („Prompt“)
    
- Frühere Eingaben und Ausgaben im Chat
    
- Systemanweisungen
    
- Eventuell: eingebundene Dateien oder Anmerkungen vom Benutzer
    

---

### 🧩 Warum ist das wichtig für Entwickler?

Wenn du mit GPT ein Tool oder Plugin entwickelst:

- Du musst im Auge behalten, **wie viele Tokens du verwendest**, sonst kommt es zu:
    
    - Fehlern („context length exceeded“)
        
    - unerwartetem Verhalten (Modell ignoriert Teile)
        
- Manche Entwickler bauen explizite **Kontext-Management-Systeme**, die:
    
    - irrelevante Teile rausfiltern
        
    - den Kontext dynamisch zusammenfassen
        
    - oder vektorbasierte Retrieval-Systeme (RAG) verwenden