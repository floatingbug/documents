- Wird ein Module importiert, wird dessen Hauptblock ausgeführt.
    -> Bei dieser Ausführung kann auf den Namen des modules, über die Variable __name__, zugegriffen werden.
    -> Beinhaltet __name__ den Wert '__main__' wurde das mudule nicht importiert, sondern als eigenständiges Programm geladen.

        if __name__ == '__main__':
            print("dieses module wurde nicht importiert")
        else:
            print("dieses module wurde importiert")

    -> Wird ein module importiert, wird es sofort aufgerufen.
        -> Würde man das Module mit der main-Funktion importiern, würde die main-Funktion ausgeführt.
            -> Will man verhindern, dass die main-Funktion beim importiern ausgeführt wird, schreibt man:
                
                def main():
                    #implementierung der main-Funkton                
                            
                if __name__ == '__main__':
                    main()
                
                    
