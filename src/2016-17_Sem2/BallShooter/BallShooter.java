//TO DO
// bubbles die if they aren't touching anything
// make smoother cannon ???
// for every 10 times you shoot, 2 rows of ball drop down
// LAST: clean up extra code
// maybe do a tutorial screen????

import processing.core.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import java.util.*;

public class BallShooter extends PApplet
{
	public void settings()
	{
		size(displayWidth,displayHeight);
		
		minim = new Minim(this);

        song = minim.loadFile("Killers.mp3");
        pew = minim.loadFile("pew.mp3");
        pop = minim.loadFile("loudpop.mp3");
       	//song.play();
	}

	public void setup()
	{
		diameter = width/25;
		balls = new ArrayList<Ball>();
		rl = new RightLeft(this, diameter);
		grid = new Grid(this, diameter);
		startBalls();
		nextScore = 30;
		maxNum = 9;
		color = (int) random(1,maxNum);
		canShoot = true;
	}

	public void draw()
	{
		background(179, 236, 255);
                /*
		if (!song.isPlaying())
		{
			song.rewind();
			song.play();
		}
                */
	
		if(state == -1)
		{
			textAlign(CENTER);
			textSize(height/5);
			fill(0);
			text("Bubble Shooter", (float) width/2, (float) height*2/5);
			textSize(height/9);
			text("by Emma Price", (float) width/2, (float) height*3/5);
			textSize(height/12);
			text("(press space)", (float) width/2, (float) height*4/5);
		}
	
		if(state == 0)
		{
			textAlign(LEFT);
			textSize(height/28);
			fill(0);
			text("Welcome! Match 3 bubbles in a row to score.", (float) width/5, (float) height/5);
			text("Left and Right control the cannon. Up to shoot.", (float) width/5, (float) height*2/5);
			text("For every 30 points scored, a new color will be introduced.", (float) width/5, (float) height *3/5);
			text("(press space)", (float) width/5, (float) height*4/5);
		}
		
		if(state == 1)
		{
			for (Ball b: balls)
				b.display();
			
			rl.display();
			
			rectMode(CORNER);
			fill(255,255,0);
			rect(0,diameter*(float) 10.5,width,height/200);
			
			showColor();
		
			textSize(50);
			fill(0);
			text(score,(float) 0.0,(float) 0.9*height);
		
			if (score > nextScore)
			{
				maxNum++;
				nextScore += 30;
			}
			
			snapAndAssignGrid();
			
			text(""+canShoot,width-100,height-50);
		
			determineDead();
			
			cleanUp(); //deletes balls from ArrayList
			grid.cleanUp(balls); //removes balls from grid
			
			nextState();
		}
		
		if(state == 2)
		{
			textAlign(CENTER);
			textSize((int) height/9);
			fill(0);
			text("GAME OVER", (float) width/2, (float) height/3);
			textSize((int) height/7);
			text(score, (float) width/2, (float) height/2);
			textSize((int) height/9);
			text("Press Space to play again!", (float) width/2, (float) height*2/3);
		}
	}
	
	public void startBalls()
	{
		for(int i=0; i<4; i++)
		{
			for(int j=0; j<grid.getWidth(); j++)
			{
				if (!(i%2 == 0 && j == 0))
				{
					PVector pos = gridToPos(i,j);
					Ball q = new Ball(this,new PVector(0,0), pos, diameter,(int) random(1,9));
					balls.add(q);
					grid.assignGrid(q);
				}
			}
		}
	}
	
	public PVector gridToPos(int i, int j)
	{
		PVector result = new PVector();
		if (i%2 == 1)
			result.x = diameter*j + diameter/2;
		if (i%2 == 0)
			result.x = diameter*j;
		result.y = diameter*i + diameter/2;
		
		return result;
	}

	public void showColor()
	{
		if (color == 1)
			fill(255,0,0);
		if (color == 2)
			fill(0,255,0);
		if (color == 3)
			fill(0,0,255);
		if (color == 4)
			fill(255,255,0);
		if (color == 5)
			fill(0,255,255);
		if (color == 6)
			fill(255,0,255);
		if (color == 7)
			fill(150,0,255);
		if (color == 8)
			fill(0,128,255);
		if (color == 9)
			fill(255,128,0);
		if (color == 10)
			fill(255);
		if (color == 11)
			fill(128);
		if (color == 12)
			fill(0);
		ellipse(width/2,height-diameter,diameter,diameter);
	}	
	
