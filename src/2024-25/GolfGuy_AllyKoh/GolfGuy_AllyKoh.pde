//declare variables
//set a fall background, hand, a score, a start and play again button,
import processing.sound.*;
PImage golfball;
PImage playagain;
PImage begin; 
PVector position, velocity;
float ellipseX, ellipseY, radius;
int score;
int lives;
float x, y, z, a, b, c, d, xp, zp;
String gameState = "START";
PFont title;
SoundFile sound;
float lastVelocity;


//Now we set our processing to Active Mode
//we can resize as needed with the resize function

void setup() {
  fullScreen();
  score = 0;
  lives = 3;
  sound = new SoundFile(this, "funmusic.mp3");
  ellipseX = random(width);
  ellipseY = height/6;
  radius = width/10;
  velocity = new PVector(12, 0);
  position = new PVector(width/2, height/1.2);
  golfball = loadImage("golfball.png");
  golfball.resize(golfball.width/6, golfball.height/6);
  playagain = loadImage("image-removebg-preview.png");
  playagain.resize(playagain.width/3, playagain.height/3);
  begin = loadImage("beginflag.png"); 
  begin.resize(begin.width/2, begin.height/2);
  lastVelocity = 15;
}

void draw() {
  if (gameState == "START") {
    //draw the start screen
    drawStart();
  } else if (gameState == "GAME") {
    //draw the game
    drawGame();
  } else if (gameState == "END") {
    //draw the end screen
    drawEnd();
  }
}

void drawStart() {
  //drawStart will make the start screen with the title of the game, the rules of the game, and a play button
  background(#62AF57);
  textAlign(CENTER);
  textSize(100);
  fill(#FFFFFF);
  text("GOLF GUY", width/2, height/6);
  textSize(50);
  String s = "How to play: A golf ball will move at the bottom of the screen. A golf hole will spawn at the top. Press SPACE to stop the moving golf ball when it aligns with the hole at the top of the screen. Press UP to Start!";
  fill(#B3DEAC);
  text(s, width/4, height/4, width/2, height/2);
  //x and y values for the begin image
  x = width/2;
  y = height/1.4;
  imageMode(CENTER);
  image(begin, width/2, height/1.3);
}
void drawGame() {
  background(#7EB476);
  //drawGame is the state where player will play game
  //first, I will set all images onto screen
  fill(#050404);
  ellipse(ellipseX, ellipseY, radius, radius);
  imageMode(CENTER);
  image(golfball, position.x, position.y);
  position.add(velocity);
  if (position.x > width || position.x < 0) {
    velocity.x *= -1;
  }
  if (position.y < 0) {
    ellipseX = random(x);
    position.x = width/2;
    position.y = height/1.2;
    velocity.y = 0;
    velocity.x = lastVelocity;
    velocity.x += 15;
    lives -=1;
  }
  //now I will set code for the movement of the variable
  //now i will make the score and the number of lives left for the player
  text("SCORE = " + score, width/10, height/10);
  text("LIVES = " + lives, width/10, height/6);
  //Make a statement for so the drinks continue to move until caught by hands
  if (dist(ellipseX, ellipseY, position.x, position.y) < width/15) {
    ellipseX = random(x);
    image(golfball, position.x, position.y);
    position.x = width/2;
    position.y = height/1.2;
    position.add(velocity);
    velocity.y = 0;
    velocity.x += 15;
    score +=1;
  }
  c = c +0.4;
  //now I will make the score go up when the hand catches a pumpkin latte
  //now I will add text so that when they hit the floor they reset
  if (lives==0) {
    gameState = "END";
  }
}
void keyPressed() {
  if (gameState == "START") {
    if (keyCode == UP) {
      sound.play();
      gameState = "GAME";
    }
  }
  //This function allows player to move the hands
  if (gameState == "GAME") {
    if (key == ' ') {
      lastVelocity = velocity.x;
      velocity.x = 0;
      velocity.y = -10;
    }
  }
  if (gameState == "END") {
    if (keyCode == ' ') {
      gameState = "START";
    }
  }
}
//keyreleased ensures that when the player releases the key, the hands will stop moving
void keyReleased() {
  if (gameState == "GAME") {
    if (keyCode == LEFT || keyCode == RIGHT) {
      d = 0;
    }
  }
}


void drawEnd() {
  background(#C6E8B4);
  textSize(50);
  text("AWW GAME OVER", width/2, height/2);
  text("PLAY AGAIN?", width/2, height/1.6);
  imageMode(CENTER);
  image(playagain, width/2, height/1.2);
}
