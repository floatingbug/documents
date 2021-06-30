#!/usr/bin/python3

import kivy
from kivy.app import App
from kivy.uix.widget import Widget
from kivy.properties import ObjectProperty
from kivy.graphics import Rectangle
from kivy.graphics import Color
from kivy.graphics import Line


class Drawer(Widget):
    def __init__(self):
        #Im subclass-Konstruktor wird der superclass-Konstruktor aufgerufen.
        #Somit stehen in Drawer (subclass) alle Variablen und Funktionen zur Verfügung.
        #Canvas steht jetzt auch zur Verfügung.
        super().__init__()
        #Mit (with) self.canvas soll geschehen: ein Rectangle Object instanziiert und noch mehr.
        with self.canvas:
            Line(points=(20,20, 300,500, 600,500))
            Color(1,0,0,1, mode='rgba')
            self.rect = Rectangle(pos=(200,200), size=(100,100))
            Color(0,0,1,1, mode='rgba')
            self.rect2 = Rectangle(pos=(300,300), size=(100,100))


    def on_touch_down(self, touch):
        self.rect.pos = touch.pos

    def on_touch_move(self, touch):
        self.rect.pos = touch.pos


class MyApp(App):
    def build(self):
        return Drawer()


if __name__ == '__main__':
    myApp = MyApp()
    myApp.run()
