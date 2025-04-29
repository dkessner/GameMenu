import processing.core.*;
import java.util.*;
import processing.sound.*;


public class GamePlay 
{
    private PApplet p;
    private float playerX, playerY;
    private float vx, vy, ay;
    private ArrayList<Hoop> hoops;
    private int score = 0;
    private boolean gameOver;
    private PImage basketball;
    //private SoundFile file;
    
    //private final float Jump = -5;
    
    
    
    public GamePlay(PApplet P)
    {
        this.p = P;
        reset();
    }
    public void reset()
    {
        playerX = 50;
        playerY = 50;
        vx = 0.05f;
        vy = 1;
        ay = 0.16f;
        score = 0;
        gameOver = false;
        hoops = new ArrayList<Hoop>();
    }
    public void display()
    {
        basketball = p.loadImage("basketball.png");
        basketball.resize(50,50);
        
       
       
        p.background(0xFF8BE1FA);
        p.fill(0xFFA2732C);
        p.stroke(0xFFA2732C);
        p.rect(0,600, p.width, 1000);
        
        p.imageMode(PApplet.CENTER);
        p.image(basketball, playerX, playerY);
        
        p.textSize(20);
        p.text("score: " + score,50,50);
        
  
        playerX += vx;
        playerY += vy;
        vy += ay;
       
    if (playerY >= 520)
    {
        gameOver = true;
    }
    
    //for (int i = hoops.getX(); i>=0; i++)
    //{
       // Hoop hoop = hoops.getX(i);
        //if ()
    //}
    
  for (int i = hoops.size() - 1; i>= 0; i--)
  {
      Hoop hoop = hoops.get(i);
      p.noFill();
      hoop.display();
      hoop.update();
      
      if (hoop.checkCollision(playerX, playerY))
      {
          if (playerY < hoop.getY())
          {
              vy = Math.abs(vy);
          }
          
          
          score ++;
          hoops.remove(i);

        
          
      }
     
  }
    
    
    if (p.frameCount%150 == 0)
    {
       
    hoops.add(new Hoop(p));
    
    }
    if (p.frameCount%200 == 0)
        {
            vx *= 1.1;
            ay *= 1.1;
            vy *= 1.1;
        }
    }
    
    public void jump()
    {
       vy = -7;
    }
    public boolean isGameOver()
    {
        return gameOver;
    }
    public int getScore()
    {
        return score;
    }
    
    
}