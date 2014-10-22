public class Health implements GameDisplay {
    private int health;

    Health() {
        health = 100;
    }

    public void display() {
        if (health > 0) {
            fill(255, 0, 0);
            stroke(255, 0, 0);
            rect(50, 10, health * 2, 10);
        }

        fill(255, 0, 0);
        textSize(GameDimensions.textSize);
        text("Health", 50, 60);
    }

    public boolean isDead() {
        return health <= 0;
    }

    public void lowerHealth(int amount) {
        health -= amount;
    }
}
