public class KeyPressedHandler {
    private Game game;

    KeyPressedHandler(Game game) {
        this.game = game;
    }

    public boolean shouldKeyBeAppliedImmediately(char key) {
        return game.getGameStatus() == Status.InProgress && ShipNavigation.isNavigationKey(key);
    }
}
