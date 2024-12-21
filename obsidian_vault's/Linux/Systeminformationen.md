
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

### Speicherplatz von Festplatten und Partitionen anzeigen

##### Der Befehl: df (disk filesystem)

Zeigt Speicherstatistiken für Dateisysteme an, nicht für einzelne Dateien oder Ordner.

**Beispiel:**

```shell
df -h /
```
	
## Partitionen anzeigen mit lsblk

- lsblk steht für list block devices.
- Zeigt alle Festplatten (Block Geräte) und Partitionen.

Mit der Option `-f` wird zusätzlich das Dateisystem, bspw. etx4 oder FAT32, mit angezeigt
```shell
lsblk -f
```


---


# HW Informationen anzeigen


# USB

### USB-Adapter und angeschlossene Geräte anzeigen

##### lsusb

`lsusb` zeigt alle angeschlossenen USB-Geräte an, unabhängig davon, ob sie korrekt erkannt wurden oder nicht.

```shell
lsusb
```

##### dmesg

Mit dem Befehl `dmesg` können Kernel-Nachrichten eingesehen werden, die während des Startens oder Anschließens von USB-Geräten erstellt werden. Diese Nachrichten geben auch Hinweise darauf, ob ein Gerät nicht erkannt wurde.

```shell
sudo dmesg | grep -i usb
```

##### usb-devices

`usb-devices` ist ein weiteres nützliches Tool, um detaillierte Informationen über alle angeschlossenen USB-Geräte anzuzeigen. Es listet jedes Gerät mit seinen Eigenschaften wie Hersteller, Produkt-ID und verwendeten Treibern auf.

```shell
usb-devices
```

