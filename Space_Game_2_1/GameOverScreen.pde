public class GameOverScreen implements GameState {
    private Game game;
    private GameComponents gameComponents;

    public Status getGameStatus() {
        return Status.Over;
    }

    GameOverScreen(Game game, GameComponents gameComponents) {
        this.game = game;
        this.gameComponents = gameComponents;
        gameComponents.Score.setFreezeScore();
    }

    public void display()
    {
        textSize(50);
        text("GAME OVER", GameDimensions.width / 2, GameDimensions.height / 2);

        //TODO: Duplicated, extract this
        gameComponents.Ship.display();
        gameComponents.FuelBar.display();
        gameComponents.FuelRecharger.display();
        gameComponents.Health.display();
        gameComponents.Shield.display();
        gameComponents.Score.display();

        for (int i = 0; i < gameComponents.Rocks.size(); i++) {
            gameComponents.Rocks.get(i).motion();
        }
    }

    public void action(char key) {
        if (key == 'q') {
            exit();
        } else if (key == 's') {
            game.start();
        }
    }
}
