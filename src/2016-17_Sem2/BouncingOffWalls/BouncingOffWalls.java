//
// BouncingOffWalls.java
//


import processing.core.*;


public class BouncingOffWalls extends PApplet
{
	PApplet papplet = new PApplet(); 
    public void settings()
    {
        fullScreen(); 
   	}
    
    public void setup()
    {
    	myFont = createFont("American Typewriter", 20);
    	font2 = createFont("Zapfino", 60);  
    	centerx = width/2;
    	centery = height/2; 
    	rectx = 0; 
    	recty = 0; 
    	x2 = width/2; 
    	y2 = height/2; 
    	x = width/2; 
    	y = height/2; 
    	
    	balls = new StartScreenBounce(this); 
    }
    
    
	public void drawStart() {
		background(0); 
		balls.display();
		fill(250, 200, 100); 
		ellipse(centerx, centery, 250, 250); 
		fill(0); 
		textFont(myFont); 
		textAlign(CENTER, CENTER); 
		text("Press left arrow", centerx, centery-40); 
		text("to see instructions", centerx, centery-20); 
		text("and right arrow", centerx, centery);
		text("to start game", centerx, centery+20);
		fill(250);  
		textFont(font2); 
		textAlign(CENTER, CENTER); 
		text("Bouncing Off Walls", width/2, height/8); 
		 
	}
	
	private StartScreenBounce balls;
	
	public void drawInstructions() {
		background(0); 
		textFont(myFont); 
		textAlign(CENTER, CENTER); 
		text("Use the arrow keys to avoid letting the ball hit the sides of the screen. Once you have succeeded", centerx, centery); 
	 	text("in avoiding the wall 5 times, you will level up. The rectangle in which you must keep the ball decreases", centerx+20, centery+20);
	 	text("as the levels increase. Once the ball passes the edge, the game is over.", centerx+40, centery+40); 
		textAlign(CENTER, CENTER); 
		text("Press any key to return to start screen", centerx+60, centery+60); 
	}
		
    public void drawEnd() {
    	levelCount = 1; 
    	background(0);
    	balls.display();
    	fill(250); 
    	noStroke(); 
    	textFont(myFont); 
    	textAlign(CENTER, CENTER);  
    	text("GAME OVER :(", centerx, centery); 
    	text("Press space to return to start screen", centerx+50, centery+50); 
    }
    public void drawLevels() {
    	background(250);
    	if (frameCount % 15 == 0)
  		      c = papplet.color((int)papplet.random(255), (int)papplet.random(255), (int)papplet.random(255));
        fill(c);
        rectMode(CENTER);  
        stroke(250); 
        rect(centerx, centery, width-rectx-1, height-recty-1); 
        noStroke(); 
        fill(250); 
        ellipse(x, y, 50, 50);
        x+= vx; 
        y+= vy;
        if(x > width-rectx || x < rectx) {  
        	gameState = 3;   
        }
        if(y > height-recty || y < recty) {
        	gameState = 3;  
        }
        if(playCounter >= 5) {
        	levelCount++;
        	if(levelCount == 5) {
        		gameState = 5; 
        	}
        	else 
        		gameState = 2;  
        }
        textFont(myFont); 
        text("Level: " + levelCount, 50+(rectx), height-recty-50); 
    }
    public void drawLevelUp() {
    	background(0); 
    	balls.display();
    	fill(250); 
    	textFont(myFont); 
    	textAlign(CENTER, CENTER); 
    	text("Level Up!", centerx, centery); 
    	text("Press any key to continue", centerx+50, centery+50); 
    }
    public void drawWon() {
    	background(0);
    	balls.display(); 
    	fill(250); 
    	textFont(myFont); 
    	textAlign(CENTER, CENTER); 
    	text("Congrats! You have won the game", centerx, centery); 
    	text("Press any key to return to start screen", centerx+50, centery+50); 
    }
    public void draw()
    {
		if(gameState == 0) {
			drawStart(); 
		}
		else if(gameState == 1) {
			drawLevels(); 
		}
		else if (gameState == 3) {
			drawEnd();
		}
		else if (gameState == 2) {
			drawLevelUp(); 
		}
		else if (gameState == 4) {
			drawInstructions(); 
		}
		else if (gameState == 5) {
			drawWon(); 
		}
    }

    public void keyPressed()
    {
    	if(gameState == 0) {
    		if(keyCode == RIGHT) {
    				gameState++;
    			}
    		else if(keyCode == LEFT) {
    			gameState = 4; 
    		}
    	} 	
    	else if(gameState == 3 && key == ' ') {
    		gameState = 0; 
    		vx = 2; 
    		vy = 2; 
    		x = centerx; 
    		y = centery;
    		playCounter = 0;
    		levelCount = 1; 
    		rectx = 0; 
    		recty = 0; 
    	}
    	else if (gameState == 2){
    		gameState = 1; 
    		vx = 3; 
    		vy = 3; 
    		x = centerx; 
    		y = centery;
    		rectx += 50; 
    		recty += 50; 
    		playCounter = 0;  
    	}
    	else if(gameState == 4) {
    		gameState = 0; 
    	}
    	
    	else if (gameState == 1 && (x > centerx+50 || x < centerx-50) && (y > centery+50 || y < centery-50)) {
        	if((keyCode == LEFT || keyCode == RIGHT)) {
        		vx = -vx; 
        		vx -= 4; 
        		playCounter++; 
        	}
       		if((keyCode == DOWN || keyCode == UP)) {
        		vy = -vy; 
        		vy -= 4;
        		playCounter++; 
        	}
        }
        else if (gameState == 5) {
        	gameState = 0; 
        }
    }

    public static void main(String[] args)
    {
        PApplet.main("BouncingOffWalls");
    }
private int gameState = 0; 
private int rectx; 
private int recty;
private int playCounter = 0; 
private int vx2 = 4; 
private int vy2 = 6; 
private int x2; 
private int y2; 
private int vx = 2; 
private int vy = 2; 
private int x; 
private int y; 
private int c = 0;  
private int counter2 = 5;  
private int centerx; 
private int centery;
private int levelCount = 1; 
PFont myFont; 
PFont font2;  
}
/* Game State Key
0 = start screen
1 = game
2 = level up screen
3 = end game screen
4 = instructions
5 = game won screen
*/

