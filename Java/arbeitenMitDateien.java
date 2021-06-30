/*
Ein Datenstrom trnsportier Daten.
Eingabedaten werden von einer Datenquelle zum Programm transportiert,
Ausgabedaten werden von dem Programm zu einer Datensenke transportiert.
(Datenquelle)-->(Eingabestrom)-->(Programm)
(Programm)-->(Ausgabestrom)-->(Datensenke)
Eingab- und Ausgabestrom übertragen also Daten.
Zeichenorientierter Datenstrom überträgt Bytes die als zeichen interpretiert
werden können z.B. utf-8.
Byteorientierter Datenstrom überträgt Bytes als Bytestrom.
Die Klasse java.io.FileReader fungiert als Eingabestrom in das Programm hinein.
Die Klasse java.io.FileWriter fungiert als Ausgabestrom aus dem Programm heraus.
Klassen für Datenströme:

-> Zeichenorientiert
  -> java.io.Reader //Oberklasse für Eingabestrom
    -> InputStreamReader
    -> BufferedReader
    -> StringReader
  ->java.io.Writer //Oberklasse für Ausgabestrom
    -> OutputStreamWriter
    -> BufferedWriter
    -> StringWriter

-> Byteorientiert
  ->java.io.InputStream //Oberklasse für Eingabestrom. System.in ist
                        //Instanz von InputStream und ist der std. input-, output-, error-stream.
    -> FileInputStream
    -> AudioInputStream
    -> ObjectInputStream
  ->java.io.OutputStream //Oberklasse für Ausgabestrom
    -> FileOutputStream
    -> FilterOutputStream
    -> ObjectOutputStream
*/

/*
BufferedReader
*/
//Der BufferedReader Puffert (Speichert) Daten, die von einem Datenstrom kommen,
//zwischen. Diese Daten können als Zeichenketten interpretiert werden z.B. utf8.
//Die Methode readLine() entnimmt aus dem Puffer Daten
//bis zum ersten Zeilenumbruch und gibt diese zurück.
//(Datei)-->(FileReader)-->(BufferedReader)-->(Programm).
//FileReader liest aus einer Datei.
File file = new File(pfad);
FileReader fileReader = new FileReader(file);
BufferedReader bufferedReader = new BufferedReader(fileReader);

for(String zeile = bufferedReader.readLine(); zeile != null; zeile = bufferedReader.readLine()){

  System.println(zeile);

}

//In Datei Schreiben.
//(Programm)-->(FileWriter)-->(Datei)
//FileWriter Schreibt in eine Datei.
File file = new File(pfad);
FileWriter fw = new FileWriter(file);
fw.write("hier steht ein string");
fw.close() //ohne close wird nicht in die Datei geschrieben.
