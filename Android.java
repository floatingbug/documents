/*
-> App Fundamentals
    -> activities
        -> sind die user-interfaces für die Anwender
        -> main-activity ist das user interface, das der Anwender als erstes sieht, wenn er auf das app-icon klickt.

-> Device Compatibility

-> Ordnerstruktur
  -> manifest
    //Einstiegspunkt in die main activity definiert.
    //Zugriffsrechte auf Systemteile definieren.
    -> AndroidManifest.xml
  -> java
    -> ProjektName
      //Programm-Lokgik
      ->MainActivity.java
  //alle Definitionen für das Aussehen der App.
  //Werte die für ein Programm gebraucht werden.
  -> res
    -> values
      //alle Programmtexte die man auf der GUI sieht.
      -> strings.xml
  -> res
    -> layout
      //definiert das app Aussehen. Widgets (buttons, radio-buttons, checkboxes ...).
      //keine Logik, nur Definition des Aussehens.
      -> activity_main.xml

  -> Alle widgets werden über eine eindeutige id identifiziert.
*/

//Beispiel App
package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    //Deklaration und Initalisierung der Widgets (nur Speicher für Objekte reservieren).

    public TextView txtvOutput = null;
    private EditText txtInputOne = null;
    private EditText txtInputTwo = null;
    private Button btnMerge = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //R Datei ist Schnittstelle zwischen den xml Dateien und den Java Dateien.
        //Mit R. kreift man auf die xml Ordner (layout) und Datei (activity_main) zu.
        setContentView(R.layout.activity_main);

        //Element auswählen und in Variable speichern.
        this.txtvOutput =  findViewById(R.id.txtvOutput);
        this.txtInputOne = findViewById(R.id.txtInputOne);
        this.txtInputTwo = findViewById(R.id.txtInputTwo);
        this.btnMerge = findViewById(R.id.btnMerge);

        //Listener
        btnMerge.setOnClickListener(new View.OnClickListener(){
            public void onClick(View v){
                txtvOutput.setText(txtInputOne.getText().toString() + " " +
                        txtInputTwo.getText().toString());
            }
        });
    }
}
