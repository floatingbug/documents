/*
-> Die Klasse java.util.Date representiert ein Datum.
-> Objekte der Klasse Date stellen einen Zeitpunkt dar: mm:dd:yyyy und Uhrzeit hh:mm:ss auch in Millisekunden.
*/
//Der default Konstruktor erstellt ein Objekt, der das aktuelle Datum und die aktuelle Uhrzeit
//bei der erstellung enthält.
Date datum = new Date();

//Man kann dem Konstruktor einzelne Datums-Werte mitgeben ->Date(Jahr, Monat, Tag, Stunden, Minuten, Sekunden);
Date datum = new Date(1984, 1, 9, 14, 55, 12);

//mit set-Methoden kann man einzelne datumsangaben setzen (die Methode ist deprecated).
datum.setMonth(6);

//Die Klasse java.text.SimpleDateFormat formatiert ein Datums-Objekt in eine bspw. deutschen Datumsrepresentation.
//Die formatierung wird bei der erstellung des SimpleDateFormat-Objektes durch zeichen gesetzt.
SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
Date date1 = new Date();
String aktuelleDatum = sdf.format(date1);

//Mit java.text.SimpleDateFormat lassen sich auch Date-Objekte erzeugen.
SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
String d = "09.01.1984";
Date datum = sdf.parse(d);

/*
  Von der Abstrakten Klasse java.util.Calendar leiten andere Klassen, zur Repräsentation
  von Kalenderangaben, ab, z.B. die Klasse java.util.GregorianCalendar.
  Der default Konstruktor erstellt Objekte, die das Datum der Erstellung enthalten
  (inkl. Uhrzeit und Sekunden).
*/

//Setzen einzelner Kallender-Werte mit der set-methode.
//Die Oberklasse Calendar stellt Attribute wie Calendar.YEAR zur verfügung.
GregorianCalendar kallender = new GregorianCalendar();
kallender.set(Calendar.YEAR, 2013);
kallender.set(Calendar.MONTH, 0);
kallender.set(Calendar.DAY_OF_MONTH, 9);
kallender.set(Calendar.HOUR_OF_DAY, 20);
kallender.set(Calendar.MINUTE, 55);
kallender.set(Calendar.SECONDS, 47);

//Abfrage mit der get-methode von Calendar.
int jahr = kallender.get(Calendar.YEAR);
int monat = kallender.get(Calendar.MONTH);
int tag = kallender.get(Calendar.DAY_OF_MONTH);
int stunde = kallender.get(Calendar.HOUR_OF_DAY);
int minute = kallender.get(Calendar.MINUTE);
int sekunde = kallender.get(Calendar.SECONDS);

//Weiterschalten von datumsangaben, hier um 5 Jahre
kallender.roll(Calendar.YEAR, 5);

//Mit getTime erhält man ein Date-Objekt mit dem man die Datumsangabe
//mit SimpleDateFormat formatieren lässt.
Date datum = kallender.getTime();
