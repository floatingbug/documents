<map version="freeplane 1.6.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Android" FOLDED="false" ID="ID_1279222946" CREATED="1579101779338" MODIFIED="1579101823412" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle" zoom="1.5">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" fit_to_viewport="false"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24.0 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ICON_SIZE="12.0 pt" COLOR="#000000" STYLE="fork">
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10.0 pt" SHAPE_VERTICAL_MARGIN="10.0 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="11" RULE="ON_BRANCH_CREATION"/>
<node TEXT="Berechtigung" POSITION="right" ID="ID_1697523490" CREATED="1579101804903" MODIFIED="1579102068905" HGAP_QUANTITY="6.500000223517411 pt" VSHIFT_QUANTITY="-72.74999783188112 pt">
<edge COLOR="#ff0000"/>
<node TEXT="um im kernel-space Funktionen nutzen zu k&#xf6;nnen, ben&#xf6;tigt man Rechte" ID="ID_725632829" CREATED="1579101827018" MODIFIED="1579102073254" HGAP_QUANTITY="13.250000022351742 pt" VSHIFT_QUANTITY="-22.499999329447768 pt">
<node TEXT="Rechte werden in der Datei AndroidManifest.xml festgelegt" ID="ID_1360896587" CREATED="1579101912583" MODIFIED="1579102073251" HGAP_QUANTITY="12.500000044703482 pt" VSHIFT_QUANTITY="-21.749999351799506 pt">
<node TEXT="Beispiel" ID="ID_1632732488" CREATED="1579101958444" MODIFIED="1579102079335">
<node TEXT="&lt;uses-permission android:name=&quot;Name der ben&#xf6;tigten Funktion&quot; /&gt;" ID="ID_1541599183" CREATED="1579101969000" MODIFIED="1579102079331" HGAP_QUANTITY="12.500000044703482 pt" VSHIFT_QUANTITY="-20.24999939650299 pt"/>
</node>
</node>
</node>
</node>
<node TEXT="Ordnerstruktur" POSITION="right" ID="ID_1039261732" CREATED="1579102089825" MODIFIED="1579103867360">
<edge COLOR="#0000ff"/>
<node TEXT="res Ordner" ID="ID_207643227" CREATED="1579102178742" MODIFIED="1579103880940" HGAP_QUANTITY="11.000000089406964 pt" VSHIFT_QUANTITY="-36.74999890476469 pt">
<node TEXT="das Aussehen wird festgelegt" ID="ID_298123046" CREATED="1579102189158" MODIFIED="1579103878670" HGAP_QUANTITY="16.249999932944775 pt" VSHIFT_QUANTITY="-6.74999979883433 pt"/>
<node TEXT="res/values/strings.xml" ID="ID_1160763299" CREATED="1579102254268" MODIFIED="1579103874765">
<node TEXT="Werte werden festgelegt (Programmtexte)" ID="ID_1456338327" CREATED="1579102205927" MODIFIED="1579103874763" HGAP_QUANTITY="18.499999865889553 pt" VSHIFT_QUANTITY="-8.249999754130847 pt"/>
</node>
<node TEXT="res/layout/main_activity.xml" ID="ID_1088594844" CREATED="1579102324133" MODIFIED="1579103880939" VSHIFT_QUANTITY="16.499999508261695 pt">
<node TEXT="nur Definition des Aussehens (keine Logik)" ID="ID_1365753754" CREATED="1579102368482" MODIFIED="1579103870430" VSHIFT_QUANTITY="16.499999508261695 pt"/>
</node>
</node>
<node TEXT="java/MainActivity.java" ID="ID_1597122774" CREATED="1579102782635" MODIFIED="1579103891549">
<node TEXT="Programmlogik" ID="ID_1951011778" CREATED="1579102845190" MODIFIED="1579103885743" VSHIFT_QUANTITY="-13.49999959766866 pt"/>
<node TEXT="widgets werden hier Definiert" ID="ID_618151263" CREATED="1579102852064" MODIFIED="1579102893398"/>
<node TEXT="in res/layout/main_activity.xml sind die Eigenschaften (Variablen) gespeichert, die zur erzeugung der Objekte benutzt werden." ID="ID_423872848" CREATED="1579102954964" MODIFIED="1579103888946" VSHIFT_QUANTITY="13.49999959766866 pt"/>
<node TEXT="in der R Datei befinden sich alle ids der widgets" ID="ID_87303087" CREATED="1579103275524" MODIFIED="1579103896950" HGAP_QUANTITY="13.250000022351742 pt" VSHIFT_QUANTITY="13.49999959766866 pt">
<node TEXT="&#xfc;ber die id aus der R Datei, greift man auf das widget in der main_activity.xml zu" ID="ID_1959443654" CREATED="1579103348918" MODIFIED="1579103896948" HGAP_QUANTITY="15.499999955296518 pt" VSHIFT_QUANTITY="5.999999821186071 pt"/>
</node>
</node>
</node>
<node TEXT="widgets ansteuern" POSITION="right" ID="ID_255352958" CREATED="1579103747501" MODIFIED="1579103853997">
<edge COLOR="#007c7c"/>
<node TEXT="Beispiel" ID="ID_1157656892" CREATED="1579103771715" MODIFIED="1579103856077" HGAP_QUANTITY="17.749999888241295 pt" VSHIFT_QUANTITY="23.999999284744284 pt">
<node TEXT="TextView textView = findViewById(R.id.textView);" ID="ID_1810601237" CREATED="1579103783905" MODIFIED="1579103856076" HGAP_QUANTITY="17.749999888241295 pt" VSHIFT_QUANTITY="17.249999485909953 pt"/>
</node>
</node>
<node TEXT="Listener" POSITION="left" ID="ID_478391381" CREATED="1579104958301" MODIFIED="1579104965857">
<edge COLOR="#7c7c00"/>
<node TEXT="Beispiel" ID="ID_519740718" CREATED="1579104969285" MODIFIED="1579105068608">
<node TEXT="btn_submit.setOnClickListener(new View.OnClickListener() {&#xa;            @Override&#xa;            public void onClick(View v) {&#xa;            &#xa;        });" ID="ID_1469222751" CREATED="1579105083426" MODIFIED="1579105320379">
<node TEXT="v ist immer die Referenz des gecklikten widgets" ID="ID_643827577" CREATED="1579106073909" MODIFIED="1579106112574"/>
</node>
<node TEXT="OnClickListener in extra Klasse Definieren" ID="ID_558167615" CREATED="1579105328767" MODIFIED="1579106407291">
<node TEXT="extra Klasse" ID="ID_232165931" CREATED="1579105432887" MODIFIED="1579106411905">
<node TEXT="public class MainActivityOnClickListener implements View.OnClickListener {&#xa;    public void onClick(View v){&#xa;&#xa;    }&#xa;}" ID="ID_1537431360" CREATED="1579105463397" MODIFIED="1579106411903" HGAP_QUANTITY="20.74999979883433 pt" VSHIFT_QUANTITY="-56.999998301267674 pt"/>
</node>
<node TEXT="OnClickListener erstellen und zuweisen" ID="ID_1683100956" CREATED="1579105564884" MODIFIED="1579106407290" HGAP_QUANTITY="22.249999754130847 pt" VSHIFT_QUANTITY="23.249999307096026 pt">
<node TEXT="public MainActivityOnClickListerner listener = new MainActivityOnClickListener();&#xa;&#xa;&#xa;textView.setOnClickListener(listener);" ID="ID_163662393" CREATED="1579105592932" MODIFIED="1579106402200" HGAP_QUANTITY="39.4999992400408 pt" VSHIFT_QUANTITY="39.74999881535772 pt"/>
</node>
</node>
</node>
</node>
</node>
</map>
