//Header-Deklaration
//Wurde die Header-Datei noch nicht hinzugefügt,
//wird beim hinzufügen das Macro KLASSEA erstellt.
//Sollte die Header-Datei schon einmal hinzugefügt worden sein,
//wird sie nicht erneut hinzugefühgt (ifndef -> endif).
#ifndef KLASSEA
#define KLASSEA

class KlasseA{
public:
  int wert1 = 0;
  void fkt();
}

#endif

//Klassen-Definitionen
#include "klasseA.h"

  void KlasseA::fkt(){
    //do something
  }


//Mit new wird Speicher reserviert und das Objekt
//gespeichert.
//Zurück gegeben wird die Adresse zu dem Speicherort.
#include "klasseA.h"

int main(){
  KlasseA *klasseA = new KlasseA();
  delete klasseA;

  return 0;
}

//mit delete wird das Objekt wieder zerstört,
//der Speicherbereich wird wieder frei gegeben.
