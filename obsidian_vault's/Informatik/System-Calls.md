
**Beispiel in C:**

Die `open`-Funktion in der glibc bereitet die Argumente und die System Call-Nummer vor und führt den System Call aus, indem sie die entsprechenden Register der CPU mit den notwendigen Informationen befüllt. Die glibc-Implementierung führt einen speziellen Maschinenbefehl aus, der die CPU anweist, in den Kernel-Modus zu wechseln. Auf modernen x86_64-Systemen ist dies der `syscall`-Befehl. Der Kernel ließt die System Call-Nummer und Argumente aus den Registern der CPU. Der Kernel öffnet die Datei. Bei erfolg schreibt der Kernel den file-descriptor (fd) in ein CPU Register, bei einem Fehler einen Error-code. Der Kernel Schaltet die CPU in den user-mode. Die open Funktion erhält das Ergebnis aus dem CPU Register.

## Detaillierter Ablauf:

1. **Vorbereitung durch glibc:**
    
    - Die `open`-Funktion der glibc bereitet die System Call-Nummer und die Argumente vor.
    - Die System Call-Nummer für `open` (auf x86_64 ist das `SYS_open`, normalerweise Wert `2`) wird in das `RAX`-Register geladen.
    - Die Argumente (z.B. der Dateiname, Flags und Modus) werden in die entsprechenden Register (`RDI`, `RSI`, `RDX`, etc.) geladen.
2. **Wechsel in den Kernel-Modus:**
    
    - Die glibc führt den `syscall`-Befehl aus, der die CPU anweist, in den Kernel-Modus zu wechseln und den System Call auszuführen.
    - Der Kernel liest die System Call-Nummer aus dem `RAX`-Register und die Argumente aus den entsprechenden Registern.
3. **Ausführung des System Calls durch den Kernel:**
    
    - Der Kernel führt die notwendige Operation (z.B. das Öffnen der Datei) aus.
    - Bei Erfolg wird der Dateideskriptor in das `RAX`-Register geschrieben.
    - Bei einem Fehler wird ein Fehlercode in das `RAX`-Register geschrieben.
4. **Rückkehr in den User-Modus:**
    
    - Der Kernel schaltet die CPU in den User-Modus zurück.
    - Die `open`-Funktion in der glibc erhält das Ergebnis aus dem `RAX`-Register und gibt es an den aufrufenden Code zurück.