

import processing.core.*;
import java.util.*;


public class AllFractalCalculate extends PApplet
{
    public void settings()
    {
       fullScreen();
       //size(); 
    }

    public void setup()
    {
        LineX = width/2 - 200;
        LineX2 = width/2 - 200;
    }

	private int level = 1;
	private int n = 5;
	private float radius = 10;
	int s = 2;
	int GameState = 0;
	private float w = 300;
	private float h = 200;
	private float x = -150;
	private float y = -100;
	private float centerX = 0;
	private float centerY = 0;
	private float length = (float) 10.0;
	private float x2 = 0;
	private float y2 = 10;
	
	private float LineY = 700;
	
	private float LineY2 = 500;
	
	private float LineX = width/2 - 100;
    private float LineX2 = width/2 - 100;
	private int startX = 600;
	private int startY = 400;
	
	public float scale = 0.7f;
	public int angle = 4;
	public int g = 1;
	public int times2 = 1;
	public int angle2 = 4;
	public int longBranch = 0;
	
	
	
	
	public void drawDot(int level, float radius)
	{
		pushMatrix();
		if (level <= 0)
			ellipse(0, 0, radius, radius);
		else // up and down - user input
		{
			
			drawDot(level-1, radius);
			//strokeWeight(pow(4, level));
			for (int i = 0; i<n; i++)
			{	
				
				pushMatrix();
				rotate(i*2*PI/n);
				scale(1f/s); //change scale to get different figures
				radius += level*2;
				translate(250, 0);
				drawDot(level-1, radius);
				popMatrix();
				
			}
			//draw the dot w new origin, and rotate, w/ matrix 
		}
		popMatrix();
	}
	
	
	ArrayList<Rectangle> rects = new ArrayList<Rectangle>();
	
	public ArrayList<Rectangle> split(ArrayList<Rectangle> rects)
	{
		ArrayList<Rectangle> result = new ArrayList<Rectangle>();
		
		for (Rectangle s: rects)
		{
			ArrayList<Rectangle> temp = s.split();
			result.add(s);
			for (Rectangle a: temp)
				result.add(a);
		}
		return result;
	}
	
	public void recalculate()
	{
		rects.add(new Rectangle(this, x, y, w, h, 2));
		
		for (int i=0; i<level; i++)
		{
			rects = split(rects);	
		}

	}
	
	public void drawCheck(int level)
	{
		
		drawRect(rects);
		
	}
	
	public void drawRect(ArrayList<Rectangle> rects)
	{
		for (Rectangle a: rects)
		{
			if (a.color() == 1)
			{	
				fill(0);
				stroke(255);
			}
			else
			{
				fill(255);
			}
			a.display();
		}
	
	}
	
	
	public void recalc()
	{
		lines = new ArrayList<Line>();
		lines.add(new Line(this, LineX, LineY, LineX2, LineY2));
		for (int i = 0; i<level; i++)
			lines = branch(lines);
	
	}
	
	ArrayList<Line> lines = new ArrayList<Line>();
	
	public ArrayList<Line> branch(ArrayList<Line> lines)
	{
		ArrayList<Line> result = new ArrayList<Line>();
		
		for (Line a: lines)
		{
			ArrayList<Line> temp = a.split(scale, angle, g, times2, angle2, longBranch);
			result.add(a);
			for (Line c: temp)
				result.add(c);
		}
	
		return result;
	}
	
	public void drawTree(int level)
	{
		drawLine(lines);
	}
	
	public void drawLine(ArrayList<Line> lines)
	{
		for (Line b: lines)
			b.display();
	}
	
