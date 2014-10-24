public interface GameState extends GameDisplay, GameKeys {
    Status getGameStatus();
}

public interface GameKeys {
    void action(char key);
}

public interface GameDisplay {
    void display();
}
