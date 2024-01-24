/*
-> javaScript ist single threaded und asynchron.
-> wird eine Funktion im thread ausgeführt, muss eine andere Funktion warten,
 	bis die erste Funktion beendet ist. Der thread ist für die nächste Funktion blockiert.
-> Lösung: Die Funktion an anderer Stelle ausführen, damit der thread frei ist und nicht blockiert.
-> Möglichkeiten: callbacks, promises, async/await

-> callbacks im Browser: Wird setTimeout im thread aufgerufen, schiebt der Event-Loop setTimeout  
	in den web-apis(durch event-loop der z.B. V8-Engine) dort wird setTimeout ausgeführt. 
	Dadurch ist der thread nicht länger blockiert.
	Ist setTimeout in den web-apis-thread abgearbeitet, schiebt der event-loop die callbackfunction
	(die setTimeout übergeben wurde) in die Callback-Queue.
	Dort können sich viele cbs befinden.
	Ist der stack frei, schiebt der event-loop die cb in den stack (stack = thread). 

-> Der JS Interpreter z.B. V8 besteht aus dem: Heap, Stack (Thread). Die Web-APIs wie setTimeout
    und Event-Loop, Task-Queue, Callback-Queue sind nicht 
	Teil des Interpreters, aber wie V8 in dem Browser implementiert. setTimeout ist ein Befehl, von dem aus, 
	aus dem Stack heraus, auf die entsprechende Funktion des Browsers zugegriffen werden kann.
	Als Parameter wird setTimeout die Callback "mitgegeben" Der Event-Loop "schiebt" die 
	Callback in die Callback-Queue, wenn setTimeout fertig abgearbeitet wurde. 
	Wenn der stack frei ist, wird die Callback von dem Event-Loop auf den Stack
	"geschoben". SetTimeout ist nur eine Funktion des Browserts, es gib bspw. ajax-request. dabei wird ein Server-Request 
	gemacht, wärend der Stack frei bleibt. Erhält die Browser-Funktion ein Response, Schiebt 
	der Event-Loop die entsprechende Callback in die Callback-Queue, die dann, von dem Event-Loop, in den Stack geschoben wird.
	
-> Node funktioniert genauso, nur dass statt den Web-APIs C++ funktionen aufgerufen werden und tatsächlich weitere 
	Stacks (Threads) ausgeführt werden.
*/
