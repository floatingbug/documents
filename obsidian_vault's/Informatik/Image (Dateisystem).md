## Dateisystem als Image
- Durch einer image-Datei hat der Container (also der Prozess) sein eigenes isoliertes Dateisystem.
	- Container verwenden Images als Grundlage für ihre Dateisystemumgebung.
- In der Image-Datei befindet sich das Dateisystem, auf das der Container zugreift.
	- Dadurch können Container in ihrer eigenen Umgebung ausgeführt werden.
	- Dadurch ist sichergestellt, dass der Container nur auf Dateien im eigenem Dateisystem zugreift.
	- Zweck: Damit der Container nicht auf andere Daten, außer auf die des eigenen Dateisystems, zugreifen kann und dass für den Prozess notwendige Dateien nicht auf dem Host-Dateisystem vorhanden sein müssen, alles befindet sich in der Image-Datei.
	- Vorteil: Es muss nichts installiert werden, alles läuft auf dem eigenen Dateisystem.
		- Bibliotheken, Links, Konfigurationsdateien befinden sich auf dem eigenen Dateisystem (Image) und nicht auf dem Host-Dateisystem.