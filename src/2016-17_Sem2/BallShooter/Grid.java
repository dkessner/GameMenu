import processing.core.*;
import java.util.*;

public class Grid
{
	public Grid(PApplet p, float diameter)
	{
		this.p = p;
		this.diameter = diameter;
		grid = new Ball[(int) (p.height/diameter)][(int) (p.width/diameter)]; // [rows] [col]
	}
	
	public void assignGrid(Ball ball)
	{
		int i = (int) (ball.getPosY()/diameter); //rows
		int j = (int) (ball.getPosX()/diameter); //col
		//System.out.println("x,y: " + ball.getPosX() + " " + ball.getPosY());
		//System.out.println("i,j: " + i + " " + j); 
		
		grid[i][j] = ball;
	}
	
	//fix this
	public ArrayList<Ball> getNeighbors(int i, int j)
	{
		ArrayList<Ball> neighbors = new ArrayList<Ball>();
		
		if (i%2 == 1)
		{
			if (i-1 > -1 && getBall(i-1,j) != null)
				neighbors.add(getBall(i-1,j));

			if (i-1 > -1 && j+1<getWidth() && getBall(i-1,j+1) != null)
				neighbors.add(getBall(i-1,j+1));
		
			if (j-1 > -1 && getBall(i,j-1) != null)
				neighbors.add(getBall(i,j-1));
		
			if (j+1<getWidth() && getBall(i,j+1) != null)
				neighbors.add(getBall(i,j+1));
		
			if (i+1<getLength() && getBall(i+1,j) != null)
				neighbors.add(getBall(i+1,j));
		
			if (i+1<getLength() && j+1<getWidth() && getBall(i+1,j+1) != null)
				neighbors.add(getBall(i+1,j+1));
		}
		
		if (i%2 == 0)
		{
			if (i-1 > -1 && j-1>-1 && getBall(i-1,j-1) != null)
				neighbors.add(getBall(i-1,j-1));

			if (i-1 > -1 && getBall(i-1,j) != null)
				neighbors.add(getBall(i-1,j));
		
			if (j-1 > -1 && getBall(i,j-1) != null)
				neighbors.add(getBall(i,j-1));
		
			if (j+1<getWidth() && getBall(i,j+1) != null)
				neighbors.add(getBall(i,j+1));
		
			if (i+1<getLength() && j-1>-1 && getBall(i+1,j-1) != null)
				neighbors.add(getBall(i+1,j-1));
		
			if (i+1<getLength() && getBall(i+1,j) != null)
				neighbors.add(getBall(i+1,j));
		}
		
		
		/*for (Ball x : neighbors)
		{
			System.out.print("Neighbors: " + getGridI(x) + " " + getGridJ(x));
		}*/
		
		return neighbors;
	}
	
	public void cleanUp(ArrayList<Ball> balls)
	{
		for(Ball b : balls)
			if(b.getAlive()==false)
				grid[getGridI(b)][getGridJ(b)] = null;
	}
	
	public Ball isNull(int x, int y)
	{return grid[y][x];}
	
	public int getLength()
	{return grid.length;}
	
	public int getWidth()
	{return grid[0].length;}
	
	public int getGridI(Ball ball)
	{return (int) (ball.getPosY()/diameter);}
	
	public int getGridJ(Ball ball)
	{return (int) (ball.getPosX()/diameter);}
	
	public Ball getBall(int i, int j)
	{
		if(i<-1 || j<-1 || i>grid.length || j>grid[0].length)
			return null;
		
		return grid[i][j];
	}
	
	public void printGrid()
	{
		System.out.println("Grid size" + grid.length + "x" + grid[0].length);
		for(int i=0; i<grid.length; i++)
		{
			for(int j=0; j<grid[0].length; j++)
			{
				if(grid[i][j] != null)
					System.out.println(i + " " + j);
			}
		}
	}
	
	PApplet p;
	float diameter;
	private Ball [][] grid;
}