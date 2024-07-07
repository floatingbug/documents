## Container
- Ist eine Laufzeitumgebung.
- Bestehen aus:
	- Eigenem Dateisystem, das aus einer Image-Datei (Abbild eines Dateisystems) erstellt wird.
		- In diesem Dateisystem ist eine oder mehrere Anwendung vorhanden.
	- Images sind die Baupläne für Container.
		- Durch ein Image wird der jeweilige Container erstellt.

## Docker-Daemon
- Der Docker-Daemon verwaltet den Container.
- Ein Container ist die Instanz einer Image (Dateisystem, das in den speicher geladen wird)
	- Der Docker-Daemon startet die Anwendung innerhalb des gemounteden Dateisystems (image das in den Speicher geladen wurde).
		- Die Information welche Anwendung im Dateisystem gestartet werden soll, ist in der Dockerfile-Datei enthalten.
- Dockerfile-Datei:
	- In der Dockerfile werden Anweisungen festgelegt, wie das Image erstellt wird. Dies beinhaltet unter anderem, welche Anwendung gestartet werden soll.

## Zusammenfassung
- Container sind in den Speichergeladene Dateisysteme, in denen sich eine oder mehrere Anwendung befinden. der Docker-Daemon startet die "Hauptanwendung" (Einstiegspunkt) und verwaltet die Ausführung des Containers. In dem Dockerfile wird konfiguriert, welche Anwendung beim erstellen des Containers vom Docker-Daemon gestartet werden soll. Im Dockerfile können viele weiter Anweisungen stehen.
