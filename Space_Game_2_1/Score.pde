public class Score implements GameDisplay {
    private int score;
    private boolean freezeScore;

    public int getScore() {
        return score;
    }

    public void setFreezeScore() {
        freezeScore = true;
    }

    Score() {
        score = 0;
    }

    public void display() {
        textSize(GameDimensions.textSize);
        text(score, (GameDimensions.width / 2) - 30, 30);
    }


    public void escapedRock()
    {
        if (!freezeScore) score++;
    }
}
