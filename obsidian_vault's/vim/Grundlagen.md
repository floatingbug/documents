# Buffer und Window

## Buffer

- In Vim werden Dateien als Buffer gespeichert und können in einem Window angezeigt werden.

Alle Buffer anzeigen:
```bash
:ls

#oder
:buffers
```


Nächsten Buffer im Windo anzeigen:
```bash
:nb
```

- nb steht für next buffer

Vorigen Buffer anzeigen:
```bash
:pb
```

- pb steht für previouse buffer

Buffer durch Buffer-Nummer im Window öffnen:
```bash
:b3
```

- Zeigt den Buffer 3 im Window an.

Buffer löschen:
```bash
:bd
```

- löscht den im Window angezeigten Buffer
## Window

- In ihnen wird der Buffer angezeigt.
- Ein Window kann mehrere Buffer auf einmal anzeigen, indem es horizontal oder vertikal geteilt wird.

Window horizontal teilen: 
```bash
:split

# oder
:sp
```

- Der aktuell im window geöffnete Buffer wird erneut im selben window aufgerufen und zwar horizontal unterhalb des ersten Buffers.

Window vertikal teilen:
```bash
:vsplit

# oder
:vsp
```

Andere Dateien geteilt öffnen:
```bash
:sp "dateiname"

# oder
:vsp "dateiname"
```



---

# Dateien öffnen

Eine Datei öffnen:
```back
:e "dateinamen"
```

- Die Datei wird als Buffer gespeichert und im window geöffnet.
- e steht für edit.
- existiert die Datei nicht, wird sie erzeugt, wenn man sie mit :w speichert.

