public class LoadScreen implements GameState {
    private Game game;

    public Status getGameStatus() {
        return Status.Intro;
    }

    LoadScreen(Game game) {
        this.game = game;
    }

    public void display()
    {
        textSize(75);
        text("Europa", GameDimensions.width / 2 - 200, 75);
        textSize(45);
        text("Press S To Start", GameDimensions.width / 2 - 100, GameDimensions.height / 2);
    }

    public void action(char key) {
        if (key == 'q') {
            exit();
        } else if (key == 's') {
            game.start();
        }
    }
}
