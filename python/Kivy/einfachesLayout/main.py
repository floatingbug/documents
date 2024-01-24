#!/usr/bin/python3

import kivy

from kivy.app import App
from kivy.uix.widget import Widget
from kivy.properties import ObjectProperty


class MyWidget(Widget):
    #Properties linken den widget code mit der Interface-Beschreibung (.kv)
    name = ObjectProperty(None)
    email = ObjectProperty(None)

    def btn(self):
        print("Name: ", self.name.text, "email: ", self.email.text)
        self.name.text = ""
        self.email.text = ""

class Application(App):
    def build(self):
        return MyWidget()

if __name__ == '__main__':
    app = Application()
    app.run()
