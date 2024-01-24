/*
Der Compiler verwaltet die Zuordnung zwischen Variablen und Speicheradressen
*/
int i = 42;
  //-> In i wird direkt die Zahl 42 gespeichert.

/*
Adressoperator & liefert Adresse eines Objektes oder Variable.
*/
int i = 0;
cout << &i << endl;

/*
Zeiger * hat eigene Adresse (im gegensatz zur Referenz). Der zeiger speichert unter 
dieser Adresse die Adresse zu einer Variable oder Objekt.
*/
int i = 0;
int *zeiger;
zeiger = &i;

//Kurzform
int *zeiger = &i;

//-> Bei Zeigern muss der Datentyp mit angegeben werden, damit der Compiler weiß,
//Wie viel Bytes an der Adresse erwartet werden.
  //-> Dadurch weiß der Compiler, wie viele Bytes er beim dereferenzieren abrufen soll oder
  //wie viel maximal an die Adresse gespeichert werden kann.

//-> Durch die Angabe vom Datentyp weiß der Compiler, wie er die Daten interpretieren muss.

/*
Unterschied zwischen Zeiger und Reference:
*/
int *zeiger = &i; 
  //-> In der zeiger Variable ist die Adresse einer anderen Variable gespeichert.
    //-> Die andere Variable speichert den tatsächlichen Wert.
      //-> zeiger(Adresse_a) -> Variable(Wert)

int j = 100;
int &i = j;
  //-> Die Referenz i speichert den gleichen Wert wie j, da der Compiler sowohl j
  // als auch i den gleichen Speicheradressen zuordnet.

/*
Dereferenzierer * Referenziert auf den Inhalt auf die Variable, deren Adresse im 
Zeiger gespeichert ist.
*/
int *zeiger = &i;
*zeiger = 100; //*zeiger ist der Dereferenzierer. Daher, die Variable i speichert den Wert 100.

/*
Zeiger als Funktionsparameter
*/
//Adresse wird übergeben z.B. &i und im Zeiger *x gespeichert
void setzeAufNull(int *x){
  *x = 0; //durch Dereferenzierer Zugriff auf Wert.
}

/*
Referenz als Funktionsparameter
*/
void function(Objekt &o){}

//oder
void function(int &i){}

//Beim Aufruf wird einfach eine Variable oder ein Objekt übergeben

function(object);
function(i);


