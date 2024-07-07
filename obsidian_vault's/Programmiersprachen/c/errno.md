`errno` errno steht für error number und ist eine globale Variable in C und C++, die den letzten Fehlercode angibt, der durch eine Systemfunktion gesetzt wurde. Systemfunktionen führen immer eien Systemcall aus, um auf Systemressourcen wie Dateien zuzugreifen.

Wenn ein Systemaufruf fehlschlägt oder einen bestimmten Zustand zurückgibt, setzt das Betriebssystem die `errno`-Variable auf einen bestimmten vordefinierten Wert, der den spezifischen Fehler oder Zustand identifiziert.

In der Regel wird `errno` als Ganzzahl verwendet, nicht als String. Um den Fehlercode in einen erklärenden String umzuwandeln, können spezielle Funktionen wie `strerror(errno)` verwendet werden, die den Fehlercode in einen beschreibenden Text übersetzen, der den Fehlerzustand darstellt, z.B. "Connection refused" oder "File not found".

`errno` kann auch Strings enthalten, bspw. EINPROGRESS. Das "E" in "EINPROGRESS" steht für "Error". In diesem Kontext bedeutet "EINPROGRESS" jedoch nicht direkt einen Fehler, sondern es ist ein Zustand, der anzeigt, dass eine Operation noch nicht abgeschlossen ist oder im Hintergrund bearbeitet wird.