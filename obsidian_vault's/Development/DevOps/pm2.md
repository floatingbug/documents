# Die wichtigsten Befehle
### Programm als daemon starten

```shell
pm2 start app.js --name "appName" --watch
```
- --name: Dem daemon einen namen geben
- --watch: daemon startet bei änderung einer Datei neu.
### daemon stoppen

```shell
pm2 stop app
```

### Programm aus pm2 entfernen

```shell
pm2 delete app
```

### daemon neu starten

```shell
pm2 restart app
```

### Alle von pm2 verwalteten Programme anzeigen

```shell
pm2 list
```

### daemons überwachen

```shell
pm2 monit
```

```shell
```

```shell
```

```shell
```

```shell
```

```shell
```