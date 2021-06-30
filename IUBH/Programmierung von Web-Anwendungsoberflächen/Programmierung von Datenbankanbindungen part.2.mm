<map version="freeplane 1.6.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Programmierung von Datenbankanbindungen part.2" FOLDED="false" ID="ID_584594829" CREATED="1586016885833" MODIFIED="1586016906549" STYLE="oval">
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
<hook NAME="AutomaticEdgeColor" COUNTER="10" RULE="ON_BRANCH_CREATION"/>
<node TEXT="Erzeugung von Entit&#xe4;ten" POSITION="right" ID="ID_438663956" CREATED="1586076726158" MODIFIED="1586076735392">
<edge COLOR="#ff0000"/>
<node TEXT="Klassen k&#xf6;nnen als Entit&#xe4;ten annotiert werden" ID="ID_769272492" CREATED="1586076763905" MODIFIED="1586076824798"/>
<node TEXT="Instanzen von Annotierten Klassen werden in die DB gespeichert" ID="ID_1264700763" CREATED="1586076825221" MODIFIED="1586076848740"/>
<node TEXT="um das neue Objekt zu speichern ben&#xf6;tigt man die Methode prsist der EntityManager-Klasse" ID="ID_773103752" CREATED="1586077107805" MODIFIED="1586077163843">
<node TEXT="EntityTransaction t = entityManager.getTransaction();&#xa;&#xa;t.begin();&#xa;entityManager.persist(neuesArtikelObjekt);&#xa;t.commit();&#xa;&#xa;entityManager.close();" ID="ID_1157054386" CREATED="1586077164895" MODIFIED="1586077457218"/>
</node>
</node>
<node TEXT="Datensatz mit entityManager.merge() aktualisieren" POSITION="right" ID="ID_297761379" CREATED="1586077686313" MODIFIED="1586077743738">
<edge COLOR="#0000ff"/>
<node TEXT="vorhandener Datensatz wird &#xfc;ber ein Objekt aktualisiert" ID="ID_1420712786" CREATED="1586159878081" MODIFIED="1586159911181"/>
</node>
<node TEXT="@javax.persistence.GeneratedValue" POSITION="right" ID="ID_1920275760" CREATED="1586364494882" MODIFIED="1586364522422">
<edge COLOR="#00ff00"/>
<node TEXT="automatische vergabe von Schl&#xfc;ssel-Werten" ID="ID_1714081483" CREATED="1586364523375" MODIFIED="1586364551833"/>
<node TEXT="@GeneratedValue(strategy = GenerationType.AUTO)&#xa;private int nr;" ID="ID_356098351" CREATED="1586364616018" MODIFIED="1586364683369"/>
</node>
<node TEXT="Assoziationen zwischen Objekten mittels JPA" POSITION="left" ID="ID_1109163631" CREATED="1586364839589" MODIFIED="1586364884897">
<edge COLOR="#ff00ff"/>
<node TEXT="@OneToMany" ID="ID_748290507" CREATED="1586365137881" MODIFIED="1586365148615">
<node TEXT="ein Objekt besitzt einel liste mit Assoziationen (verkn&#xfc;pfungen) zu anderen Objekten" ID="ID_532265570" CREATED="1586365149543" MODIFIED="1586365194041"/>
<node TEXT="@OneToMany&#xa;List&lt;Bewertungen&gt; bewertungen" ID="ID_52278703" CREATED="1586365222043" MODIFIED="1586365254112"/>
<node TEXT="Assoziationstabelle" ID="ID_694367883" CREATED="1586365360322" MODIFIED="1586365367186">
<node TEXT="Assoziationen zwischen zwei Objekten werden in einer Assoziationstabelle gespeichert (in der Datebank)" ID="ID_1448300522" CREATED="1586365368449" MODIFIED="1586365431070">
<node TEXT="Beispiel:&#xa;in der Tabelle gibt es das Attribut Artikelnummer wobei eine Artikelnummer auf mehrere Bewertungen zeigen kann durch das Attribut Bewertung-ID" ID="ID_160400887" CREATED="1586365700922" MODIFIED="1586365842314">
<node TEXT="Artikel-Nummer ist ein Artikel" ID="ID_609427169" CREATED="1587053752701" MODIFIED="1587053769937"/>
<node TEXT="Beispiel:&#xa;Artikel-Nummer 3 kommt in mehreren Spalten vor in denen verschiedene Bewertungs-IDs stehen." ID="ID_257091071" CREATED="1587053770375" MODIFIED="1587053935474"/>
</node>
</node>
</node>
</node>
<node TEXT="@ManyToOne" ID="ID_820273689" CREATED="1586366241844" MODIFIED="1586366252450">
<node TEXT="Ein Objekt kennt das Objekt, von dem es in seiner Liste verw&#xe4;ndet wird" ID="ID_1360076594" CREATED="1586366257687" MODIFIED="1586366353163">
<node TEXT="eine Bewertung kennt den dazugeh&#xf6;rigen Artikel, ist dort aber eine von vielen" ID="ID_746098561" CREATED="1586366369028" MODIFIED="1586366406934"/>
</node>
</node>
<node TEXT="@ManyToMany" ID="ID_1924289687" CREATED="1586366418697" MODIFIED="1586366429945"/>
<node TEXT="@OneToOne" ID="ID_1669636923" CREATED="1586366437944" MODIFIED="1586366462162"/>
</node>
<node TEXT="Vererbung" POSITION="left" ID="ID_736235169" CREATED="1586367289934" MODIFIED="1586367605297">
<edge COLOR="#7c0000"/>
<node TEXT="@javax.persistence.Inheritance(strategy = InheritanceType.JOINED)" ID="ID_234970425" CREATED="1586367295544" MODIFIED="1586367344711">
<node TEXT="Annotation f&#xfc;r Oberklassen" ID="ID_1130914874" CREATED="1586367346263" MODIFIED="1586367360133"/>
<node TEXT="Abgeleitete Klassen bekommen ihre eigenen Tabellen" ID="ID_428931459" CREATED="1586367362101" MODIFIED="1586367376379"/>
<node TEXT="Tabelle der abgeleiteten Klasse enth&#xe4;lt nur die hinzugef&#xfc;gten Attribute" ID="ID_382950849" CREATED="1586367443097" MODIFIED="1586367475922"/>
<node TEXT="bei Rekonstruktion des Objekts werden Datens&#xe4;tze Tabelle der Oberklasse und Tabelle der Unterklasse ben&#xf6;tigt" ID="ID_1546215089" CREATED="1586367477194" MODIFIED="1586367535918"/>
</node>
</node>
<node TEXT="L&#xf6;schen von Objekten mittels JPA" POSITION="left" ID="ID_643142637" CREATED="1586367606771" MODIFIED="1586367620713">
<edge COLOR="#00007c"/>
<node TEXT="mit der methode remove der Klasse EntityManager l&#xf6;scht man Objekte aus der Datenbank" ID="ID_265089689" CREATED="1586367719032" MODIFIED="1586367750428"/>
</node>
<node TEXT="Data Access Objects" POSITION="left" ID="ID_313584280" CREATED="1586368051499" MODIFIED="1586368060272">
<edge COLOR="#7c007c"/>
<node TEXT="jede Entit&#xe4;t bekommt eine DAO in der die Eintr&#xe4;ge der Datenbankzugriffe gespeichert werden" ID="ID_458893793" CREATED="1586368201237" MODIFIED="1586368243186"/>
<node TEXT="Name der Klasse:&#xa;KlassennameDAO" ID="ID_71727867" CREATED="1586368342386" MODIFIED="1586368364112"/>
</node>
</node>
</map>
