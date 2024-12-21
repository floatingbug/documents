# Löschen, wenn man der Besitzer der Datei ist
#### 1. mit `> Dateiname`

```bash
> mongod1.log
```

**Warum können nur Daten gelöscht werden, wenn man der Besitzer ist?**
Führt man die Umleitung mit `sudo` aus, versucht die Shell den Dateiinhalt mit `sudo` zu überschreiben.
 
# Löschen, wenn der Besitzer der Datei ein anderer ist

#### 1. **Mit `sudo tee`**

```bash
sudo echo -n | sudo tee mongod1.log > /dev/null
```

- Hier wird der leere Inhalt (`-n` von `echo`) durch `sudo tee` in die Datei geschrieben.
- Das `> /dev/null` unterdrückt die Ausgabe von `tee` im Terminal.

#### **2. Mit `sudo truncate`**
```bash
sudo truncate -s 0 mongod1.log
```

- Setzt die Dateigröße direkt auf 0 Byte.
- Funktioniert zuverlässig, solange `sudo` verwendet wird.