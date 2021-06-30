#-> in der virtuellen Umgebung werden über Umgebungsvariablen die Pfade für die zu verwendenden 
	#Bibliotheken erstellt, so dass die virtuelle Umgebung unabhängig von den Pythonbibliotheken 
	#des Betriebssystems ist.
#-> Installationen von packages aus dem Python Package Index (pip) werden direkt im Verzeichnis des
	#Virtual Environments installiert. Dadurch sind keine Administratorrechte erforderlich.
#-> Jedes Virtual Environment hat seine eigenen site-packages sowie pip- und python-Kommandos.



#virtualenv im aktuellen Projektordner anlegen und mit -p den Interpreter Bestimmen 
#durch -p wird der Interpreter für die virtualenvironment bestimmt
$ virtualenv -p python3.8 .

#virtualenv anlegen alternative
#durch -m werden alle Pfade in sys.path nach dem venv-module durchsucht 
$ python3.8 -m venv .

#virtual environment im root-Verzeichnis im Projekt-Ordner Aktiviren
$ source bin/activate

#virtualenv verlassen
$ deactivate 

#requirements aus textfile installieren (in der virtualenv)
pip3 install -r requirements.txt
