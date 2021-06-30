#include <memory>

/*
Pointer werden beim verlassen des scopes automatisch gelöscht.
Die library memory muss eingebunden werden.
*/

/*
shared Pointer hat ein counter, der anzeigt, wie viele shared pointer
auf ein objekt verweißen.
Wird innerhalb eines scopes {} ein shared pointer erstellt,
wird der counter um eins erhöt. wird der scope verlassen,
wird der speicher automatisch freigegeben (Objekt aus dem Heap gelöscht)
und der counter um eins verringert.
*/

shared_ptr<ClassName> p(new ClassName());

//erst wenn des shared pointers counter auf 0 steht, wird das Objekt gelöscht.
{
  shared_ptr<ClassName> p(new ClassName()); //counter 1
  {
    shared_ptr<ClassName> p2 = p; //counter 2
  } //counter 1
} //counter 0

//beforzugte generierung von shared pointer
shared_ptr<ClassName> p = make_shared<ClassName>();
shared_ptr<ClassName> p2 = p;

/*
uniqu pointer zeigt immer nur auf ein objekt.
Wird der scope verlassen, wird das Objekt gelöscht.
Zeigt der uniqu pointer auf ein neues Objekt, wird das alte gelöscht.
*/
