import processing.core.*;
import java.util.*;
import processing.sound.*;

public class TessaBlast extends PApplet
{
   private PImage basketball;
   private int gameState = 1;
   private SoundFile file;
  // private PApplet p;
   GamePlay gamePlay;
   
   
   //private ArrayList<Hoop> hoops;

   public void settings()
   {
    fullScreen();
   }
   public void setup()
   {
    
        basketball = loadImage("basketball.png");
     file = new SoundFile(this, "SpaceJam.mp3");
    file.play();

      
        gamePlay = new GamePlay(this);
        
        
        
        //hoops = new ArrayList<Hoop>();
        
        //Hoop hoop = new Hoop();
        //hoops.add(hoop);
   }
   public void draw()
   {
        if (gamePlay != null)
        {
           // gamePlay.display();
        }
        background(255);
    if (gameState == 1)
    {
        gameStart();
    }
    else if (gameState == 2)
    {
        gamePlay.display();
        if (gamePlay.isGameOver())
        {
            gameState = 3;
        }
    }
    else if (gameState == 3)
    {
        gameEnd();
    }
   }
   
   public void keyPressed()
   {
        if (gameState == 1 && key == ' ')
        {
            gameState = 2;
            gamePlay.reset();
        }
        else if (gameState == 2 && key == ' ')
        {
           if (gamePlay != null)
           {
            gamePlay.jump();
            }
        }
        else if (gameState == 3 && key == ' ')
        {
            gameState = 1;
        }
   }
   
   

   
   private void gameStart()
   {
        background(0xFF51CE21);
        fill(0);
        textAlign(CENTER);
        textSize(30);
        text("Tessa Dunk", width/2, height/2);
        
  
        text("Press SPACE to play", width/2 , (float) (height*0.9));
       
   }
   
   
   
   private void gameEnd()
   {
        background(0xFFD80F16);
        fill(255);
        textAlign(CENTER);
        textSize(30);
        text("GAME OVER", width/2, height/2);
        text("Press SPACE to play again", width/2, (float) (height*0.9));
   }
   
   public static void main(String[] args)
   {
    PApplet.main("TessaBlast");
   }
}