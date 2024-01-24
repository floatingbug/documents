- Was ist eine callback-Funktion?
    -> Eine cb wird als Argument einer Funktion übergeben.
        -> Die Funktion muss die cb aufrufen.
            -> Die cb wird erst aufgerufen, wenn bspw. Datenbak-Operationen durchgeführt wurden.
                -> der cb können Ergebnisse, der zuvor durchgeführten Operationen, als Argument übergeben werden.
                    -> cb werden im allgemeinen in asynchrone Funktionen verwendet.
                    -> wird eine Funktion mit einer cb aufgerufen und die Funktion eine "externe Operation" einleitet,
                        wird diese Operation nicht im main-thread sondern in einem anderen thread ausgeführt.
                        Der main-thread ist wärend der "externen-Operation" wieder frei.
                        Ist die Operation abgeschlossen, wird das Ergebnis als Argumend an die cb übergeben.
                        Wenn der main-thread wieder frei ist, wird die cb auf den main-thread gelegt und
                        ausgeführt.

- Beispiel:

def callbackFunc1(s):
    print('Callback Function 1: Length of the text file is : ', s)

def callbackFunc2(s):
    print('Callback Function 2: Length of the text file is : ', s)

def printFileLength(path, callback):
    f = open(path, "r")
    length = len(f.read())
    f.close()
    callback(length)

if __name__ == '__main__':
    printFileLength("sample.txt", callbackFunc1)
    printFileLength("sample.txt", callbackFunc2)
