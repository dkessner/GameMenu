import processing.core.*;
public class Hoop
{
    private PApplet p;
    private float x, y;
    private float width = 80;
    private float height = 40;
  
  //float vx = 1;
  //float vy = 0;
  
  public Hoop(PApplet p)
  {
    this.p = p;
    x = p.width;
    y = p.random(200, 450);
    width = 80;
    height = 40;
    
    
    
  }
  
  public void display()
  {
    
    p.stroke(255,0,0);
    p.strokeWeight(5);
    p.noFill();
    
    p.ellipse( x, y, width, height);
    
  }
    public void update()
    {
        x -= 2;
        
    }
    public float getY()
    {
        return y;
    }
    
    public float getX()
    {
        return x;
    }
    public boolean checkCollision(float px, float py)
    {
        float dx = px - x;
        float dy = py - y;
        float rx = width/2;
        float ry = height/2;
        boolean insideHoop = (dx*dx)/(rx*rx) + (dy*dy)/(ry*ry) <= 1;
        float centerOpening = height * 0.4f;
        boolean hittingRim = Math.abs(dy) > centerOpening;
        return insideHoop && !hittingRim;
    }
}