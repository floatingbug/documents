#/usr/lib/python3

import kivy
kivy.require('1.11.1')

from kivy.app import App
# uix-module enthalten die userinterface-elemente wie label und widgets
from kivy.uix.label import Label

class MyApp(App):
#Alles was build zurück gibt, ist das root-widget und kivy
#fügt es im window ein. Alle anderen Widgets sind sub-widgets von dem
#root-widget.
    def build(self):
        return Label(text="Hello World")

#run() startet die App nur, wenn helloKivy.py als erstes ausgeführt wird.
#build() wird in run() aufgerufen.
if __name__ == '__main__':
    MyApp().run()
