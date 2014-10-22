public interface GameState extends GameDisplay, GameKeys { }

public interface GameKeys {
    void action(char key);
}

public interface GameDisplay {
    void display();
}
