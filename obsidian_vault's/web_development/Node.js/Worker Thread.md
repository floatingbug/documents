In Worker Threads werden langwierige oder rechenintensieve Operationen ausgefürht.
Beispielsweise wird die Node API Funktion fs.readFile auf einem Worker Thread ausgeführt, um aus einer Datei zu lesen.

---

##### Liste der Operationen die auf Worker Threads durchgefürht werden

1. **Berechnungen:**
    
    - Rechenintensive Aufgaben können in Worker-Threads parallelisiert werden.
2. **Benutzerdefinierte Operationen:**
    
    - Benutzerdefinierte Funktionen und Operationen, die nicht die Haupt-Event-Loop blockieren sollen.
3. **Node-API-Funktionen:**
    
    - Einige Node-API-Funktionen können in Worker-Threads verwendet werden. Dies sind Funktionen, die in C++ implementiert sind und spezifische Betriebssystemressourcen ansprechen.
4. **Async-Aufgaben:**
    
    - Async-Funktionen können in Worker-Threads verwendet werden, um nicht-blockierende Operationen durchzuführen.

---

Worker Threads werden von dem Threadpool verwaltet.
Der Threadpool ist eine Sammlung von Worker Threads die von Node verwendet werden.
Die Anzahl der Worker Threads ist standardmäßig auf die Anzahl der CPU Kerne gesetzt.








