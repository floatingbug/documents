//Projektstruktur//
/*
	-> .java Dateien liegen in: /src/main/java/"packagename"/"alle .java Dateien"
*/



//Plugins//

/*
	-> In der build.gradle Datei (liegt im Root des Projektordners) werden Plugins die verwändet werden sollen eingetragen.
		->z.B: apply plugin 'java'
			-> Dieses Plugin ermöglicht basic java build functionality.
				-> wird gradle in Projektordner mit: gradle build aufgerufen, wir das Projekt Kompiliert, getestet
					und in einer .jar Datei zusammengebaut.
					
					-> Ergebnis: classes. The project’s compiled .class files.

								  reports. Reports produced by the build (such as test reports).

								  libs. Assembled project libraries (usually JAR and/or WAR files).


*/		


//Abhängigkeiten//
/*
	-> Repository angeben, von dem die Abhängigkeiten Heruntergeladen werden sollen.

		repositories {
		    mavenCentral()
		}
	
	-> Angeben was Heruntergeladen werden soll (dependencies{}).
		sourceCompatibility = 1.8
		targetCompatibility = 1.8

		dependencies {
    		compile "joda-time:joda-time:2.2" //compile bedeutet, die Datei muss bereits beim Kompilieren vorhanden sein.
    		testCompile "junit:junit:4.12"	  //testCompile bedeutet, nur testen (wird nicht für den Buildprozess benötigt).
		}
*/


//.jar Datei benennen und Manifest (java sucht in der Manifest-Datei (in jar) nach Klasse mit main-Funktion)//
/*
		jar {
	    	baseName = 'gs-gradle'
		    version =  '0.1.0'
		
			manifest {
    			attributes(
      				'Main-Class': 'hello.HelloWorld'
    			)
  			}
		}
*/

//Startscript erstellen//
/*
	-> wenn man ein Startscript erstellt, reicht in dem Terminal: gradle run 
		->apply plugin: 'application'
		  mainClassName: 'hello.HelloWorld'
*/


//java-programm bauen//
/*
	-> Im Terminal: gradle build
*/


//Komplette demo build.gradle//
apply plugin: 'java'

repositories {
    mavenCentral()
}

sourceCompatibility = 1.8
targetCompatibility = 1.8

dependencies {
    compile "joda-time:joda-time:2.2"
    testCompile "junit:junit:4.12"
}

jar {
    baseName = 'gs-gradle'
    version =  '0.1.0'

     manifest {
    	attributes(
 	     	'Main-Class': 'hello.HelloWorld'
    	)
  	}
}


//////gradle mit script starten (gradle muss nicht installiert sein)//////
