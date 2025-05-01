//Nice! - Mr. W
//1) declare  a variable to control the STATE of our game
//add font
//there are 2 methods of addinf fon ts to processing
// LOADFONT method loads an exisiting font from your computer
//Create font brings font downloaded from internet
//import sound
import processing.sound.*;
SoundFile sound;


PImage character;
PImage background;
PImage bowl;
PImage lic, lic2;
PFont score;
String gameState= "START";
//variables for character
float x, y, vx, vy, bowly, bowlx, bowlvelx, upX, upY, downX, downY, r, count,
  grid, ly, lx, lvx, lvy, yl, vxl, vyl, xl;

//LOADFONT
void setup() {
  fullScreen();
  grid=height/45;
  vx=0;
  vy=0 ;
  lvx=0;
  lvy=0;
  vxl=0;
  vyl=0;
  x = width/2;
  lx= width/2;
  xl= width/2;
  yl=-grid;
  y=-grid;
  ly=-grid;
  bowly=height/1.2;
  bowlx= width/2;
  bowlvelx= 0;
  //upX=width/2;
  //upY=700;
  // downX=300;
  // downY=200;
  //  r = 50;
  count= 0;


  //1)DECLARE FONT WITH TYPE AND NAME
  PFont title;

  println(height);
  //loading image for character
  //3) LOAD IMAGE using load image function
  character = loadImage("candy.png");
  lic= loadImage("lic.png");
  lic2 = loadImage("lic.png");
  background = loadImage("world.png");

  //3A) optionally resize the image. resize is a function of PImage
  character.resize(character.width/5, character.height/5);
  lic.resize(lic.width/4, lic.height/4 );
  lic2.resize(lic2.width/4, lic2.height/4);
  background.resize(background.width, background.height);
  println(background.width);
  println(background.height);

  //make bowl
  //loading image for character
  //3) LOAD IMAGE using load image function
  bowl = loadImage("bowl.png");


  //3A) optionally resize the image. resize is a function of PImage
  bowl.resize(character.width*2, character.height*2);
  int bgw = width;
  int bgh = height;
  background.resize(bgw, bgh);
  println(background.width);
  println(background.height);


  //add sound
  sound= new SoundFile(this, "crush.mp3");
  sound.loop();
}



void draw() {
  imageMode(CORNER);
  // use the image() function to display the image: image(PImage, x, y);
  image(background, width/2, height/2);



  //using if statemt draw start

  //an if statemet will control what is shown based on the gameState variable
  //every state needs a transition that will lead to next state
  //the TRANSITION could be CONDITION based on keyPressed, position, time, score, health, etc.
  //The TRANSITION will cahnge the value of the gameState variable
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













void keyPressed() {
  //the key press should also have an if statement based on gameState
  //this wa keys can do diff things in diff states
  if (gameState == "START") {
    //if space key is pressed
    if (key == ' ') {
      //assign gamestate the game value
      gameState = "GAME";
    }
  } else if (gameState == "GAME") {
  } else if (gameState == "END") {
    if (keyCode == ' ') {
      resetGame();
      gameState = "START";
      //call function here that resets game variables
    }
  }
  if (keyCode ==LEFT) {
    bowlvelx = -20;
  } else if (keyCode == RIGHT) {
    bowlvelx = 20;
  }
}


void keyReleased() {
  if (keyCode ==LEFT || keyCode ==RIGHT) {
    bowlvelx = 0;
  }
}



void drawStart() {
  background(#9BE8FF);
  imageMode(CORNER);
  image(background, 0, 0);
  textAlign(CENTER);
  textSize(70);
  fill(#F540B9);
  //draw start screen
  //create font method
  //CREATEFONT method
  //A)declare a font

  //b) dounsload a .otf or .ttf file from an online site like dafont.com
  //c. get file to ttf form
  //d use the creat front function to crate the font from file
  score = createFont("font.TTF", width/11);

  //E swwitch to my new font
  textFont(score);
  textAlign(CENTER);
  fill(#F20257);
  //F) wrtie something
  textAlign(CENTER);
  text("Catching Candy", width/2, height/6);
  fill(#E300B2);
  textSize(80);
  text("Use the left joystick to catch candy, if you drop one you're out!DON'T catch the licorice or you'll lose a point, hit the left blue button to start. Good Luck!", width/4, height*0.25, width/2, height/1);
}

void drawGame() {
  background(#9BE8FF);
  imageMode(CORNER);
  image(background, 0, 0);
  //rset y position
  //increment position by velocity
  bowlx = bowlx + bowlvelx;
  if (bowlx<0) {
    bowlx=0;
  }
  if (bowlx>width) {
    bowlx=width;
  }
  x+=vx;
  y+=vy;
  //draw charcter
  imageMode(CENTER);
  image(character, x, y);
  image(lic2, xl, yl);
  image(lic, lx, ly);
  image(bowl, bowlx, bowly);
  if (y>height) {
  }
  //for the end of game y have to be greater than 600
  if (y>height/1.2) {
    y=-grid;
    gameState= "END";
  }
  if (ly>height/1.2) {
    ly=-grid;
    lx=random(width);
  }
  if (yl>height/1.2) {
    yl=-grid;
    lx=random(width);
  }

  //if the distance between the mouse and the circle is LESS THAN the radius
  if (dist(x, y, bowlx, bowly) < 50) {
    y = -grid;
    x= int(random(0, width));
    count++;
  }
  if (dist(lx, ly, bowlx, bowly) < 50) {
    ly = -grid;
    lx= int(random(0, width));
    count--;
  }
  if (dist(xl, yl, bowlx, bowly)<50) {
    yl= -grid;
    xl=int(random(0, width));
    count--;
  }
  //increment position by velocity
  x+=vx;
  y+=vy;
  lx+=lvx;
  ly+=lvy;
  xl+=vxl;
  yl+=vyl;
  //draw our character
  fill(#FFA5E1);
  ellipse(x, y, 1, 1);

  //if character reaches the top or the bottom
  if (y > height || y < 0) {
    //reverse the y velocity
    vy = vy+00.10;
  }
  //if character reaches the top or the bottom
  if (ly > height || ly < 0) {
    //reverse the y velocity
    lvy = lvy+00.15;
  }
  if (yl > height || yl < 0) {
    //reverse the y velocity
    vyl = lvy+00.15;
  }
  if (x > width || x < 0) {
    vx = vx+0.5;
  }

  //print score or show score as text
  fill(255);
  text(count, width/8, height/7);
}


void drawEnd() {
  imageMode(CORNER);
  image(background, 0, 0);
  textAlign(CENTER);
  fill(#E300B2);
  textSize(width/11);
  text("You lose :(", width/2, height/1.8);
  text("you scored: " + count, width/2, height/1.5);
  text("hit start to play again", width/2, height/1.3);
  fill(255);
  text(count, width/8, height/7);
}

void resetGame() {
  //this is where you would  reassign varables to the stating valuse
  x=width/2;
  y=-grid;
  vx=0;
  vy=0.7 ;
  lvx=0;
  lvy=0;
  vyl=0;
  vxl=0;
  lx=width/2;
  ly=-grid;
  xl=width/2;
  yl=-grid;
  bowlx= width/2;
  bowly= height/1.2;
  count=0;
  imageMode(CORNER);
  image(background, 0, 0);
}
