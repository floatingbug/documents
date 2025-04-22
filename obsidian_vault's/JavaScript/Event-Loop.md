# Was ist die Event-Loop

- Die **Event Loop** ist **kein eigener Prozess**, sondern eine **Mechanik (Struktur)**, die innerhalb des einzigen **Execution Threads** der JavaScript-Engine ausgeführt wird.
- Die Event Loop ist eine Struktur/Mechanik, die steuert, wann und wie asynchrone Callbacks verarbeitet werden.

# Verarbeitung der Event-Loop im Thread

- Die Event-Loop prüft, ob sich CB's in den queues befinden und schiebt diese in den Call-Stack, wenn dieser leer ist.
	- Die JavaScript-Engine erstellt anhand der CB in dem Call-Stack ein EC und führt diesen aus.

# Verarbeitung von Events durch die Evenl-Loop

- Auch Events werden in die Queues Eingefügt.
- Bspw. fügt libuv bei einer neuen TCP-Verbindung das connection Event in die I/O Queue ein.
- Wenn die Event-Loop das Event entnimmt, fügt sie die für das Event registrierte CB in den Call-Stack.
	- Vorher übergibt die Event-Loop der CB das Socket-Object als Argument (das Socket-Object befindet sich in dem connection Event).

# Queues

**In Node.js:**
- Die Makrotask-queues `timer-queue`, `I/O-queue`, `check-queue` und `close-queue` sind Teil von libuv und werden von libuv verwaltet.
	- Wenn bspw. eine TCP-Verbindung hergestellt wurde, fügt libuv in die I/O queue das connection event hinzu.
- Die Mikrotask-queues sind Teil der JavaScript-Engine und werden von dieser verwaltet.

![[assets_YJIGb4i01jvw0SRdL5Bt_acadb0ce7d6240639e448d55136c04a6.webp]]