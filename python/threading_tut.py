---Multithreading
-> Merere Aufgaben, die in einem Programm definiert wurden, laufen wärend 
    der Ausführung gleichzeitig ab.

---Threads
-> Ein Prozess besteht mindestens aus einem Thread oder aus mehreren
    Threads, die alle gleichzeitig ausgeführt werden (in jedem CPU-Kern).
-> Alle Threads eines Prozesses teilen sich den selben Speicherbereich.
    Über Globale Variablen kommunizieren die Threads mit dem Speicherbereich.
    -> Dadurch können Threads gemeinsam an Informationen arbeiten.

---Low-level-API-Modul (_thread)
-> Veraltete Version (bis Python2).
-> Beispiel 1:
    #Erster Parameter ist die Funktion, für die ein eigener Thread
    #gestartet werden soll. Zweiter Parameter sind die Parameter 
    #der Funktion.
    _thread.start_new_thread(function, [parameters])

---threading-Modul

