public class Ship implements GameState {
    private int displacement;
    private int movement;
    private int xpos;
    private int ypos;
    private PImage image;
    private GameComponents gameComponents;

    public Position getPosition() {
        return new Position(xpos, ypos, displacement);
    }

    Ship(GameComponents gameComponents) {
        this.gameComponents = gameComponents;
        displacement = 100;
        movement = 10;
        xpos = (GameDimensions.width / 2) - (displacement / 2);
        ypos = GameDimensions.height - displacement;
        image = loadImage("ionspeeder.png");
    }

    public void display()
    {
        image(image, xpos, ypos, displacement, displacement);
    }

    public void displayShieldHit() {
        fill(0, 0, 250);

        int center = displacement / 2;
        ellipse(xpos + center, ypos + center, displacement + movement, displacement + movement);
    }

    public void displayHealthHit() {
        stroke(255, 0, 0);
        fill(200, 0, 0);

        int center = displacement / 2;
        ellipse(xpos + center, ypos + center, displacement + movement, displacement + movement);
    }

    public void action(char key) {
        if (key == ShipNavigation.left) {
            moveLeft();
        } else if (key == ShipNavigation.right) {
            moveRight();
        } else if (key == ShipNavigation.up) {
            moveUp();
        } else if (key == ShipNavigation.down) {
            moveDown();
        } else if (key ==' ') {
            gameComponents.Bullets.add(new Bullet(getPosition()));
        }
    }

    private void moveLeft() {
        if (0 <= xpos - movement) {
            xpos -= movement;
        }
    }

    private void moveRight() {
        if (GameDimensions.width >= xpos + displacement + movement) {
            xpos += movement;
        }
    }

    private void moveUp() {
        if (0 <= ypos - movement) {
            ypos -= movement;
        }
    }

    private void moveDown() {
        if (GameDimensions.height >= ypos + displacement + movement) {
            ypos += movement;
        }
    }
}
