- Anonyme Funktionen sind Funktionen ohne Namen.
- Statt dem def keyword werden anonyme Funktionen mit lambda definiert.
- Syntax:

    lambda Argumente: Ausdruck

- Lambda Funktionen können beliebig viele Argumente enthalten.
- Lambda Funktionen dürfen nur einen Ausdruck beinhalten.
- Ein Ausdruck wird in der Lambda Funktion evaluiert und zurück gegeben.
- Beispiel:

    double = lambda x: x*2
    print(double(4)) #output: 8.

- map
    -> Der Funktion map wird eine liste und eine cb übergeben. als cb kann
        eine lambda Funktion (anonyme Funktion) übergeben werden.
        Der anonymen Funktion wird jedes einzelne Element übergeben, auf
        das der Ausdruck der cb angewendet und dann zurück gegeben wir.
    -> Beispiel:

        numbers = [2, 4, 6, 8, 10]

        # apply square() function to each item of the numbers list
        squared_numbers_iterator = map(lambda x: x*x, numbers)

        # converting to list
        squared_numbers = list(squared_numbers_iterator)
        print(squared_numbers)

        # Output: [4, 16, 36, 64, 100]

- filter
    -> Wie map nur das filter elemente raus filtert.
    -> Beispiel:

        # Program to filter out only the even items from a list
        my_list = [1, 5, 4, 6, 8, 11, 3, 12]

        # Filter gibt ein filter-object zurück, mit dem über die einzelnen
        # Elemente iteriert werden kann. Der list-constructor list erstellt
        # mit diesem objekt die Liste und gibt sie zurück.
        new_list = list(filter(lambda x: (x%2 == 0) , my_list))

        print(new_list)

- reduce
    -> Beispiel1:
        numbers = [32,44,525,64,33,2,1]

        #a ist der Accumulatur in den alle Ergebnisse gespeichert werden.
        #a nimmt als erstes den Wert des ersten Elements an, und b den Wert des zweiten Elements.
        #b nimmt dann immer den Wert des nächsten Elements an.
        reduce(lambda a,b: a+b, numbers)

    -> Beispiel2:
        -> Es soll die Anzahl aller geraden Elemente ausgegeben werden.
        -> Der dritte Parameter von reduce bestimmt den Anfangswert von a (Akkumulator).
            -> b nimmt dann den Wert des ersten Elements an.

        reduce(lambds: a,b: a+1, filter(lambda x: x%2==0, numbers), 0)

        #alternativ geht auch.
        #else a bedeutet, dass in den Akkumulator a der selbe Wert gespeichert wird.
        reduce(lambda: a,b: a+1 if b%2==0 else a, numbers, 0)
