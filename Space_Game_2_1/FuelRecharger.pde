public class FuelRecharger implements GameDisplay {
    private int displacement;
    private int xpos;
    private int ypos;
    private int speed;
    private boolean isActive;
    private int createTime;

    public Position getPosition() {
        int center = displacement / 2;
        return new Position(xpos - center, ypos - center, displacement);
    }

    FuelRecharger() {
        displacement = 50;
        isActive = false;
        createTime = millis();
    }

    public void destroy() {
        isActive = false;
        createTime = millis();
        ypos = xpos = -100;
    }

    public void display() {
        if (isActive) {
            ypos += speed;

            if (isOffScreen()) destroy();
            else ellipse(xpos, ypos, displacement, displacement);
        } else {
            if (isTimeToCreateNewRecharger()) createNewRecharger();
        }
    }

    private boolean isOffScreen() {
        return ypos > GameDimensions.height + 40;
    }

    private void createNewRecharger() {
        createTime = millis();
        isActive = true;
        xpos = (int)random(10, GameDimensions.width - 10);
        ypos = -25;
        speed = (int)random(3, 6);
    }

    private boolean isTimeToCreateNewRecharger() {
        return millis() - createTime >= random(5, 10) * 1000;
    }
}
