#!/usr/bin/python3

import numpy as np
import matplotlib.pyplot as plt

#Ein-Dimensionales-Array
a = np.array([1,2,3])

#Zwei-Dimensionales-Array bzw. Matrix.
#In dem Array befinden sich 4 Arrays.
#Jedes Array kann mit einem Index angesprogen werden,
#z.B. das dritte Array, zweites Element mit: m[2,1]
m = np.array([[1,4], [3,2], [7,8], [9,6]])


#Vor dem Doppelpunkt in [:,0] steht nichts, dass 
#bedeutet dass das erste Array ausgewählt wird.
#nach dem Doppelpunkt steht nichts, was bedeutet,
#dass alle Arrays von 0 bis Ende nacheinander 
#ausgewählt werden. Nach dem Komma steht, welches
#Element ausgewählt wird. 
plt.plot(m[:,0], m[:,1], "go")


