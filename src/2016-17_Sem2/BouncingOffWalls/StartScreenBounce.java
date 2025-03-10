//
// StartScreenBounce.java
//

import java.util.*;
import processing.core.*;


public class StartScreenBounce 
{
    public StartScreenBounce(PApplet papplet)
    {
        this.papplet = papplet; 
        setup();                
    }
    public void setup()
    {
        balls = new ArrayList<StartScreenBalls>();

        for (int i=0; i<100; i++)
        {
            float x = papplet.random(0, papplet.width);
            float y = papplet.random(0, papplet.height);
            float r = 20;
            float vx = papplet.random(-5, 5);
            float vy = papplet.random(-5, 5);

            balls.add(new StartScreenBalls(papplet, x, y, r, vx, vy, true));
        }
    }

    public void display()
    {
        for (StartScreenBalls b : balls)
            b.display();
    }

    private ArrayList<StartScreenBalls> balls;
    private PApplet papplet; 
}