	public void snapAndAssignGrid()
	{
		Ball current = null;
		if (balls.size()>0)
			current = balls.get(balls.size()-1);
	
		if (current != null && current.getPosY() <=diameter/2)
		{
			current.stop();
			canShoot = true;
			current.doGrid();
		}	
	
		for (Ball a : balls)
		{
			if (a != current && 
			dist(a.getPosX(),a.getPosY(),current.getPosX(),current.getPosY())<diameter)
			{
				current.stop();
				current.doGrid();
				canShoot = true;
				break;
			}
		}
		
		if (current != null && current.getVx()==0 && current.getVy()==0 && current.getGridded()==true)
		{
			canShoot = true;
			grid.assignGrid(current);
			current.didGrid();
			
		}
		
	}
	
	public void determineDead()
	{	
		Ball current = null;
		if (balls.size()>0)
			current = balls.get(balls.size()-1);
				
		for (Ball b : balls)
		{
			if (b != null)
			{
				ArrayList<Ball> neighbors = grid.getNeighbors(grid.getGridI(b),grid.getGridJ(b));
				
				ArrayList<Ball> sameNeighbors = sameColor(neighbors, b.getColor());	
				sameNeighbors.add(b);
						
				if (sameNeighbors.size()>2 && b.getAlive()==true)
				{
					score += sameNeighbors.size();
					for (Ball s : sameNeighbors)
						s.dead();
				}
				
				/*if (current.getGridded() == false && neighbors.size()<1 && grid.getGridI(b)>0)
				{
					score ++;
					b.dead();
				}*/	
			}
		}
	}

	public ArrayList<Ball> sameColor(ArrayList<Ball> balls, int color)
	{
		ArrayList<Ball> sameColor = new ArrayList<Ball>();
		if (balls.size() > 0)
		{
			for(Ball b : balls)
			{				
				if (color == b.getColor())
					sameColor.add(b);	
			}	
		}
		return sameColor;
	}

	public void cleanUp()
	{
		for(int i=balls.size()-1;i>=0;i--)
		{
			if(balls.get(i).getAlive() == false)
			{
				balls.remove(balls.get(i));
				pop.play();
				pop.rewind();
				canShoot = true;
			}
		}
	}
	
	public void nextState()
	{
		for (int j=0; j<grid.getWidth(); j++)
		{
			if(grid.getBall(10,j)!= null)
				state = 2;
		}
	}

	private void shootBall()
	{
		vector = PVector.fromAngle(rl.getAngle()-PI/2);
		vector.setMag(10);
		balls.add(new Ball(this,vector,new PVector(width/2, height-diameter),diameter,color));
		color = (int) random(1,maxNum);
	}

	public void keyPressed()
	{
		if (keyCode == LEFT)
			rl.leftGo();
			
		if(keyCode == RIGHT)
			rl.rightGo();
			
		if (keyCode == UP)
		{
			if (canShoot == true)
			{
				shootBall();
				canShoot = false;
				time = millis() + 1000;
				pew.play();
				pew.rewind();
			}
		}	
	}
	
	public void keyReleased()
	{	
		if(keyCode == 32)
		{
			if (state == 0)
				state = 1;
			else if (state == -1)
				state = 0;
			else if (state == 2)
			{
				balls = new ArrayList<Ball>();
				grid = new Grid(this, diameter);
				score = 0;
				startBalls();
				state = -1;
			}
		}
	}
	
	private Minim minim;
	private AudioPlayer song;
	private AudioPlayer pew;
	private AudioPlayer pop;
	private PVector vector;
	private ArrayList<Ball> balls;
	private RightLeft rl;
	private Grid grid;
	private int state = -1;
	private int color;
	private float diameter;
	private int score;
	private int nextScore;
	private int maxNum;
	private int pause;
	private int time;
	private boolean canShoot;

	public static void main(String[] args)
	{
		PApplet.main("BallShooter");
	}
}
