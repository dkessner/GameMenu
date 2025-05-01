import processing.sound.*;

SoundFile sound;

//I will declare a variable to control the state of my Skier game
String gameState = "START";

//variables for skier position and velocity
float x, y, vy, vx;

//declaring variables for trees
int treeX, treeY;


//setting the score to 0
int score = 0;

//declaring PImage objects to store my image
PImage startScreen;
PImage skierImg;
PImage backgroundImg;
PImage treeImg;
PImage endScreen;

//declaring a font
PFont title;
PFont points;
PFont instructions;

ArrayList<Tree> trees;
Tree obstacle;


void setup() {
  fullScreen();
  //loading images
  startScreen = loadImage("snowybackground1.png");
  startScreen.resize(startScreen.width + 1000, startScreen.height + 1000);
  skierImg = loadImage("skieravatar.png");
  //resize
  skierImg.resize(skierImg.width/3, skierImg.height/3);

  backgroundImg = loadImage("winterscene.png");
  backgroundImg.resize(width, height);

  treeImg = loadImage("snowytree.png");
  treeImg.resize(backgroundImg.width/3, treeImg.height/2);

  //Loading image for end screen
  endScreen = loadImage("endscreen.png");

  sound = new SoundFile(this, "carolbellsgame.mp3");
  sound.play();

  //setting character position
  x = width/2;
  y = height*0.45;

  trees = new ArrayList<Tree>();
  Tree t = new Tree(random(100, width - 100), height + 50, -20, treeImg);
  trees.add(t);
}


void draw() {
  if (!sound.isPlaying()) {
    sound.play();
  }

  if (gameState == "START") {
    drawStart();
  } else if (gameState == "GAME") {
    drawGame();
  } else if (gameState == "END") {
    drawEnd();
  }
}

void drawStart() {
  //creating start screen (welcome state) + assigning fonts
  imageMode(CORNER);
  image(startScreen, 0, 0);
  textAlign(CENTER);
  fill(#EBEBF7);
  //creating title
  title = createFont("Moderniz.otf", 200);
  textFont(title);
  text("SUMMIT", width/2, height/2);
  fill(255, 255, 255);
  instructions = loadFont("Arial-ItalicMT-48.vlw");
  textFont(instructions);
  textSize(50);
  text("HIT ENTER TO START", width/2, height - 30);
}

void drawGame() {
  imageMode(CORNER);
  image(backgroundImg, 0, 0);

  for (Tree t : trees) {
    t.update();
    t.display();

    //resetting tree to bottom if tree passes off screen
    if (t.y < -50) {
      score++;
      t.y = height + random(100, 300);
      t.x = random(100, width - 100);
    }

    //skier and tree collision detection
    if (x + 50 > t.x - 50 && x - 50 < t.x + 50 && y + 75 > t.y - 100 &&  y - 75 < t.y + 100) {
      gameState = "END";
    }
  }

  x += vx;


  //draw skier
  image(skierImg, x, y);

  //draw score
  imageMode(CORNER);
  fill(0);
  points = createFont("Gameplay1.ttf", 50);
  textFont(points);
  textSize(20);
  text("SCORE: " + score, width/10, height/10);
}


void drawEnd() {
  //Creating the end screen
  background(0);
  textAlign(CENTER);
  textSize(50);
  fill(255);
  text("GAME OVER", width/2, height/2);
  textFont(instructions);
  textSize(25);
  text("PRESS SPACE TO PLAY AGAIN", width/2, height - 20);
  text("YOUR SCORE: " + score, width/2, height - 60);
}

void keyPressed() {
  if (gameState == "START") {
    //enter will transition to the game state
    if (keyCode == ENTER) {
      gameState = "GAME";
    }
  }

  if (gameState == "GAME") {
    //left arrow moves skier to the left, right arrow to the right
    if (keyCode == LEFT) {
      vx = -15;
    } else if (keyCode == RIGHT) {
      vx = 15;
    }
  }

  if (gameState == "END") {
    //calling a function that resets game variables
    if (key == ' ') {
      resetGame();
      gameState = "START";
    }
  }
}

void keyReleased() {
  if (gameState == "GAME") {
    if (keyCode == LEFT || keyCode == RIGHT) {
      vx = 0;
    }
  }
}


void resetGame() {
  //assigning my variables to their starting values
  x = width/2;
  y = height*0.45;
  treeX = width + 1000;
  treeY = height - 80;
  score = 0;
  //trees go below the screen
  for (Tree t : trees) {
    t.y = height + random(100, 300);
    t.x = random(100, width - 100);
  }
}
