/*
Jede .cpp-Datei wird zu einer binären .o Datei (Objekt-Datei) übersetzt.
Damit DateiA weiss, welcher Datentypen in die Funktion fktB(23, 23) rein geht (Funktionsparameter) und
welche raus gehen (return), muss die Deklaration der Funktion bekannt sein.
Die Struktur der binären Datei ist somit korrekt.
*/

//DateiA
#include "DateiB.h"

int main(){
  fktB(23, 23);
}


