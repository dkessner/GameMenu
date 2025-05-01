
import processing.sound.*;

SoundFile sound;
SoundFile sound1;
SoundFile sound2;


//declare a variable to control the STATE of our game
//variables for drawStart
String gameState = "START";
PImage startBackground;
PFont title;
PFont title1;
PFont startButton;
PFont font;

//variables for drawGame
PImage gameBackground;
PImage planetImg;
PImage spaceshipImg;
PImage astroidImg;
PImage astronautImg;
PImage firepowerImg;
//variables for drawEnd
PImage endBackground;

float grid, xOffset, yOffset, xFrame, yFrame, border;

//FOR HIGH SCORE
String [] scores;
int score;
int highScore;

//variables for character
float x, y, vy, vx, ay;
//for the firepower
float fx, fy, fvy;

ArrayList<Obstacle> obstacles;
Obstacle planet;
Obstacle astroid;
Obstacle astronaut;

void setup() {
  sound = new SoundFile(this, "space-sound.mp3");
  sound1 = new SoundFile(this, "slash.mp3");
  sound1.amp(2.5);
  sound2 = new SoundFile(this, "youlose.mp3");
  sound1.amp(3.0);

  sound.play();

  fullScreen();
  //FOR HIGH SCORE
  scores = loadStrings(filename_high_scores);
  highScore = int(scores[0]);
  println(scores);
  textAlign(CENTER);

  //Loading image for my backround
  startBackground = loadImage("startBackground.png");
  startBackground.resize(width, height);
  //loading and creating fonts
  title1 = createFont("Deadfall-Regular.ttf", 90);
  title = createFont("Deadfall-Regular.ttf", 50);
  startButton = loadFont("ToppanBunkyuMidashiGothicStdN-ExtraBold-15.vlw");
  //Loading image for gameState background
  gameBackground = loadImage("gameBackground.png");
  gameBackground.resize(width, height);
  //Loading images for my planets and spaceship
  spaceshipImg = loadImage("spaceship.png");
  spaceshipImg.resize(spaceshipImg.width/3, spaceshipImg.height/3);
  planetImg = loadImage("planet.png");
  planetImg.resize(planetImg.width/6, planetImg.height/6);
  firepowerImg=loadImage("firepower.png");
  firepowerImg.resize(firepowerImg.width/8, firepowerImg.height/8);
  astroidImg=loadImage("astroid.png");
  astroidImg.resize(astroidImg.width/3, astroidImg.height/3);
  astronautImg=loadImage("astronaut.png");
  astronautImg.resize(astronautImg.width/3, astronautImg.height/3);
  //Loading image for my gameEnd background
  endBackground = loadImage("gameStateEnd.png");

  x = width/2;
  y = height-250;
  vy = 0;
  vx=0;
  ay = 0.3;
  fx=width/2;
  fy=0-10;
  fvy=2;

  obstacles = new ArrayList<Obstacle>();
  planet = new Obstacle(width, height/2, -8, planetImg);
  obstacles.add(planet);

  astroid = new Obstacle(width+100, height/2, 0, astroidImg);
  obstacles.add(astroid);

  astronaut = new Obstacle(width+100, height/2, 0, astronautImg);
  obstacles.add(astronaut);
}

void draw() {

  if (!sound.isPlaying()) {
    sound.play();
  }

  //an if statement will control what is shownbased on the gameState variable
  //Every STATE needs a TRANSITION that will lead to the next state
  //The TRANSITION could be a CONDITION based on keyPressed, position, time, score, health etc...
  //The TRANSITION will change the VALUE of the gameState variable
  if (gameState == "START") {
    //draw the start screen
    drawStart();
  } else if (gameState == "GAME") {
    //draw the game
    drawGame();
  } else if (gameState == "END") {
    //draw the end
    drawEnd();
  }
}

