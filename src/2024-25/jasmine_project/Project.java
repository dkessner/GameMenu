import processing.core.*;
import processing.sound.*;
import java.util.*;

public class Project extends PApplet {
    private List<Level> levels;
    private int currentLevel;
    private Start start;
    private Menu menu;
    private EndScene endScene;
    private SoundFile music;
    
    enum GameState { START, MENU, LEVEL, PAUSED, GAMEOVER, LEVEL_PASSED }
    private GameState gameState;
    
    public static float scrollSpeed = Constants.Physics.SCROLL_SPEED;
    
    public void settings() {
        fullScreen();
    }
    
    public void setup() {
        Constants.setPApplet(this);
        
        levels = new ArrayList<>();
        levels.add(new Level1(this));
        levels.add(new Level2(this));
        currentLevel = 0;
        gameState = GameState.START;
        
        start = new Start(this);
        menu = new Menu(this);
        
        music = new SoundFile(this, "music.mp3");
    }
    
    public void draw() {
        background(0);
        
        switch (gameState) {
            case START:
                start.display();
                break;
            case MENU:
                menu.display();
                break;
            case LEVEL, PAUSED:
                levels.get(currentLevel).display();
                if (gameState != GameState.PAUSED) {
                    levels.get(currentLevel).update();
                }
                if (levels.get(currentLevel).isGameOver()) {
                    gameState = GameState.GAMEOVER;
                }
                if (levels.get(currentLevel).levelPassed()) {
                    gameState = GameState.LEVEL_PASSED;
                }
                break;
            case GAMEOVER:
                endScene = new EndScene(this, false);
                endScene.display();
                break;
            case LEVEL_PASSED:
                endScene = new EndScene(this, true);
                endScene.display();
        }
    }
    
    public void keyPressed() {
        switch (gameState) {
            case START:
                gameState = GameState.MENU;
                break;
            case MENU:
                /*if (key == '1') {*/
                    currentLevel = 0;
                    gameState = GameState.LEVEL;
                    levels.get(currentLevel).reset();
                    music.loop();
                /*}if (key == '2') {
                    currentLevel = 1;
                    gameState = GameState.LEVEL;
                    music.loop();
                }*/
                break;
            case LEVEL:
                levels.get(currentLevel).levelKeyPressed();
                if (keyCode == ENTER) {
                    levels.get(currentLevel).reset();
                    gameState = GameState.LEVEL;
                    music.loop();
                }
                if (key == 'p' || key == 'P') {
                    gameState = GameState.PAUSED;
                }
                break;
            case PAUSED:
                if (key == 'l' || key == 'L') {
                    gameState = GameState.LEVEL;
                }
                break;
            case GAMEOVER:
                if (keyCode == ENTER) {
                    levels.get(currentLevel).reset();
                    gameState = GameState.LEVEL;
                    music.loop();
                }
                if (key == '.') {
                    gameState = GameState.MENU;
                    music.stop();
                }
                break;
            case LEVEL_PASSED:
                if (keyCode == ENTER) {
                    levels.get(currentLevel).reset();
                    gameState = GameState.LEVEL;
                    music.loop();
                }
                if (key == '.') {
                    gameState = GameState.MENU;
                    music.stop();
                }
                if (key == ' ') {
                    currentLevel++;
                    gameState = GameState.LEVEL;
                    music.loop();
                }
                break;
        }
    }
    
    public void keyReleased() {
        switch(gameState) {
            case LEVEL:
            levels.get(currentLevel).levelKeyReleased();
            break;
        }
    }
    
    public static void updateScrollSpeed(float speed) {
        scrollSpeed = speed;
    }
    
    public static void main(String[] args) {
        PApplet.main("Project");
    }
}