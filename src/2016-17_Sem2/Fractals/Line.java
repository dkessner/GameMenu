

import processing.core.*;
import java.util.*;

public class Line
{


	public Line(PApplet papplet, float LineX, float LineY, float LineX2, float LineY2)
	{
		this.LineX = LineX;
		this.LineY = LineY;
		this.LineX2 = LineX2;
		this.LineY2 = LineY2;
		
		this.papplet = papplet;
		
	}
	
	
	public void display()
	{
		
		papplet.line(LineX,LineY,LineX2,LineY2);
	
	}
	
	//int g = number of branches
	//scale = size
	// angle & angle 2 = angles between branches
	//times2 & times = branches getting farther from center
	
	
	public ArrayList<Line> split(float scale, int angle, int g, int times2, int angle2, int longBranch)
	{
		ArrayList<Line> result = new ArrayList<Line>();
		int times = 1;
		for (int i = 0; i<g ; i++)
		{
			endpoint = new PVector(LineX2-LineX, LineY2-LineY);
			endpoint.mult(scale);
			endpoint.rotate(times*PApplet.PI/angle);
			endpoint.add(LineX2, LineY2);
			result.add(new Line(papplet, LineX2, LineY2, endpoint.x, endpoint.y));
			
			endpoint2 = new PVector(LineX2-LineX, LineY2-LineY);
			endpoint2.mult(scale);
			endpoint2.rotate(-PApplet.PI*times2/angle2); 
			endpoint2.add(LineX2 - longBranch, LineY2 - longBranch);
			result.add(new Line(papplet, LineX2, LineY2, endpoint2.x, endpoint2.y));
			
			times ++;
			times2 ++;
		}
		
		/*
		endpoint2 = new PVector(LineX2-LineX, LineY2-LineY);
		endpoint2.mult(scale);
		endpoint2.rotate(-PApplet.PI/4);
		endpoint2.add(LineX2, LineY2);
		result.add(new Line(papplet, LineX2, LineY2, endpoint2.x, endpoint2.y));
		*/
		return result;
		
		
	}
		
	
	private float LineX;
	private float LineY;
	private float LineX2;
	private float LineY2;
	PVector endpoint, endpoint2;
	
	PApplet papplet;
}