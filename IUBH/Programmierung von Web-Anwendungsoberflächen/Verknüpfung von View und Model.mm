<map version="freeplane 1.6.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Verkn&#xfc;pfung von View und Model" FOLDED="false" ID="ID_1625649610" CREATED="1583747534378" MODIFIED="1586001828768" STYLE="oval">
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
<hook NAME="AutomaticEdgeColor" COUNTER="5" RULE="ON_BRANCH_CREATION"/>
<node TEXT="Klasse als Managed Bean kennzeichnen" POSITION="right" ID="ID_38431156" CREATED="1583747819098" MODIFIED="1586001825588">
<edge COLOR="#ff0000"/>
<node TEXT="Annotation @ManagedBean" ID="ID_219915723" CREATED="1583747836591" MODIFIED="1586001825588" HGAP_QUANTITY="14.749999977648258 pt" VSHIFT_QUANTITY="-7.499999776482589 pt"/>
</node>
<node TEXT="G&#xfc;ltigkeitsbereiche von Managed Beans" POSITION="right" ID="ID_1357639661" CREATED="1583747884783" MODIFIED="1586001853221" HGAP_QUANTITY="15.499999955296518 pt" VSHIFT_QUANTITY="18.749999441206473 pt">
<edge COLOR="#0000ff"/>
<node TEXT="gibt an, wie lange ein managed-bean existiert" ID="ID_908895806" CREATED="1583747898554" MODIFIED="1586001837470" HGAP_QUANTITY="16.249999932944775 pt" VSHIFT_QUANTITY="-7.499999776482589 pt"/>
<node TEXT="Annotation @RequestScoped" ID="ID_815137334" CREATED="1583747974283" MODIFIED="1586001842715" HGAP_QUANTITY="22.249999754130847 pt" VSHIFT_QUANTITY="29.999999105930357 pt">
<node TEXT="beim request erzeugt und nach response zerst&#xf6;rt" ID="ID_154110955" CREATED="1583747987814" MODIFIED="1586001834261" HGAP_QUANTITY="14.749999977648258 pt" VSHIFT_QUANTITY="11.249999664723884 pt"/>
</node>
<node TEXT="Annotation @SessionScoped" ID="ID_811851297" CREATED="1583748057821" MODIFIED="1586001853219" HGAP_QUANTITY="22.249999754130847 pt" VSHIFT_QUANTITY="23.999999284744284 pt">
<node TEXT="Objekt bleibt w&#xe4;rend der gesammten Browsersitzung bestehen (passendes Objekt wird durch coockie aufgerufen)" ID="ID_714120220" CREATED="1583748067545" MODIFIED="1586001845663" HGAP_QUANTITY="13.250000022351742 pt" VSHIFT_QUANTITY="17.99999946355821 pt"/>
</node>
</node>
<node TEXT="JSF-Komponenten" POSITION="left" ID="ID_1240859396" CREATED="1583749367119" MODIFIED="1586001810607">
<edge COLOR="#00ff00"/>
<node TEXT="h:commandLink" ID="ID_1510554332" CREATED="1583749381466" MODIFIED="1586002152655">
<node TEXT="kann mit action-Attribut eine Java-Klasse aufrufen" ID="ID_562079011" CREATED="1583749400114" MODIFIED="1586002152653" HGAP_QUANTITY="17.749999888241295 pt" VSHIFT_QUANTITY="-9.749999709427366 pt"/>
<node TEXT="&lt;h:commandLink action=&#x201c;#{shop.sortiment.remove(artikel)}&#x201c;/&gt;" ID="ID_469806525" CREATED="1583749445207" MODIFIED="1586001806928" VSHIFT_QUANTITY="8.249999754130847 pt"/>
</node>
<node TEXT="h:pannelGrid" ID="ID_1623300240" CREATED="1583834757101" MODIFIED="1586002150678">
<node TEXT="tabellarische Ausrichtung von jsf-Komponenten in einem Formular" ID="ID_170536801" CREATED="1583834767302" MODIFIED="1586002150675" HGAP_QUANTITY="19.999999821186073 pt" VSHIFT_QUANTITY="20.999999374151248 pt"/>
</node>
<node TEXT="h:inputText" ID="ID_1412742046" CREATED="1583834855629" MODIFIED="1586001810606" HGAP_QUANTITY="16.249999932944775 pt" VSHIFT_QUANTITY="14.999999552965178 pt">
<node TEXT="input Felder" ID="ID_409466060" CREATED="1583834861644" MODIFIED="1586001812344" HGAP_QUANTITY="15.499999955296518 pt" VSHIFT_QUANTITY="14.249999575316918 pt">
<node TEXT="h:outputLabel" ID="ID_116239733" CREATED="1583834876708" MODIFIED="1586001814546" VSHIFT_QUANTITY="13.49999959766866 pt">
<node TEXT="manipulation von input Felder" ID="ID_254888140" CREATED="1583834897980" MODIFIED="1586001814546" VSHIFT_QUANTITY="16.499999508261695 pt"/>
</node>
</node>
</node>
</node>
<node TEXT="unified expression language (UEL)" POSITION="left" ID="ID_1283403504" CREATED="1583751482454" MODIFIED="1586001816500">
<edge COLOR="#00ffff"/>
<node TEXT="value- und method-expression" ID="ID_1000764632" CREATED="1583751662716" MODIFIED="1586001818776" HGAP_QUANTITY="15.499999955296518 pt" VSHIFT_QUANTITY="10.499999687075624 pt">
<node TEXT="dienen der Verkn&#xfc;pfung von views und models" ID="ID_156794155" CREATED="1583751684690" MODIFIED="1586001818775" HGAP_QUANTITY="16.999999910593036 pt" VSHIFT_QUANTITY="9.749999709427366 pt">
<node TEXT="Value-Expressions verkn&#xfc;pfen JSF-Komponenten zur Ein- und Ausgabe von Daten (z. B.&#xa;h:outputText) mit Attributen einer Managed Bean. Namensgebend f&#xfc;r diese Klasse&#xa;der UEL-Ausdr&#xfc;cke ist der Einsatz des Attributs value in den JSF-Komponenten:&#xa;&lt;h:column&gt;&lt;h:outputText value=&#x201c;#{einArtikel.name}&#x201c;/&gt;&lt;/h:column&gt;&#xa;Method-Expressions verkn&#xfc;pfen JSF-Komponenten zum Ausl&#xf6;sen von Aktionen (z. B.&#xa;h:commandLink) mit Methoden einer Managed Bean. Sie stehen immer im Attribut&#xa;action:&#xa;&lt;h:commandLink action=&#x201c;#{shop.sortiment.remove(artikel)}&#x201c;/&gt;" ID="ID_1437752429" CREATED="1583751786056" MODIFIED="1583751794444"/>
</node>
</node>
</node>
</node>
</map>
