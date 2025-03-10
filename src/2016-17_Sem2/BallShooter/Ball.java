


import processing.core.*;

public class Ball
{
	public Ball(PApplet p, PVector v, PVector pos, float diameter, int color)
	{
		this.p = p;
		this.diameter = diameter;
		this.pos = pos;
		this.v = v;
		this.color = color;
		gridded = true;
		alive = true;
		id = nextID;
		nextID++;
		
		grid = new Grid(p,diameter);
	}


	public void display()
	{
		if (color == 1)
			p.fill(255,0,0);
		if (color == 2)
			p.fill(0,255,0);
		if (color == 3)
			p.fill(0,0,255);
		if (color == 4)
			p.fill(255,255,0);
		if (color == 5)
			p.fill(0,255,255);
		if (color == 6)
			p.fill(255,0,255);
		if (color == 7)
			p.fill(150,0,255);
		if (color == 8)
			p.fill(0,128,255);
		if (color == 9)
			p.fill(255,128,0);
		if (color == 10)
			p.fill(255);
		if (color == 11)
			p.fill(128);
		if (color == 12)
			p.fill(0);
		p.ellipse(pos.x,pos.y,diameter,diameter);

		
		//if (pos.x <= (p.width-p.height)/2+diameter/2 || 
		//pos.x >= (p.width-(p.width-p.height)/2)-diameter/2)
		if (pos.x <= diameter/2 || pos.x >= p.width-diameter/2)
			v.x = -v.x;	
				
		pos.add(v);
	}
	
	public void stop()
	{
		v.x = 0;
		v.y = 0;
	}
	
	public void doGrid()
	{pos = getGrid(pos);}
	
	public PVector getGrid(PVector v)
	{
		int Xdist = (int) (v.x/diameter);
		// *.4 bc a little under half diameter, keeps ball from snapping to ball it's colliding with
		int Ydist = (int) ((v.y+diameter*4/10)/diameter);
		//int Ydist = (int) (v.y/((9*diameter)/10));
		
		//how do I refer to grid points?
		if (grid.isNull(Xdist,Ydist)==null)
			return doRightGrid(Xdist,Ydist);
		else if (Xdist+1<(int) p.width/diameter && grid.isNull(Xdist+1,Ydist)==null)
			return doRightGrid(Xdist+1,Ydist);
		else if (Xdist-1>0 && grid.isNull(Xdist-1,Ydist)==null)
			return doRightGrid(Xdist-1,Ydist);
		return doRightGrid(Xdist,Ydist);
	}
	
	public PVector doRightGrid(int Xdist, int Ydist)
	{
		PVector result = new PVector();
		if (Ydist%2 == 1)
			result.x = diameter*Xdist + diameter/2;
		if (Ydist%2 == 0)
			result.x = diameter*Xdist;
		result.y = diameter*Ydist + diameter/2;
		
		return result;
	}
	
	public void dead()
	{
		alive = false;
		color = 0;
	}
	
	public boolean getAlive()
	{return alive;}
	
	public float getPosX()
	{return pos.x;}
	
	public float getPosY()
	{return pos.y;}
	
	public int getColor()
	{return color;}
	
	public float getVx()
	{return v.x;}
	
	public float getVy()
	{return v.y;}
	
	public boolean getGridded()
	{return gridded;}
	
	public void didGrid()
	{gridded = false;}
	

	PApplet p;
	private Grid grid;
	private float diameter;
	private PVector pos;
	private PVector v;
	private int color;
	private boolean gridded;
	private boolean alive;

	
	public int id;
	
	private static int nextID = 0;
}