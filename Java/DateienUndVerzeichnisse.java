/*
Die Klasse java.io.File erlaubt den Zugriff auf das Dateisystem.
Objekte von File repräsentieren Pfade zu Ordner oder Datein die
voranden sind, um sie zu bearbeiten, oder Dateien und Ordern sind nicht
vorhanden, die dann erstellt werden können.
*/

//Mit listRoots() bekommt man alle Wurzelverzeichnisse als File-Array
//zurückgeliefert. Unter Linux ist das: "/", unter Windows: "C", "D", ... .
File[] roots = File.listRoots();

//listFiles listet Unterverzeichnisse und Dateien eines Verzeichnisses auf,
//und gibt sie als File-Array zurück;
File[] listedFiles = roots[0].listFiles();

//Die Konstante seperator enthält, je nach Betriebssystem, das
//korrekte Trennzeichen für die Pfadangabe (Linux: /, Windows \).
String sep = File.seperator;
String pfad = sep + "home" + sep + "benutzername";

/*
Prüfen von Verzeichnissen und Dateien
*/

//Prüft ob ein Verzeichnis oder Datei existiert.
File dateiOderVerzeichnis = new File(pfad);

dateiOderVerzeichnis.exists();

dateiOderVerzeichnis.isDirectory();

dateiOderVerzeichnis.isFile();

dateiOderVerzeichnis.canRead();

dateiOderVerzeichnis.canWrite();

//Größe der Datei.
dateiOderVerzeichnis.length();

/*
Mit den Methoden mkdir() und mkdirs
können neue Ordner und Dateien angelegt werden.
*/

//Erstellt max. ein Verzeichnis oder eine Datei.
dateiOderVerzeichnis.mkdir();

//Kann mehrere Verzeichnisse erstellen.
dateiOderVerzeichnis.mkdirs();

/*
Datein verschieben mit renameTo();
*/

//getName() gibt den Dateinamen als String zurück.
//renameTo() ändert den Pfad der Datei und Verschiebt sie somit.
String zielort = sep + tmp + sep + inport + sep;
File datei = File("pfad zur datei");
zielort = zielort + datei.getName();
datei.renameTo(zielort);
