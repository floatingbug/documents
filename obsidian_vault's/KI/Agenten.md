
# Was ist ein Agent

Ein Agent erhält Anweisungen vom LLM, führt diese aus und sendet das Ergebnis zurück.

---

# Interface zwischen LLM und Agent

Damit ein Agent die Befehle des LLM versteht, müssen die Befehle so übersetzt werden, damit der Agent sie versteht, das geschieht durch eine Schnittstelle (Interface).
Die Übersetzung geschieht durch die Regeln des **MCP** (Model Context Protocol).
Das MCP gibt vor, wie das Format der Nachrichten sein muss, die zwischen LLM und Agent 
ausgetauscht werden.

### MCP konforme Nachricht von LLM an Agent

Der LLM kann keine Datei lesen, in der eine MCP-Definition steht. LLM benötigt aber diese Informationen.

##### Zwei Möglichkeiten dem LLM die Information zu geben:

- **Beim Prompting:**  
    Die Inhalte einer Datei (z.B. Task-Definition mit Aktionen und Parametern) werden dem LLM als Teil des Prompts in Textform übergeben.  
	    Beispiel: Im Prompt die Definition eingeben.

- **In einem Langzeit-Setup:**  
    Datei mit Definition liegt extern und das System (z.B. dein Programm, das das LLM anspricht) liest die Datei aus, formatiert sie als Text und hängt sie als Kontext an den Prompt an.

Im folgenden wird der Ablauf der Übersetzung, bei Einhaltung des MCP, dargestellt.

### 1. LLM-Seite: Befehle / Aktionen definieren

Der LLM „weiß“, welche Aktionen es geben kann, also z.B. `create_file`, `delete_file`, `read_file` usw. Das kann in einer **Task-Definition-Datei** (z.B. JSON oder YAML) stehen, z.B.:
```json
{
  "create_file": {
    "description": "Erstelle eine Datei mit gegebenem Namen und Inhalt",
    "parameters": ["filename", "content"]
  },
  "delete_file": {
    "description": "Lösche eine Datei mit gegebenem Namen",
    "parameters": ["filename"]
  }
}
```
- Der LLM nutzt das als **Wissensbasis**, um passende Befehle zu erzeugen.    


### 2. Agent-Seite: Mapping auf tatsächliche Befehle

Der Agent hat eine eigene Datei (z.B. `commands.json`), die sagt, wie diese Aktionen ausgeführt werden, z.B.:
```json
{
  "create_file": "echo '{content}' > {filename}",
  "delete_file": "rm {filename}"
}
```
- Der Agent liest den Task (z.B. `create_file`) und füllt die Platzhalter `{filename}` und `{content}` mit den Werten aus der Aufgabe.
- Dann führt er den Shell-Befehl aus.


### 3. Gesamtfluss

1. LLM bekommt eine Aufgabe („Erstelle eine Datei `test.txt` mit Inhalt ‚Hallo‘“)    
2. LLM erzeugt JSON-Aufgabe:
```json
{
  "action": "create_file",
  "parameters": {
    "filename": "test.txt",
    "content": "Hallo"
  }
}
```
1. Agent erhält das JSON, schaut in seine Mapping-Datei, erkennt `create_file`, baut den Shell-Befehl: `echo 'Hallo' > test.txt`
2. Agent führt den Befehl aus
3. Agent meldet Ergebnis zurück

---

### Vorteile

- **Trennung von Verantwortung**: LLM „denkt“ nur in Aktionen, Agent kennt Details der Ausführung    
- **Flexibilität**: Shell-Befehle lassen sich einfach anpassen oder erweitern
- **Erweiterbarkeit**: Neue Aktionen hinzufügen durch Ergänzen der Dateien

---
