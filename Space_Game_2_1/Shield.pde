public class Shield implements GameDisplay {
    private int shield;

    Shield() {
        shield = 100;
    }

    public void display() {
        if (shield > 0) {
            int barLength = shield * 2;
            int xpos = GameDimensions.width - barLength - 50;
            fill(0, 100, 255);
            stroke(0, 100, 255);
            rect(xpos, 10, barLength, 10);
        }

        fill(0, 0, 255);
        textSize(GameDimensions.textSize);
        text("Shield", 650, 60);
    }
    
    public boolean isDestroyed() {
        return shield <= 0;
    }

    public void damage(int amount) {
        shield -= amount;
    }
}
