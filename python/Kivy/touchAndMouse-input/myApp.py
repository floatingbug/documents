#!/usr/bin/python3

import kivy
from kivy.app import App
from kivy.uix.widget import Widget
from kivy.properties import ObjectProperty


class Touch(Widget):

    btn = ObjectProperty(None)

    def on_touch_down(self, touch):
        print("mouse down: ", touch)
        self.btn.opacity = 0.5

    def on_touch_move(self, touch):
        print("mouse touch: ", touch)

    def on_touch_up(self, touch):
        print("mouse up: ", touch)
        self.btn.opacity = 1



class MyApp(App):
    def build(self):
        return Touch()

if __name__ == '__main__':
    myApp = MyApp()
    myApp.run()
