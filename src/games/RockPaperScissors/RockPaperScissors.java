//
// RockPaperScissors
//
// Darren Kessner
// Marlborough School
//


import processing.core.*;
import java.util.*;


public class RockPaperScissors extends PApplet
{
    public void settings()
    {
        //size(1200, 800);
        fullScreen();
    }

    public void setup()
    {
        noCursor();
        this.fontSize = height/10;
        this.font = createFont("Comfortaa", fontSize);
        this.fontSmall = createFont("Comfortaa", fontSize/2);
        this.selectedIndex = 0;
        initializeGameInfo();
    }

    public void draw()
    {
        if (currentGame != null) // update/display game
        {
            currentGame.display();
            currentGame.update();
        }
        else // display start screen
        {
            background(0);
            fill(0, 255, 0);
            textFont(font);
            textAlign(CENTER, CENTER);

            int x = width/2;
            int y = height/4;
            int dy = fontSize*2/3;

            text("rock paper scissors", x, y);
            y += dy*5;

            textFont(fontSmall);
            for (int i=0; i<gameInfos.size(); i++)
            {
                GameInfo info = gameInfos.get(i);
                fill(i==selectedIndex ? 255 : 128);
                text(info.name, x, y);
                y += dy;
            }
        }
    }

    public void keyPressed()
    {
        if (currentGame != null)
        {
            if (key == PApplet.ESC)
            {
                // quit current game, go back to menu
                currentGame = null;
                key = 0;
            }
            else
            {
                // let current game handle
                currentGame.keyPressed();
            }
        }
        else // in menu -- handle game selection
        {
            if (key == RETURN || key == ENTER || key == ' ')
            {
                currentGame = gameInfos.get(selectedIndex).game;
                currentGame.initialize();
            }
            else if (keyCode == UP)
            {
                if (selectedIndex > 0) selectedIndex--;
            }
            else if (keyCode == DOWN)
            {
                if (selectedIndex < gameInfos.size()-1) selectedIndex++;
            }
        }
    }

    public void keyReleased()
    {
        if (currentGame != null)
            currentGame.keyReleased();
    }

    public void returnToMenu()
    {
        currentGame = null;
    }

    public interface Drawable 
    {
        default void initialize() {}
        default void update() {}
        default void display() {}
        default void keyPressed() {}
        default void keyReleased() {}
    }

    public static void main(String[] args)
    {
        PApplet.main("RockPaperScissors");
    }

    public static final boolean soundEnabled = true;

    // private data and methods

    private int fontSize;
    private PFont font;
    private PFont fontSmall;
    private Drawable currentGame;
    private int selectedIndex;

    private class GameInfo
    {
        public GameInfo(String name, Drawable game)
        {
            this.name = name;
            this.game = game;
        }

        public String name;
        public Drawable game;
    }

    ArrayList<GameInfo> gameInfos;

    private void initializeGameInfo()
    {
        gameInfos = new ArrayList<GameInfo>();

        gameInfos.add(new GameInfo("asteroids (1 player)", new AsteroidsGame(this)));
        gameInfos.add(new GameInfo("three target (2 player)", new ThreeTargetGame(this)));
        //gameInfos.add(new GameInfo("<testing>", new TestGame(this)));
    }
} 


