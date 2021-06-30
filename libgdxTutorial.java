public class TutorialGame extends Game{
	//wird wie main als erstes aufgerufen.
	@Override
	public void create(){
		//GameScreen ist ein gamestate wie das Menü, Spiel, Pause-Screen usw..
		//das Objekt GameScreen muss erstellt werden und von ScreenAdapter ableiten.
		setScreen(new GameScreen);
	}

	//löscht Grafiken aus dem Speicher.
	@Override
	public void dispose(){

	}
}