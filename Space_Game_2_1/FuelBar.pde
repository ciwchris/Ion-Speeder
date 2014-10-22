public class FuelBar {
    private float fuelLevel;
    private int xpos;
    private int ypos;

    FuelBar() {
        fuelLevel = 100;
        xpos = 20;
        ypos = 200;
    }

    public void display() {
        displayBar();
        displayPercentage();
    }

    public void useFuel() {
        if (fuelLevel >= 0) {
            fuelLevel -= .03;
        }
    }

    public boolean isOutOfFuel() {
        return (int)fuelLevel <= 0;
    }

    public void increaseFuel() {
        fuelLevel += 10;
        if ((int)fuelLevel > 100) fuelLevel = 100;
    }

    private float fuelBarHeight() {
        return  fuelLevel * 2;
    }

    private void displayBar() {
        fill(0, 255, 0);
        stroke(0, 255, 0);
        rect(xpos, ypos, 10, fuelBarHeight());
    }

    private void displayPercentage() {
        textSize(GameDimensions.textSize);
        text((int)fuelLevel + "%", 35, 250);
    }
}