    public void draw()
    {
        background(255);
    	stroke(0);
        text("Level", width - 290, height/2 - 110);
    	triangle(width - 300, height/2 - 30, width - 250, height/2 - 100, width - 200, height/2 - 30);
    	triangle(width - 300, height/2 + 30, width - 250, height/2 + 100, width - 200, height/2 + 30);        	text("Scale", width - 415, height/2);
        triangle(width - 300, height/2 + 40, width - 370, height/2, width - 300, height/2 - 40);
        triangle(width - 200, height/2 + 40, width - 130, height/2, width - 200, height/2 - 40);
        fill(0, 0, 255);
        ellipse(width - 300, height/2 + 150, 50, 50);
        ellipse(width - 200, height/2 + 150, 50, 50);
        fill(0);
        text("Number of branches:", width - 450, height/2 + 130);
        text("Up", width - 300, height/2 + 180);
        text("Down", width - 200, height/2 + 180);
        text("Angle of Branches", width - 300, height/2 + 410);
        triangle(width - 300, height/2 + 270, width - 250, height/2 + 200, width - 200, height/2 + 270);
        triangle(width - 300, height/2 + 330, width - 250, height/2 + 400, width - 200, height/2 + 330);
        text("Length of branch", width - 510, height/2 + 300);
        triangle(width - 300, height/2 + 340, width - 370, height/2 + 300, width - 300, height/2 + 260);
        triangle(width - 200, height/2 + 340, width - 130, height/2 + 300, width - 200, height/2 + 260);
        fill(0, 255, 0);
        ellipse(width - 300, 100, 50, 50);
        ellipse(width - 200, 100, 50, 50);
        fill(0);
        text("Change 1 angle", width - 400, 100);
        line(LineX, LineY, LineX2, LineY2);
        drawTree(level);
  			
    }
    
    
    public void startScreen()
    {
    	background(255);
    	ellipse(startX, startY, 10, 10);
    	int vx = 1;
    	int vy = 1;
    	
    	startX += vx;
    	startY += vy;
    	
    	if (startX > 599 && startY > 399)
    	{	
    	
    		startX -= vx;
    		startY += vy;
    	}
    	else if (startX < 401 && startY > 599)
		{    			
			
    		startX -= vx;
    		startY -= vy;
    		
    	}
		else if (startX < 201 && startY > 399)
    	{
    		for (int i = 0; i<200; i++)
    		{
    			startX += vx;
				startY -= vy;
			}
    	}
    	else if (startX > 399 && startY < 199)
    	{
    		
    		startX += vx;
    		startY += vy;
    		
    	}
    	
    
    	
    }
  
 // text(" 2 ", 650, 50);
   //     	text(" 3 ", 700, 50);
    //    	text(" 4 ", 750, 50);
    //    	text(" 5 ", 650, 100);
     //   	text(" 6 ", 700, 100);
    
    public void mousePressed()
    {
    	if (GameState == 0)
    	{
    		if (mouseX < 300)
    			GameState = 1;
    		else if (mouseX < 600 && mouseX > 300)
    			GameState = 2;
    		else if (mouseX > 600)
    			GameState = 3;
    	}
    	else if (GameState == 3)
    	{
    		if (mouseX>470 && mouseX<700 && mouseY>750)
    		{
    			angle2 = 2+ (int) (Math.random()*11);
    			recalc();
    		}
    		
    	
    	}
    	
    
    }
    
    public void keyPressed()
    {
    	
    	if (keyCode == UP)
    	{
    		if (level < 9)
    			level ++;
    		recalc();
    		
    	}
    	else if (keyCode == DOWN)
    	{	
    		if (level > 0)
    			level --;
    		recalc();
    	}
    	else if (keyCode == RIGHT)
    	{	
    		if (scale < 1f)
    			scale += 0.1f;
    		recalc();
    			
    	}
    	else if (keyCode == LEFT)
    	{
    		scale -= 0.1f;
    		recalc();
    	}
    	else if (key == ' ')
    	{
    		g ++;
    		recalc();
    	}
    	else if (key == ',')
    	{
    		if (g > 0)
    			g --;
    		recalc();
    	}
    	else if (key == 'w')
    	{
    		angle ++;
    		angle2 ++;
    		recalc();
    	}
    	else if (key == 's')
    	{
    		angle --;
    		angle2 --;
    		recalc();
    	}
    	else if (key == 'd')
    	{
    		longBranch ++;
    		recalc();
    	}
    	else if (key == 'a')
    	{
    		longBranch --;
    		recalc();
    	}
    	else if (key == '1')
    	{
    		angle2++;
    		recalc();
    	}
    	else if (key == '2')
    	{
    		angle2 --;
    		recalc();
    	}
    	
    }

    public static void main(String[] args)
    {
        PApplet.main("AllFractalCalculate");
        
    }
    int count = 0;

    // private stuff below
    //private Dot d;
    
}