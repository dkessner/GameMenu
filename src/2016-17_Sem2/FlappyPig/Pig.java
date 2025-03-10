
import processing.core.*;

public class Pig{

	public Pig(PApplet papplet){
	
	this.papplet = papplet;
	pig1 = papplet.loadImage("WingedPig.png");
	pig2 = papplet.loadImage("WingsDown.png");	
	pig1.resize(100,100);
	pig2.resize(100,100);
	
	}
	
	public void display(){
	
	papplet.image(switchCostume(),50,(float)y);
	
	y+=vy;
	vy+=ay;
	
	}
	 
	public PImage switchCostume(){
	
		if(hitNumber%2==0)
		return pig1;
		else
		return pig2;
		
	}
	
	public void flapUp(){
	
	hitNumber++;
	if(y<papplet.height&&y>0){
		ay = -.2f;
	}
	
	
	}
	public void flapDown() {
		if (y < papplet.height && y > 0) {
			hitNumber++;
			ay = .3f;
		}
	}

	public double getX(){
		return 50;
	}
	
	public double getY(){
		return y;
	}
	
	public boolean lowPig(){
		return(y>800);
	}
	
	public void resetPig(){
		y =400;
		vy =.5f;
		ay=0.05f;
	}
	
	
	private PApplet papplet;
	
	private double y = 400;
	private double vy =.5f;
	private double ay=0.05f;
	private PImage pig1;
	private PImage pig2;
	private int hitNumber=0;


}
