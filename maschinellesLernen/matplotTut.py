#!/usr/bin/python3

import matplotlib.pyplot as plt


#####################
#Plotten vorbereiten
#####################

#Parameter: 1. X-Werte, 2. Y-Werte, 3. legt fest,
#wie die Punkte dargestellt werden sollen, hier grün und als o-Zeichen.
plt.plot([0, 1, 2, 3, 4], [0, 2, 4, 8, 16], "go")

#X- und Y-Achse einen Namen Zuweisen.
plt.ylabel("y")
plt.xlabel("x")

#X-Achse hat Werte von 0 bis 4, Y-Achse von 0 bis 16.
plt.axis([0, 4, 0, 16])	



#########
#Plotten
#########

plt.show()
