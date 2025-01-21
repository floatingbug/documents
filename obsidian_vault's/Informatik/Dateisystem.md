# Dateisystem

- Enthält eine Art Inhaltstabelle, in der alle Daten und Verzeichnisse verwaltet werden.
- Um auf das Verzeichnis zugreifen zu können, benötigt das OS den entsprechenden Treiber, z.B. NTFS oder FAT32.

---  

# Virtuelles Dateisystem (VFS)

- Eine Schicht zwischen Betriebssystem und Treiber für die spezifischen Dateisysteme.
- Ermöglicht das verschiedene Dateisysteme einheitlich verwaltet werden können.

##### Zugriff auf Dateien und Verzeichnisse durch I-Nodes (sind auf dem Dateisystem gespeichert).

- VFS nutzt die I-Nodes um die Datei oder das Verzeichnis zu finden.

 --- 
  

# I-Node

- I-Nodes sind Datenstrukturen.
- Jede Datei und Ordner besitzen min. ein I-Node.
- Enthält Metadaten über eine Datei oder Ordner.
	- z. B. Größe, Zugriffsrechte, Verweise auf Datenblöcke zu den Inhalten einer Datei.
- Eindeutig über ID adressiert.
- Sind in Datenblöcke gespeichert, genauso wie Dateien nur an anderer Stelle.
- Verweise werden in einer Liste in der I-Node-Datenstruktur gespeichert.
	- Wenn die Datei so groß wird, dass die Liste nicht mehr ausreicht, verweisen die verweise auf Blöcke die ebenfalls Verweise haben.

##### Verzeichnisse

- Ist eine Datei mit einer Tabelle von Dateinamen und I-Node-Adressen.
	- Dateinamen werden I-Node-Adressen zugeordnet, die die Einstiegspunke zu den Informationen der Dateien liefern.

---

# Treiber

- Bei Zugriff auf einer Datei, muss ein Lesebefehl mit den entsprechenden Parametern (Adresse usw.) an den entsprechenden Controller gesendet werde.
	- Das VFS verwendet den entsprechenden Treiber um den korrekten Lesebefehl an den Controller zu senden bspw. Ein FAT-Treiber.
		- Der Treiber muss das Ergebnis wieder in das VFS-Format umwandeln

---

# Formatierung

- Richtet ein Dateisystem auf dem Datenträger ein.

 ---  

# Image

- Eine Datei mit eigenem Dateisystem (I-Nodes, Inhaltstabelle zur Verwaltung der Daten, Verzeichnisse usw.).
	- Dadurch kann ein Betriebssystem mit seinem VFS und den Treiber des Dateisystems auf die Datei zugreifen, als wäre es ein Datenträger und keine Datei des eigenen Dateisystems.
- Bei der Erstellung wird die Datei erst mit dem Dateisystem z.B. FAT Formatiert und dann bspw. Eine Kopie eines Verzeichnisses darauf abgelegt.
- DVDs nutzen das UDF-Dateisystem.