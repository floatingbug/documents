/*
Adressoperator & liefert Adresse
eines Objektes oder Variable.
*/
int i = 0;
cout << &i << endl;

/*
Zeiger * speichert Adresse einer
Variable oder Objekt.
*/
int i = 0;
int *zeiger;
zeiger = &i;

//Kurzform
int *zeiger = &i;

/*
Dereferenzierer * Referenziert auf den
Inhalt und nicht auf die Adresse.
*/
int *zeiger = &i;
*zeiger = 100;

/*
Zeiger als Funktionsparameter
*/
//Adresse wird übergeben z.B. &i
void setzeAufNull(int *x){
  *x = 0; //durch Dereferenzierer Zugriff auf Wert.
}

/*
Referenz &i
*/
//Variabel i (Referenz) verweißt auf die erstellte
//Variable mit dem Wert 100;
int &i = 100;

/*
Referenz als Funktionsparameter
*/
//Referenz wie int &i = 100; oder ein Objekt
//können als Argument übergeben werden.
void function(Objekt &o){}
