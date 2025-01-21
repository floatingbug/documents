# **Hypervisor**

- Erstellt virtual mashine (vm).
- Ein vm enthält unter anderem ein OS und Informationen, wie viel HW die vm nutzen darf.
- Der Hypervisor kann diese vm Instanzieren und Emuliert die HW, auf der die vm läuft.
	- Die emulierte CPU hat dann dann bspw. nur zwei Kerne und der RAM nur 4 GB (wie in der vm angegeben), anstatt die tatsächlichen physischen 6 kerne und 16 GB RAM.