public class Level {
    private int level;
    private int rocks;
    private int score;

    public int getRocks() {
        return rocks;
    }

    public int getScore() {
        return score;
    }

    Level() {
        level = 1;
        rocks = 5;
        score = 30;
    }

    public boolean hasPassed(int currentScore) {
        return currentScore > score;
    }

    public void increment(GameComponents gameComponents) {
        level += 1;
        rocks += level < 4 ? 1 : 2;
        score *= 2;

        for (int i = gameComponents.Rocks.size(); i < rocks; i++) {
            gameComponents.Rocks.add(new Rock(gameComponents.Score));
        }
    }
}