//we will further organize by creating FUNCTIONS that control game behavior
//in other words...the functions will represent the game STATES
void drawStart() {


  imageMode(CORNER);
  image(startBackground, 0, 0);

  //Creating title / font
  //writing title
  textFont(title1);
  textAlign(CENTER);
  fill(#B218F0);
  //Writing title
  text("OUT OF THIS WORLD", width/2, (height/2)-100);

  //Creating start button
  //creating box
  rectMode(CENTER);
  fill(#446ED3);
  strokeWeight(2);
  stroke(#FFFFFF);
  rect(width/2, (height/2+50), 500, 46);
  //writing "start"
  textFont(startButton);
  textSize(30);
  textAlign(CENTER);
  fill(#FFFFFF);

  text("Click any blue button to start", width/2, height/2+60);

  //instructions
  fill(#FFFFFF);
  text("Use either JOYSTICK to control the direction of your spaceship", width/2, height/2+300);
  text("Use any of the BLUE buttons to jump over the obstacles!", width/2, height/2+350);
  fill(#FFFFFF);
  text("INSTRUCTIONS: Jump over the obstacles and capture the fire power!", width/2, height/2+200);
}



void drawGame() {

  //draw background
  imageMode(CORNER);
  image(gameBackground, 0, 0);

  fill(#FFFFFF);
  textSize(30);
  text ("SCORE " + score, 100, 80);

  imageMode(CENTER);
  image(spaceshipImg, x, y);

  imageMode(CENTER);
  image(firepowerImg, fx, fy);

  //drawing hopping planet
  y+=vy; //increment y position by y velocity
  vy+=ay; //increment y velocity by y acceleration

  if (y>height-250) {//limit how far character can fall
    y=height-250;
    vy = 0;
  }

  planet.display();
  astroid.display();
  astronaut.display();

  //falling firepower-catch the firepower
  x=x+vx;
  fy=fy+fvy;

  if (dist(fx, fy, x, y)<60) {
    sound1.play();
    fx=int(random(40, width-20));
    fy=0-10;
    fvy=fvy+0.3;
    score++;
  } else if (fy>height) {
    gameState = "END";
  }


  //if the spaceship jumps pass the planet then the astroid comes at the spaceship
  if (planet.x<400) {
    astroid.vx = -8;
    astroid.vx=astroid.vx-0.3;
  }

  if (astroid.x<400) {
    astronaut.vx = -8-0.3;
    astronaut.vx=astronaut.vx-0.3;
  }

  if (astronaut.x<400) {
    planet.vx = -8-0.3;
    planet.vx=planet.vx-0.3;
  }

  //if the obstacle hits the left side, it restarts
  for (Obstacle obstacle : obstacles) {
    if (obstacle.x<0) {
      obstacle.vx=0;
      obstacle.x = width+100;
      obstacle.y = random(400, height-250);
    }

    if (dist(obstacle.x, obstacle.y, x, y)<100) {
      //transition to the "END" state
      gameState = "END";
      sound2.play();
    }
  }
}

void keyPressed() {
  println(keyPressed);
  //the keyPress should ALSO have an if statement based on gameState
  //this way, keys can do different things in different states
  if (gameState == "START") {
    if (key == ' ' || key == ',' || key=='.') {
      gameState = "GAME";
    }
  } else if (gameState == "GAME") {
    if (key == ' ' || key == ',' || key=='.') {
      println("down");
      vy = -10;
    }
    if (key == 'd' || keyCode==RIGHT) {
      //The va variable adds to the a so that it moves
      vx = 10;
    } else if (key == 'a' || keyCode==LEFT) {
      vx = -10;
    }
  } else if (gameState == "END") {
    if (key == ' ' || key == ',' || key=='.') {
      resetGame();
      gameState = "START";
      //call a function here that 'resets' game variables
    }
  }
}

void keyReleased() {
  //keyReleased makes sure that the basket doesn't move forever, when you stop pressing the arrow key, the basket stops
  if (gameState == "GAME") {
    if (key == 'a' || key == 'd' || keyCode==RIGHT || keyCode==LEFT) {
      vx = 0;
    }
  }
}

String filename_high_scores = System.getProperty("user.home") + "/VideoGameCabinetData/HighScore_Out_Of_This_World.txt";

void drawEnd() {
  background(#000000);

  //if (keyCode == ENTER) {
  if (score > int(scores[0])) {
    println("New High Score!");
    highScore = score;
    scores[0] = str(score);
    saveStrings(filename_high_scores, scores);
    //}
  }

  fill(#FFFFFF);
  textAlign(CENTER);
  textSize(40);
  text("GAME OVER", width/2, height/2-100);
  textSize(30);
  text("Click any BLUE button to TRY AGAIN  ", width/2, (height/2));

  fill(#AAEFFF);
  noStroke();
  rectMode(CENTER);
  rect(width/2, (height/2+height/4), 2*(width/6), (width/5), 20);

  fill(#0C4EF0);
  textSize(20);
  text("YOUR SCORE: " + score, width/2, height/2+160);
  fill(#FFFFFF);

  textSize(30);
  fill(#EAA009);
  text("HIGH SCORE:  " + highScore, width/2, height/2+220);

  textSize(20);
  fill(#FFFFFF);
  text("You are a...", width/2, height/2+270);
  if (score<=5) {
    fill(#0C4EF0);
    textSize(30);
    text("BEGINNER", width/2-145, height/2+310);
    textSize(20);
    fill(#FFFFFF);
    text("AMATEUR", width/2, height/2+310);
    text("DEMON", width/2+115, height/2+310);
  } else if (6<=score && score<=15) {
    fill(#0C4EF0);
    textSize(30);
    text("AMATEUR", width/2, height/2+310);
    textSize(20);
    fill(#FFFFFF);
    text("BEGINNER", width/2-145, height/2+310);
    text("DEMON", width/2+125, height/2+310);
  } else if (16<=score) {
    fill(#F50A0A);
    textSize(30);
    text("DEMON", width/2+125, height/2+305);
    textSize(20);
    fill(#FFFFFF);
    text("BEGINNER", width/2-145, height/2+310);
    text("AMATEUR", width/2, height/2+310);
  }
}
void resetGame() {
  //this is where you would re-assign variables
  planet.display();
  planet.x=width+100;
  astroid.display();
  astroid.x=width+100;
  astronaut.display();
  astronaut.x=width+100;
  //planet.x = width;
  //planet.y = height/2;
  //astroid.vx = 8;
  //astroid.x = width;
  //astroid.y = height/2;
  x = width/2;
  y = height-250;
  vy = 0;
  vx=0;
  ay = 0.3;
  fx=width/2;
  fy=0;
  fvy=2;
  score=0;
}
