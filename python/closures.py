- Nested functions
    -> eine Funktion die sich in einer anderen Funktion befindet, ist eine Nested function.
    -> eine Nested function hat lesenden Zugriff auf Variablen, die sich im umgebenden Scope
        der Nested function befinden.
        -> Beispiel: msg ist für printer() eine non-local variable.

            # This is the outer enclosing function
            def print_msg(msg):

                # This is the nested function
                def printer():
                    print(msg)

                printer()

            # We execute the function
            print_msg("Hello")

            # Output: Hello

- Eine Closure Funktion definieren
    -> Beispiel:

            # This is the outer enclosing function
            def print_msg(msg):

                # This is the nested function
                def printer():
                    print(msg)

                return printer  # returns the nested function


            # Now let's try calling this function.
            another = print_msg("Hello")
            another()
            # Output: Hello

            -> Die Nested function wird in another gespeichert.
            -> Obwohl print_msg beendet ist, ist die variable msg in another verfügbar.
                -> Immer wenn Daten (hier msg) an andere Daten (hier another) zugefügt wird,
                    nennt man das closure.
            -> Immer wenn in Python eine nested function eine Variable aus ihrem umgebenden scope
                referenziert, ist das ein closure.

- Bedingungen die erfüllt sein müssen um ein closure zu erstellen.
    -> Nested function
    -> Die nested function muss eine Variable aus ihrem umgebenden scope referenzieren
    -> Die übergeordnete Funktion muss die nested function zurück geben.
