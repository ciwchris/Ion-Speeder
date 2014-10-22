public class Rock {
    private int xpos;
    private int ypos;
    private int size;
    private int damage;
    private int speed;
    private PImage image;

    private boolean isActive;
    private int createTime;

    private Score score;

    public Position getPosition() {
        return new Position(xpos, ypos, size);
    }

    Rock(Score score) {
        this.score = score;

        isActive = false;
        createTime = millis();
    }

    public void destroy() {
        isActive = false;
        createTime = millis();
        xpos = ypos = -100;
        score.escapedRock();
    }

    public void motion()
    {
        if (isActive) {
            ypos += speed;
            if (isOffScreen()) {
                destroy();
            } else {
                display();
            }
        } else {
            if (isTimeToCreateNewRock()) createNewRock();
        }
    }

    private void display() {
        image(image, xpos, ypos, size, size);
    }

    private boolean isOffScreen()
    {
        return ypos > GameDimensions.height + size;
    }

    private void createNewRock() {
        isActive = true;

        xpos = (int)random(3, GameDimensions.width - 12);
        ypos = 0;
        size = (int)random(40, 80);
        damage = (int)(size / 3);
        speed = (int)random(5, 10);

        int imageNumber = ((int)random(1,40) % 4) + 1;
        image = loadImage("Rock" + imageNumber + ".png");
    }

    private boolean isTimeToCreateNewRock() {
        return millis() - createTime >= random(2, 5) * 1000;
    }

}
