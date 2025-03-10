
import processing.core.*;
import java.util.*;

public class Rectangle
{
	public Rectangle(PApplet papplet, float x, float y, float w, float h, int color)
	{
		this.x = x;
		this.y = y;
		this.w = w;
		this.h = h;
		this.papplet = papplet;
		this.color = color;
	}
	
	
	
	public void display()
	{
		
		papplet.rect(x,y,w,h);
	
	}
	
	public int color()
	{
		return color;
	}
	
	public ArrayList<Rectangle> split()
	{
		ArrayList<Rectangle> result = new ArrayList<Rectangle>();
		
		
		if (color == 1)
			return result;
		else if (color == 2)
		{
			result.add(new Rectangle(papplet, x, y, w/2, h/2, 1));
			result.add(new Rectangle(papplet, x+w/2, y+h/2, w/2, h/2, 1));


			result.add(new Rectangle(papplet, x, y+h/2, w/2, h/2, 2));
			result.add(new Rectangle(papplet, x+w/2, y, w/2, h/2, 2));
		}
			
			
		
		
		
		return result;
		
	}
		
	
	private float x;
	private float y;
	private float w;
	private float h;
	private int color;
	PApplet papplet;
	//private ArrayList<Rectangle> rects;
	


}