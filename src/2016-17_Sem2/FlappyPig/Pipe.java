
import processing.core.*;

public class Pipe{

	public Pipe(PApplet papplet, int startPos){
	
		y = (int)papplet.random(400,700);
		this.papplet = papplet;
		imgup = papplet.loadImage("Uppipe.png");
		imgdp = papplet.loadImage("smallpipe.png");
		
		
		x = startPos;
		initialPos = startPos;
	}
	
	public void display(){
	
	
		papplet.image(imgup,x,y);
		papplet.image(imgdp,x,y-800);
		
		x=x-vx;
		
		if(x<0){
			x=1300;
			y = (int)papplet.random(400,700);
		}

	
	}
	
	public boolean PiginWidth(float pigX){
		return(pigX>x &&pigX<x+67) ;
	}
	
	public boolean PiginHeight(float pigY){
		return(pigY>y+301&&pigY<y) ;
	}
	
	public int getX(){
		return x;
	}
	
	public int getY(){
		return y;
	}
	
	public void setX(int coordinate){
		x = coordinate;
	}
	
	/*
	public boolean isCoord(double xcoord, double ycoord){
		if((xcoord>x&&xcoord<x+94)&&(ycoord>y-197&&ycoord<y)){
			return true;
		}
		else{
			return false;
		}
	}
	*/
	
	public boolean helloPig(double xcoord){
		return(xcoord>x&&xcoord<x+94);
	}
	
	public boolean skyPig(double ycoord){
		return(ycoord>y-197&&ycoord<y);
	}

	private PApplet papplet;
	
	
	private static PImage dp1;
	private static PImage dp2;
	private static PImage up1;
	private static PImage up2;
	
	private double dp;
	private double up;
	
	
	private PImage imgdp;
	private PImage imgup;
	
	private int vx = 2;
	private int x;
	private int y;
	private int initialPos;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
