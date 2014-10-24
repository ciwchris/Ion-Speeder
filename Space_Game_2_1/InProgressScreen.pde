public class InProgressScreen implements GameState {
    private Game game;
    private GameComponents gameComponents;
    private CollisionApplier collisionApplier;
    private Level level;
    private Status status;

    InProgressScreen(Game game, GameComponents gameComponents) {
        this.game = game;
        this.gameComponents = gameComponents;
        collisionApplier = new CollisionApplier(gameComponents);
        level = new Level();

        for (int i = 0; i < level.getRocks(); i++) {
            gameComponents.Rocks.add(new Rock(gameComponents.Score));
        }
    }

    public Status getGameStatus() {
        return Status.InProgress;
    }

    public void display()
    {
        displayGameComponents();

        collisionApplier.applyCollisions();

        updateGameStatus();
    }

    public void action(char key) {
        if (key == 'q') {
            exit();
        } else if (key == 'p') {
            game.pause();
        }

        gameComponents.Ship.action(key);
    }

    private boolean isGameOver() {
        return gameComponents.FuelBar.isOutOfFuel() ||
            gameComponents.Health.isDead();
    }

    private void displayGameComponents() {
        gameComponents.Ship.display();
        gameComponents.FuelBar.display();
        gameComponents.FuelBar.useFuel();
        gameComponents.FuelRecharger.display();
        gameComponents.Health.display();
        gameComponents.Shield.display();

        for (int i = 0; i < gameComponents.Rocks.size(); i++) {
            Rock rock = gameComponents.Rocks.get(i);
            rock.motion();
        }

        for (int i = 0; i < gameComponents.Bullets.size(); i++) {
            Bullet bullet = gameComponents.Bullets.get(i);
            bullet.motion();
        }
    }

    private void updateGameStatus() {
        if (isGameOver()) game.gameOver();
        if (level.hasPassed(gameComponents.Score.getScore())) level.increment(gameComponents);

        gameComponents.Score.display();
    }

}
