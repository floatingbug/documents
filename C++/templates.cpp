//Funktion kann mit allen Typen umgehen.
//T ist der Platzhalter für den Typ, der beim
//Funktionsaufruf angegeben wird.
template <typename T>
T add(T a, T b){
  return a+b;
}

//Funktioniert auch mit Klassen
//T ist Platzhalter für den Typ, und wird beim erzeugen des
//Objektes, durch den angegebenen Typ ersetzt.
template <class T>
class Something{
public:
  Something();

  T arr = [2];
  T add();
};

template <class T>
Something<T>::Something(){
  cin >> arr[0] >> arr[1];
}

template <class T>
T Something<T>::add(){
  return arr[0]+arr[1];
}


int main(){
  //Aufruf der Funktion
  cout << add<int>(3, 5) << endl;
  cout << add<float>(3.25, 5.52) << endl;

  //Aufruf der Klasse
  Something<float> something
  cout << something.add();

  return 0;
}
