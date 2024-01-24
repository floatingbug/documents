//Anweisung an den Prä-Prozessor
#include <iostream>

int main(){

  //Hello World wird in Ausgabepuffer geleitet.
  //Dann wird endl in den Ausgabepuffer geleitet.
  //Puffer wird erst geleert und damit auf dem Bildschirm
  //ausgegeben, wenn Puffer voll ist.
  //mit endl wird der Puffer sofort geleert und somit ausgegeben.
  std::cout << "Hello World" << std::endl;

  return 0;
}
