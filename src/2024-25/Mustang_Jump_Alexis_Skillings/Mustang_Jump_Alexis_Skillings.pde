import processing.sound.*;
SoundFile jumpSound;
//mustang jump
PFont title;
PFont start;
String gameState="START";
PImage logo;
PImage paper;
int x, y;
float gameAcceleration = 0.0;
int score = 0;
float highestY;

//ArrayList<BlockSystem>blockSystems;
BlockSystem blockSystem;
Horse horse;
Block b;


void setup() {
  fullScreen();
  // initialize objects
  blockSystem = new BlockSystem();
  horse = new Horse();
  b = new Block(width/2.15, height);
  jumpSound = new SoundFile(this, "jump.wav");

  //assign images and varibles
  start = createFont("CollegiateFLF.ttf", 40);
  title = createFont("CollegiateFLF.ttf", 70);
  logo=loadImage("marlborough.jpg");
  logo.resize(width/2,height);
  paper = loadImage("GraphPaper.jpg");
  paper.resize(width, height);
  highestY= horse.y;

  x = width;
  y = height;
}

void draw() {
  if (gameState=="START") {
    drawStart();
  } else if (gameState=="GAME") {
    drawGame();
  } else if (gameState=="END") {
    drawEnd();
  }
}

void drawStart() {
  fill(#462D7C);
  rect(0, 0, width, height);
  imageMode(CENTER);
  image(logo, width/2, height/2);

  noFill();
  strokeWeight(10);
  stroke(#462D7C);
  ellipseMode(CENTER);
  ellipse(x/2, y/2+y/2.5, x/4, y/6);

  textFont(start);
  textAlign(CENTER);
  
  text("Press Space", x/2, y/2+y/2.5);
  text("to Start", x/2, y/2+y/2.25);
  
  textFont(title);
  textAlign(CENTER);
  text("MUSTANG JUMP", x/2, height/5);
}

void drawGame() {
  imageMode(CENTER);
  image(paper, width/2, height/2);

  b.displayLandingBlock();
  b.blockstart(horse);
  blockSystem.run();
  //blockSystem.update();
  horse.run();
  horse.display();
  horse.move();

  if (horse.y < highestY) {
    highestY = horse.y;
    score = int((height - highestY));  // Higher score = higher climb
  }

  // Draw score
  fill(0);
  textFont(start);
  textAlign(LEFT);
  text("Score: " + score, 50, 100);

 // gameAcceleration+=0.00005;

  if (horse.y>height) {
    gameState= "END";
  }
}

void drawEnd() {
  imageMode(CENTER);
  image(paper, width/2, height/2);
  horse.display();



  noFill();
  strokeWeight(10);
  stroke(#462D7C);
  ellipseMode(CENTER);
  ellipse(x/1.25, y/2+y/2.5, x/4, y/6);

  textFont(start);
  textAlign(CENTER);
  fill(#462D7C);
  text("YOU LOSE", x/1.25, y/2+y/2.5);
  text("PLAY AGAIN?", x/1.25, y/2+y/2.25);
  // Draw score
  fill(#462D7C);
  textFont(title);
  textAlign(CENTER);
  text("Score: " + score, x/2, y/10);
}


//**only check colision when velocity is negative

//this function detects when a key clicks on something
void keyPressed() {
  if (gameState=="START") {
    if (keyCode == ' ');
    gameState="GAME";
  }
  //if (gameState == "GAME") {
  //if (keyPressed =="1") {
  // horse.keyPressed();
  //}
  // }
  if (gameState == "END") {
    if (keyCode == ' ');
    gameState = "GAME";
    //horse.x = width/3;
    horse.y = height/1.3;
    horse.x = width/2;
    horse.vy = 0;
    score = 0;
    highestY=0;
    highestY = horse.y;
    b.startBlockVisible = true;
  }
  if (gameState == "GAME") {
    if (key == '1') {//and on blok if true
      horse.run();
      horse.vy = -5;
      jumpSound.play();
      b.startBlockVisible = false;//theres something wrong with this code
      //set to false
      
    }
  }
}
