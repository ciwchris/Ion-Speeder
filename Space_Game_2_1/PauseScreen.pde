public class PauseScreen implements GameState {
    private Game game;

    public Status getGameStatus() {
        return Status.Paused;
    }

    PauseScreen(Game game) {
        this.game = game;
    }

    public void display()
    {
        textSize(100);
        text("GAME PAUSED", GameDimensions.width / 2 - 400, GameDimensions.height / 3);
    }

    public void action(char key) {
        if (key == 'q') {
            exit();
        } else if (key == 'p') {
            game.resume();
        }
    }
}
