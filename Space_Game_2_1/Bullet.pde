public class Bullet {
    private int speed;
    private int leftBullet;
    private int rightBullet;
    private int ypos;
    private int size;
    private int bulletSize;

    public Position getPosition() {
        return new Position(leftBullet, ypos, size);
    }

    Bullet(Position position) {
        speed = 30;
        size = 60;
        bulletSize = 10;

        int offset = ((position.size - size) / 2) - (bulletSize / 2);
        leftBullet = position.x + offset;
        rightBullet = position.x + position.size - offset;
        ypos = position.y - 10;
    }

    public boolean isDestroyed() {
        return ypos < 0;
    }

    void motion() {
        ypos -= speed;

        fill(0,100,255);
        stroke(0,100255);
        ellipse(leftBullet, ypos, bulletSize, bulletSize);
        ellipse(rightBullet, ypos, bulletSize, bulletSize);
    }

}
