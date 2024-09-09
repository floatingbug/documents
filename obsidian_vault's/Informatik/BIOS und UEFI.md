- **SSD**
  - Nutzen keine Zylinder und Köpfe.
  - Sektoren sind vorhanden (jeder Sektor ist 512 Byte groß).

---

- **MBR und GPT**
  - Sowohl MBR (Master Boot Record) als auch GPT (GUID Partition Table) sind Methoden zur Verwaltung von Festplattenpartitionen und zum Starten des Betriebssystems.

---

- **Bootmanager**
  - Ermöglicht die Auswahl von Bootloadern oder weiteren Bootmanagern.

---

- **Bootloader**
  - Lädt das Betriebssystem.

---

- **MBR**
  - Jede Festplatte hat einen Bereich, der sich Master Boot Record nennt.
    - Ist immer der erste Sektor der Festplatte oder der SSD.
  - **Bootvorgang:**
    - **MBR-Code:** Der MBR-Bereich enthält den Bootloader-Code (nicht den Bootloader), der als erstes aufgerufen wird, wenn der Computer startet. Dieser Code ist normalerweise sehr einfach und hat die Aufgabe, den Bootmanager oder den Bootloader des Betriebssystems von der Partition zu laden, die im MBR als "aktiv" markiert ist.
    - **Partitionstabelle:** Der MBR-Bereich enthält die Partitionstabelle, die Informationen über die Partitionen auf der Festplatte speichert. Der Bootloader-Code im MBR verwendet diese Informationen, um die aktive Partition zu identifizieren.
      - **Aktive Partition:** Enthält entweder einen Bootloader von einem Betriebssystem mit den für den Bootvorgang notwendigen Dateien oder einen Bootmanager.

---

- **GPT**
  - GPT besteht nicht nur aus einem Bereich auf der Festplatte, sondern aus mehreren.
    - **GPT Header:** Enthält Informationen über die GPT-Tabelle, die Größe und Position der Partitionstabelle und Prüfziffern (Checksummen). Befindet sich im ersten Sektor der Festplatte.
    - **Partition Entry Array:** Eine Liste von Partitionseinträgen (Partitionstabelle), die Details zu den Partitionen enthält (wie Größe und Typ). Befindet sich im zweiten Sektor der Festplatte.
    - **Backup GPT Header:** Am Ende der Festplatte gespeichert, ist eine Sicherung des GPT-Headers und der Partitionstabelle.
  - **Bootvorgang:**
    - **UEFI (nicht BIOS):** Sucht nach dem Einschalten des Computers in der Partitionstabelle nach der EFI System Partition (ESP).
		- UEFI sieht im GPT Header, wo die Partitionstabelle ist, und liest dann aus dieser, also aus dem Partition Entry Array.
      - **EFI System Partition (ESP):** Diese spezielle Partition ist mit dem Dateisystem FAT32 formatiert und enthält die Bootloader für die installierten Betriebssysteme. Der ESP enthält Verzeichnisse, die Bootloader und weitere Dateien wie Konfigurationsdateien oder Treiber für verschiedene Betriebssysteme enthalten.
      - **UEFI:**  Läd aus der ESP den Bootmanager

- GRUB (Grand Unified Bootloader) ist sowohl ein Bootloader als auch ein Bootmanager. Es übernimmt beide Rollen und bietet die Möglichkeit, 
	zwischen verschiedenen Betriebssystemen zu wählen (Bootmanager-Funktion) und dann das gewählte Betriebssystem zu laden (Bootloader-Funktion).
