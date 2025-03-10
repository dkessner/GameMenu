

import processing.core.*;


public class Score{

public Score(PApplet papplet){
	
	this.papplet = papplet;
	
}

public void display(){
	f = papplet.createFont("Arial",16,true);
	papplet.textFont(f,70);
	papplet.fill(0);
	papplet.text(scoreCount, 1150, 100);
}

public void addScore(){

	scoreCount++;
}

public void resetScore(){
	scoreCount =0;
}


private PApplet papplet;
private PFont f;

private int scoreCount = 0;

}