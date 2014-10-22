public class Game {
    private PImage background;
    private Status status;

    private InProgressScreen inProgressScreen;
    private GameComponents gameComponents;

    public Status getGameStatus() {
        return status;
    }

    Game() {
        size(GameDimensions.width, GameDimensions.height);
        status = Status.Intro;
        background = loadImage("starry-sky.png");
    }

    public GameState getScreen() {
        background(background);

        if (status == Status.InProgress) {
            return inProgressScreen;
        } else if (status == Status.Intro) {
            return new LoadScreen(this);
        } else if (status == Status.Paused) {
            return new PauseScreen(this);
        } else if (status == Status.Over) {
            return new GameOverScreen(this, gameComponents);
        } else {
            return null;
        }
    }

    public void resume() {
        status = Status.InProgress;
    }

    public void gameOver() {
        status = Status.Over;
    }

    public void pause() {
        status = Status.Paused;
    }

    public void start() {
        status = Status.InProgress;
        gameComponents = new GameComponents();
        inProgressScreen = new InProgressScreen(this, gameComponents);
    }
}
