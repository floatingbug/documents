////////////////String Methoden//////////////////////
String s = new String("Das ist ein String");
String s = "Das ist ein String";

//gibt true zurück, wenn der String mit "ing" endet
s.endsWith("ing");

//gibt true zurück, wenn der String mit "Das" anfängt
s.startsWith("Das");

//gibt true zurück, wenn der String "ein" enthält
s.contains("ein");

//liefert das erste auftreten von "Das is" zurück, also 0 (integer)
s.indexOf("Das is");

//liefert Position des letzten auftretens von "tring" zurück, also 12
s.lastIndexOf("trin")

//gibt ein Teilstring zurück
s.substring(int anfang, int ende);

//gibt den String in Kleinbustaben aus
s.toLowerCase()

//gibt String zurück, bei dem alle Leerzeichen am anfang und ende entfernt wurden
s.trim()

//An jeder stelle, an der ein Leerzeichen steht, wird der String aufgeteilt und
//in einem Array gespeichert, dass dan zurückgegeben wird.
String[] splitedString = s.spliet(" ");

////////////////////////Buffered Reader/////////////////////////////////////////
//werden mehere Strings miteinander verkettet, muss bei jeder Verkettung
//ein neues String-Objekt erstellt werden.
String s = "Das" + "ist" + "ein" + "String";

//dabei wird viel rechenzeit benötigt.
//mit der Klasse StringBuffer, wird die Objekt-Erzeugung umgangen
StringBuffer sb = new StringBuffer();
sb.append(s1);
sb.append(s2);
sb.append(s3);
String s = sb.toString();
