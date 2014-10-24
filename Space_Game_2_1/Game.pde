public class Game {
    private PImage background;

    private InProgressScreen inProgressScreen;
    private GameComponents gameComponents;
    private GameState gameState;
    private GameState inprogressGame;

    public Status getGameStatus() {
        return gameState.getGameStatus();
    }

    Game() {
        size(GameDimensions.width, GameDimensions.height);
        background = loadImage("starry-sky.png");
        gameState = new LoadScreen(this);
    }

    public GameState getScreen() {
        background(background);
        return gameState;
    }

    public void resume() {
        gameState = inprogressGame;
    }

    public void gameOver() {
        gameState = new GameOverScreen(this, gameComponents);
    }

    public void pause() {
        inprogressGame = gameState;
        gameState = new PauseScreen(this);
    }

    public void start() {
        gameComponents = new GameComponents();
        gameState = new InProgressScreen(this, gameComponents);
    }
}
