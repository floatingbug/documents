- Wird ein Module importiert, wird dessen Hauptblock ausgeführt.
    -> Bei dieser Ausführung kann auf den Namen des modules, über die Variable __name__, zugegriffen werden.
    -> Beinhaltet __name__ den Wert '__main__' wurde das mudule nicht importiert, sondern als eigenständiges Programm geladen.

        if __name__ == '__main__':
            print("dieses module wurde nicht importiert")
        else:
            print("dieses module wurde importiert")
