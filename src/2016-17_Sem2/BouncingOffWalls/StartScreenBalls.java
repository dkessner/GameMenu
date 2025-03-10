//
// StartScreenBalls.java
//


import java.util.*;
import processing.core.*;


public class StartScreenBalls
{
    public StartScreenBalls(PApplet papplet, float x, float y, float r, 
                float vx, float vy, boolean bounce)
    {
        this.papplet = papplet;        
        this.x = x;        
        this.y = y;        
        this.r = r;
        this.vx = vx;        
        this.vy = vy;        
        c = papplet.color(papplet.random(256), papplet.random(256), papplet.random(256));
        this.bounce = bounce;        
    }

    public void display()
    {
       papplet.fill(c);
       papplet.ellipse(x, y, 2*r, 2*r);

       x += vx;
       y += vy;

       if (bounce)
       {
            if (x < r || x > papplet.width - r)
                vx = -vx;

            if (y < r || y > papplet.height - r)
                vy = -vy;
       }
    }

    private PApplet papplet;
    private float x;
    private float y;
    private float r;
    private float vx;
    private float vy;
    private int c;
    private boolean bounce;
}