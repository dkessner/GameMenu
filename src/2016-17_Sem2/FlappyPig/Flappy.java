
import processing.core.*;
import java.util.*;
import ddf.minim.*;

public class Flappy extends PApplet{

	public static void main(String[]args){
		
		PApplet.main("Flappy");
		
	}
	
	public void settings(){
		size(1300,800);
	}
	
	public void setup(){
	
		bg = new FlappyBackground(this);
		minim = new Minim(this);
		
		song = minim.loadFile("dog.mp3");
		song.play();
		
		boing = minim.loadFile("boing.mp3");
		sizzle = minim.loadFile("sizzle.mp3");
	
	    pipes = new ArrayList <Pipe>();
	
		pipes.add(new Pipe(this,300));
		pipes.add(new Pipe(this,600));
		pipes.add(new Pipe(this,900));
		pipes.add(new Pipe(this,1200));
	
	
	pig = new Pig(this);
	score = new Score(this);
	state =0;

	}
	
	public void draw(){
		//println(mouseX,mouseY);
		
		if(state==0){
			bg.display(0);
			score.resetScore();
			sizzle.pause();
			song.play();
		}
		

		else if(state ==1){
			
		bg.display(1);	
		score.display();
		
		//ellipse((int)pig.getX(),(int)pig.getY(),50,50);
		
		for(Pipe p :pipes){
			p.display();
		}
			pig.display();
			score(pipes);
		
			if(pig.lowPig()){
				bg.display(2);
				state=2;
				resetPipes();
			}
			
		}
		
		if(!inPipe()&&checkPigX()){
				boing.play();
				boing.rewind();
				bg.display(2);
				state=2;
				sizzle.loop();
				song.pause();
				song.rewind();
				resetPipes();
		}
		


	
	

		/*
	
	
	if(closestPipe(pipes).helloPig(144)||closestPipe(pipes).helloPig(61)){
			println("x:true");
		}
		else{
			println("x: false");
		}
	
			public static boolean checkPigX(){
		return(closestPipe(pipes).helloPig(144)||closestPipe(pipes).helloPig(61));
	}
	
	
	
			if(closestPipe(pipes).skyPig(pig.getY()+13)&&closestPipe(pipes).skyPig(pig.getY()+84)){
			println("y: true");
	
		}
		else{
			println("y: false");
		}
	
	*/
	
	}
	
	public boolean inPipe(){
		return(checkPigX()&&checkPigY());
	}
	public boolean checkPigX(){
		return(closestPipe(pipes).helloPig(144)||closestPipe(pipes).helloPig(61));
	}
	
	public boolean checkPigY(){
		return(closestPipe(pipes).skyPig(pig.getY()+13)&&closestPipe(pipes).skyPig(pig.getY()+84));
	}
	
	public void keyPressed(){
		if (keyCode ==UP){
			pig.flapUp();
		}
		if (keyCode == 82){
			pig.resetPig();
			score.resetScore();
		}
		if(keyCode==32&&state==0){
			state=1;
		
		}
	
		else if(keyCode==32&&state==2){
			state=0;
			pig.resetPig();
			resetPipes();
			
		
		}
	}
	public void keyReleased() {
		if (keyCode == UP) {
			pig.flapDown();
		}
	}
	



	public void score(ArrayList <Pipe> pipes){
		for(Pipe p: pipes){
			if(p.getX()==pig.getX()){
				score.addScore();
			}
		}
	}
	
	public Pipe closestPipe(ArrayList <Pipe> pipes){
		Pipe closest = pipes.get(0);
		for(Pipe p: pipes){
			if(p.getX()<closest.getX()){
				closest = p;
			}
		}
		return closest;
	}
	
	public boolean deathbyPipe(Pipe p){
	
		return((pig.getX()+35)>p.getX()&&pig.getY()>p.getY()||pig.getY()<(p.getY()-197));
			
	}

	public void resetPipes(){
		pipes.get(0).setX(300);
		pipes.get(1).setX(600);
		pipes.get(2).setX(900);
		pipes.get(3).setX(1200);
	}
	
	private FlappyBackground bg;
	private Pig pig;
	private Score score;
	private ArrayList<Pipe> pipes;
	private Minim minim;
	private AudioPlayer song;
	private AudioPlayer boing;
	private AudioPlayer sizzle;
	
	private int state;
}

