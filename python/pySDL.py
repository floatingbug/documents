#-> sdl2 ist die pySDL2 library. SDL2 ist die SDL2 library.
#-> ctypes ist eine library für Python, mit ihr können funktionen in
#   dll-libraries oder shared-libraries aufgerufen werden.
#   Somit können c-funktions in Python aufgerufen werden.
#   -> sdl2 ist ctypes-bassiert und ermöglicht es, aus dem Python-Programm,
#       Funktionen aus der SDL2 library auf zu rufen.
#-> Statische libraries enthalten module/Unterprogramme in Quellcode Form.
#   Wenn die library als Header-Datei im Quellcode
#   eingebunden ist, weiß der Compiler das die library
#   kompiliert werden soll. Der linker fügt dann die Module aus der Kompilierten
#   library, die tatsächlich im Programm verwändet werde, zusammen.
#-> Dynamische libraries enthalten module/Unterprogramme in Binär-Form.
#   Komponenten werden erst zur Laufzeit in den RAM geladen.
#       ->entwerd durch explizite Anweisung durch das Programm, oder
#       durch implizit durch einen Laufzeit-Lader, wenn das Programm
#       dynamisch gebunden wurde.
#   library und Programm sind nur lose verknüpft.
#
#-> .so Dateien sind kompilierte libraries. so steht für shared-object.
#-> .a Dateien sind statische libraries. a steht für archiv.
#   -> können mit ar und nm betrachtet werden.
#-> Ausführung: programm-code->sdl2->SDL2.
