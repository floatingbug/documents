
## uname

Gibt grundlegende Informationen über das aktuelle Betriebssystem und die Systemumgebung aus.

**Beispiel:** 

```shell
uname -a
```

- Mit der Option -a werden alle Informationen, die mit dem Programm uname ermittelt werden können, ausgegeben.
- Die erste Spalte ist der Name des Betriebssystems, die zweite der Netzwerk-Hostname also der Name des Computers im Netzwerk.

---

# Festplatten und Partitionen

## Speicherplatz anzeigen mit du

Gibt die Datei und Verzeichnisgrößen aus. du steht für disc usage.

**Beispiel:**

```shell
du -sh /pfad/zum/verzeichnis
```

- `-s` steht für "summarize" und zeigt nur die Gesamtgröße des Verzeichnisses oder der Datei an.
- `-h` steht für "human-readable" und zeigt die Größe in einem lesbaren Format (z.B. KB, MB, GB).

**Beispiel 2:**

```shell
du -h /pfad/zum/verzeichnis
```

- Dies listet die Größen aller Dateien und Unterverzeichnisse auf.

**Beispiel 3:**

```shell
du -h --max-depth=1
```

- `--max-depth=1` zeigt die Größen des aktuellen Verzeichnisses und seiner direkten Unterverzeichnisse.


## Partitionen anzeigen mit lsblk

- lsbl steht für list block devices.
- Zeigt alle Festplatten (Block Geräte) und Partitionen.

Mit der Option `-f` wird zusätzlich das Dateisystem, bspw. etx4 oder FAT32, mit angezeigt
```shell
lsblk -f
```


---


# HW Informationen anzeigen

