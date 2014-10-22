import ddf.minim.*;
import g4p_controls.*; //loads the neccisary librarys to run the code

Game game;
GameState gameState;
KeyPressedHandler keyPressedHandler;

void setup() {
    //starts the audio
    AudioPlayer audioPlayer = new Minim(this).loadFile("Turn Down For What (8-Bit NES Remix).mp3");
    audioPlayer.play();

    frameRate(60); //sets the frame rate(not neccasary)

    game = new Game();
    keyPressedHandler = new KeyPressedHandler(game);
}

// The keyPressed function in Processing triggers a key event for each key, as opposed
// to the keyPressed check in the draw function which applies the key event continuously
// while the key is held down.
void keyPressed() {
    key = Character.toLowerCase(key);
    if (!keyPressedHandler.shouldKeyBeAppliedImmediately(key)) {
        gameState.action(Character.toLowerCase(key));      
    }
}

void draw() {
    gameState = game.getScreen();
    gameState.display();

    if (keyPressed) {
        key = Character.toLowerCase(key);
        // keys which can be applied multiple times, i.e. ship navigation keys
        if (keyPressedHandler.shouldKeyBeAppliedImmediately(key)) gameState.action(key);
    }
}
