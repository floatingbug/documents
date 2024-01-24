- Mit list comprehensive kann eine Liste auf Basis einer anderen Liste definiert und erstellt werden.

- Mit list comprehensive durch ein string iterieren:

        h_letters = [ letter for letter in 'human' ]
        print( h_letters)

        #output
        ['h', 'u', 'm', 'a', 'n']

        -> Syntax:

            [Ausdruck for Element in Liste]

- Bedingungen in list comprehensive:

    number_list = [ x for x in range(20) if x % 2 == 0]
    print(number_list)

    #output
    [0, 2, 4, 6, 8, 10, 12, 14, 16, 18]


- Verschachtelte if Anweisungen

    num_list = [y for y in range(100) if y % 2 == 0 if y % 5 == 0]
    print(num_list)

    #output
    [0, 10, 20, 30, 40, 50, 60, 70, 80, 90]

- if else

    obj = ["Even" if i%2==0 else "Odd" for i in range(10)]
    print(obj)

    #output
    ['Even', 'Odd', 'Even', 'Odd', 'Even', 'Odd', 'Even', 'Odd', 'Even', 'Odd']
