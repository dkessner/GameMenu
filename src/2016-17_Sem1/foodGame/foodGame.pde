int x;
int y;
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
int h;
int hSpeed;
int xSpeed;
int k;
int fx;
int gameState;
Food food0;
Food food1;
import processing.sound.*;
SoundFile song;



void setup() {
  size(600, 600);

  food0= new Food();
  food1= new Food();

  food0.x= int(random(0, width));
  food0.vy = 5;
  food0.foodtype = 0;
  food1.x= int(random(0, width));
  food1.y = -300;
  food1.vy=5;
  food1.foodtype=0; 


  img6=loadImage("fat-man.png");
  x=300;
  y=height;
  h= 300;
  xSpeed = 6;
  hSpeed=4;
  k = x-150;
  fx=300;
  song = new SoundFile(this, "song.mp3");
  song.play();
}

void draw()
{
  if (gameState == 0) {
    drawStart();
  } else if (gameState== 1) {
    background(113, 188, 229);
    fill(72, 139, 74);
    noStroke();
    rect(0, 500, 600, 600);



    food0.display();
    food1.display();
    food0.checkCollision(); 
    food1.checkCollision();

    image(img6, fx, 370, 140, 200);
    if (dist(fx, height/1.26, k, h)<30) {
      println ("collision");
    }

    h=h+hSpeed;
    //println("x position: " + x);
    if (h>width) {
      hSpeed = -6;
    } else if (h<0) {
      hSpeed = 6;
    }
  } else if (gameState==2) {
    drawEnd();
  }
}

// this is to make the flower move left and right --> not working 
void keyPressed()
{
  if (keyCode == RIGHT)
    fx = fx+25;
  else if (keyCode == LEFT)
    fx = fx-25;

  if (keyCode ==   ENTER) { 
    if (gameState == 0) {
      gameState = 1;
    } else if (gameState == 2) { 
      gameState = 0;
    }
  }
}

void drawStart()
{
  background(72, 139, 74);
  stroke(0);
  fill(225, 5, 26);
  text("Fat Man!", 287, 250);
  fill(0);
  text("enter to start game", 265, 300);
}
void drawEnd()
{ 
  background(72, 139, 74);
  stroke(0);
  fill(225, 5, 26);
  text("Game over!", 285, 250);
  fill(0);
  text("enter to play again", 288, 300);
} 