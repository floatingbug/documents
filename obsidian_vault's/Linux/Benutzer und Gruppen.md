
**Reihenfolge der rechte ist immer: Gruppe, Besitzer, alle anderen.**

# Gruppen

## Kommandos

### Die Gruppe einer Datei oder Verzeichnisses ändern.

**Beispiel:**

```shell
chgrp [Name der Gruppe] [name der Datei oder des Verzeichnisses]
```

### Sowohl den Besitzer als auch die Gruppe einer Datei oder eines Verzeichnisses ändern.

**Beispiel:**

```shell
chown [neuer_besitzer]:[neue_gruppe] [datei_oder_verzeichnis]
```


### Benutzer einer Gruppe hinzufügen

**Der Befehl `usermod` wird verwendet, um die Kontoinformationen eines Benutzers in einem Linux-System zu ändern.**

```shell
	usermod -aG [Name der Gruppe] [Benutzer]
```

- `-a`:  Append: Sorgt dafür, dass der Benutzer nicht aus den bestehenden Gruppen entfernt wird, wenn neue Gruppen hinzugefügt werden.
- `-G`: Um eine oder mehrere Gruppen angeben zu können, zu denen der Benutzer hinzugefügt werden soll.

