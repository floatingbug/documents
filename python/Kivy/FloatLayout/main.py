#!/usr/bin/python3

import kivy
from kivy.app import App
from kivy.uix.floatlayout import FloatLayout


class MyFloatLayout(FloatLayout):
    pass

class MyApp(App):
    def build(self):
        return MyFloatLayout()

if __name__ == '__main__':
    myApp = MyApp()
    myApp.run()
