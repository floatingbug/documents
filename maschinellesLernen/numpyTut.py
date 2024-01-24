#!/usr/bin/python3

import numpy as np
import matplotlib.pyplot as plt

# Ein-Dimensionales-Array
a = np.array([1,2,3])

# Zwei-Dimensionales-Array bzw. Matrix.
# In dem Array befinden sich 4 Arrays.
# Jedes Array kann mit einem Index angesprochen werden,
# z.B. das dritte Array, zweites Element mit: m[2,1]
m = np.array([[1,4], [3,2], [7,8], [9,6]])


-----------------slicing-------------------------
a = np.array([[1,2,3,4,5], [6,7,8,9,10]])
#-> indizes die direkt neben dem Doppelpunkt stehen, sind immer
    # indizes für element.
    #-> indizes die links oder rechts neben einem komma stehen,
        # sind indizes für arrays.
# mit 0 wird das 1. array ausgewählt. 
# mit 2 wird das 3. Element ausgewählt (inklusive dem 3. Element).
# mit 4 wird bis zum 5. Element ausgewählt (exklusive dem 5. Element).
# in b wird das 3. und 4. Element gespeichert. 
b=a[0,2:4]


# ------Löschen von Elementen, Zeilen und Spalten--------------
# Löschen von Elementen
# Als index kann auch eine Liste von Indizes übergeben werden.
np.delete(array_name, index)

# Löschen von Zeilen bzw. Arrays
np.delete(array_name, index, axis=0)

# Löschen von Spalten
np.delete(array_name, index, axis=1)
