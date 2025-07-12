# `S` Single-Responsibility-Prinzip

#### Ein Modul sollte immer nur von einem Akteur verantwortlich sein.

**Beispiel:** Ein Modul wird von verschiedenen Akteuren genutzt. Akteur A und Akteur B erwarten von einer Funktion einen bestimmten Rückgabewert. 
Akteur A möchte diesen Rückgabewert in einem anderen Format erhalten und wünscht eine Änderung der Funktion, die umgesetzt wird. 
Akteur B Weiß nichts von der Änderung und verwendet das neue Format im glauben es handle sich um das alte Format. Akteur B benutzt das neue Format, Arbeitet mit diesem und erhält so falsche Ergebnisse ohne es zu wissen.

*Ein Modul sollte nur für einen Akteur verantwortlich sein.* 

---

# `O` Open-Closed-Prinzip

#### Code sollte erweiterbar sein ohne den bestehenden Code modifizieren (umschreiben) zu müssen.

