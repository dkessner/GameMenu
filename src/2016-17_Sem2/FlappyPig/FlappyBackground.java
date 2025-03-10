
import processing.core.*;

// int background
//	0 = homeScreen
// 	1 = gameScreen
//	2 = gameOver screen


public class FlappyBackground{

	public FlappyBackground(PApplet papplet){
			this.papplet = papplet;
			pig = papplet.loadImage("Flyingpig.jpg");
			title = papplet.loadImage("title.png");
			start = papplet.loadImage("space.png");
			over = papplet.loadImage("over.png");
			gameOver = papplet.loadImage("screen.jpg");
			title.resize(800,200);
			start.resize(400,50);
			over.resize(700,500);
			gameOver.resize(1300,800);
		    pig.resize(papplet.width,papplet.height);
	}	
	
	public void display(int background){
	
		if(background==0){
			papplet.image(pig,0,0);
			papplet.image(title,300,200);
			papplet.image(start,400,350);
		}
		else if(background==1){
			papplet.image(pig,0,0);
		}
		
		else if(background==2){
			papplet.background(0,0,0);
			papplet.image(gameOver,0,0);
			papplet.image(over,300,150);
		}
	
		else{
		}
		
	
	}
	
	public void end(){
	
		papplet.background(0,0,0);
	}
	


	private PImage pig;
	private PImage title;
	private PImage start;
	private PImage over;
	private PImage gameOver;
	private PApplet papplet;
}