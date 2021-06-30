<map version="freeplane 1.6.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="LibGdx" FOLDED="false" ID="ID_537732366" CREATED="1579503915787" MODIFIED="1581413940123" STYLE="oval">
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
<hook NAME="AutomaticEdgeColor" COUNTER="6" RULE="ON_BRANCH_CREATION"/>
<node TEXT="Klassen" POSITION="right" ID="ID_1949693604" CREATED="1579503937601" MODIFIED="1581413868718" HGAP_QUANTITY="18.499999865889553 pt" VSHIFT_QUANTITY="-26.99999919533732 pt">
<edge COLOR="#ff0000"/>
<node TEXT="SpriteBatch" ID="ID_523900791" CREATED="1579503975560" MODIFIED="1579503984869">
<node TEXT="batch bedeutet&#xa;Stapel" ID="ID_533781493" CREATED="1579504246067" MODIFIED="1579504259592"/>
<node TEXT="mehrere sprites&#xa;werden in dieser&#xa;Klasse gestapelt" ID="ID_357850803" CREATED="1579504260474" MODIFIED="1579504294367"/>
</node>
</node>
<node TEXT="main-Klasse" POSITION="right" ID="ID_531450943" CREATED="1580053148330" MODIFIED="1580053188980">
<edge COLOR="#00ff00"/>
<node TEXT="muss von Game ableiten" ID="ID_613473285" CREATED="1580053198322" MODIFIED="1580055503697"/>
</node>
<node TEXT="Screen-Klassen" POSITION="right" ID="ID_567525297" CREATED="1580053247298" MODIFIED="1581413892658" HGAP_QUANTITY="15.499999955296518 pt" VSHIFT_QUANTITY="22.499999329447768 pt">
<edge COLOR="#00ffff"/>
<node TEXT="m&#xfc;ssen von ScreenAdapter abgeleitet sein" ID="ID_1086158895" CREATED="1580053289211" MODIFIED="1581413885018" HGAP_QUANTITY="14.749999977648258 pt" VSHIFT_QUANTITY="18.749999441206473 pt"/>
<node TEXT="ben&#xf6;tigte Methoden" ID="ID_955791268" CREATED="1580053356293" MODIFIED="1581413896964" HGAP_QUANTITY="15.499999955296518 pt" VSHIFT_QUANTITY="26.99999919533732 pt">
<node TEXT="public void render(fload delta){&#xa;    super.render()&#xa;}" ID="ID_141512384" CREATED="1580053366247" MODIFIED="1581413896958" HGAP_QUANTITY="12.500000044703482 pt" VSHIFT_QUANTITY="-11.999999642372142 pt"/>
<node TEXT="    public void hide() {&#xa;        this.dispose();&#xa;    }" ID="ID_1316335247" CREATED="1580053504916" MODIFIED="1580053588280">
<node TEXT="wird aufgerufen, wenn&#xa;ein neuer Screen&#xa;aufgerufen wird" ID="ID_1496227832" CREATED="1580053512269" MODIFIED="1580053537259"/>
</node>
</node>
</node>
<node TEXT="Grafikkarte" POSITION="left" ID="ID_1503032542" CREATED="1579504000029" MODIFIED="1579504010481">
<edge COLOR="#0000ff"/>
<node TEXT="Kann nur Dreiecke&#xa;zeichnen" ID="ID_1445674526" CREATED="1579504015240" MODIFIED="1579504038630">
<node TEXT="um 2D Bild Anzuzeigen&#xa;erstellt die Grafikkarte&#xa;zwei Dreiecke, die ein&#xa;Viereck ergeben, auf dem&#xa;dann das 2D Bild Gelegt wird" ID="ID_1532285508" CREATED="1579504057995" MODIFIED="1579504149497">
<node TEXT="Viereck mit Bild&#xa;nennt sich sprite" ID="ID_1107599948" CREATED="1579504186284" MODIFIED="1579504206256"/>
</node>
</node>
</node>
<node TEXT="wichtige Methoden" POSITION="left" ID="ID_633751804" CREATED="1580053637103" MODIFIED="1581413940123" HGAP_QUANTITY="16.999999910593036 pt" VSHIFT_QUANTITY="34.499998971819906 pt">
<edge COLOR="#7c0000"/>
<node TEXT="dispose()" ID="ID_1914202854" CREATED="1580053649123" MODIFIED="1580053653085">
<node TEXT="gibts alle Grafiken wieder frei" ID="ID_173828827" CREATED="1580053654314" MODIFIED="1580053668407"/>
</node>
</node>
</node>
</map>
