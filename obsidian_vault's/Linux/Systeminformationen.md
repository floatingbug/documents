# Speicherplatz anzeigen mit du

- du (disc usage) zeigt die Speicherplatzbelegung von Dateien und Verzeichnisse an.

Beispiel:
- `-h` (human-readable): Zeigt die Größe in einem lesbaren Format (K, M, G) an.
``` shell
du -h /path/to/file_or_folder
```

`-s` (summarize): Zeigt nur die Gesamtsumme für das Verzeichnis an.
```shell
du -sh /path/to/folder
```

`--max-depth=1`: zeigt nur die größen der Dateien und Verzeichnisse in der ersten ebene an
```shell
du -h --max-depth=1 /path/to/folder
```

```shell
```

```shell
```

```shell
```

```shell
```

---

# Partitionen anzeigen mit lsblk

- lsbl steht für list block devices.
- Zeigt alle Festplatten (Block Geräte) und Partitionen.

Mit der Option `-f` wird zusätzlich das Dateisystem, bspw. etx4 oder FAT32, mit angezeigt
```shell
lsblk -f
```


---


# HW Informationen anzeigen

