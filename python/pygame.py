#-Surface
#-> Datenstruktur die die Informatin zur Darstellung von Grafikken beinhaltet z.B. Position und Größe.
#-> Zusätzlich enthält die Datenstruktur die Grafikdaten zur Darstellung von bspw. Bilder.
display.set_mode((800, 600))
	#-> erstellt das video-surface (screen-surface) 	
	#-> auf den screen-surface werden alle anderen surfaces zur Darstellung von Grafikken kopiert.
	
	
#-Blitting
#-> Ausdruck für das Zeichnen der Grafikken
blit() 
	#-> Kopiert die Pixel aus einer Surface-Datenstruktur in eine anderen Surface-Datenstruktur.
	#-> Grafikdaten und Informationen wie Position und Größe wird dabei Kopiert.


#Beispiel Bild Darstellen

image = pygame.image.load("bild.png")
	#-> bild.png in eine Image-Surface-Datenstruktur laden (Framebuffer der Grafikkarte).



screen.blit(image, (50,50))
	#-> pixle und Metadaten (Position, Größe...) vom image-surface auf den screen-surface laden.
	
	

pygame.display.flip()
	#-> Der Framebuffer wird in den Displaybuffer geladen, dadurch
	#-> wird alles was im Framebuffer war angezeigt.
	#-> Auch der screen-surface war vorher auf dem Framebuffer
