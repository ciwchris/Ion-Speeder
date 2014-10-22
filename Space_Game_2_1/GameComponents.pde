public class GameComponents {
    public Ship Ship;
    public Health Health;
    public Shield Shield;
    public Score Score;
    public FuelBar FuelBar;
    public FuelRecharger FuelRecharger;
    public ArrayList<Rock> Rocks;
    public ArrayList<Bullet> Bullets;

    //TODO: create array of items to display
    //TODO: create array of items to motion
    GameComponents() {
        Ship = new Ship(this);
        Health = new Health();
        Shield = new Shield();
        Score = new Score();
        FuelBar = new FuelBar();
        FuelRecharger = new FuelRecharger();
        Rocks = new ArrayList<Rock>();
        Bullets = new ArrayList<Bullet>();
    }
}

