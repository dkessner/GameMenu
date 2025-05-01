import processing.sound.*;

//Works well! -Mr. W

//first we make all our variables
//we need a taco, pizza, background, basket, a score, and two buttons

PImage taco;
PImage pizza;
PImage background;
PImage basket;
PFont title;

int score;

float x, y, vy, ba, bb, va, px, py, pv;

String gameState = "START";

//now lets add our soundfile
SoundFile tacos;
SoundFile yay;

//Now we set our processing to active mode

void setup() {
  //lets set up all of our loadImages
  //and resize where needed
  fullScreen();
  taco = loadImage("taco.png");
  taco.resize(taco.width/2, taco.height/2);
  pizza = loadImage("pizza.png");
  pizza.resize(pizza.width/3, pizza.height/3);
  background = loadImage("background.jpg");
  background.resize(width, height);
  println(background.width, background.height);
  basket = loadImage("basket.png");
  basket.resize(basket.width/2, basket.height/2);
  println(background.width, background.height);
  
  //now let's declare our sounds
  tacos = new SoundFile(this, "tacos.mp3");
  yay = new SoundFile(this, "yay.mp3");
  
  // scores = loadStrings("scoreList.txt");
 // highScore = int(scores[0]);
  //println(scores);
}


void draw() {
  //this ensures when the gamestate is START, GAME, or END, the screen shows accordingly
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
  //lets draw our start screen, with text 
  title = loadFont("ArimaKoshi-Bold-20.vlw");
  textFont(title);
  textAlign(CENTER);
  background(#B5D3D6);
  fill(#1C4F83);
  textSize(40);
  text("It's Raining Tacos!", width/2, height/5);
  textSize(25);
  text("How to play:", width/2, height/3.5);
  textSize(15);
  text("Use arrows to move the basket side to side", width/2, height/3);
  text("to catch the raining tacos. The score will increase", width/2, height/2.8 );
  text("when you catch a taco and the speed will increase", width/2, height/2.6 );
  text("the longer you play. Make sure to avoid the pizzas! Have fun!", width/2, height/2.4);
  textSize(25);
  text("PRESS SPACE TO BEGIN", width/2, height/2);
  
//  x = width/2;
 // y = height/2;
}


void drawGame() {
  //lets make our game screen with all the images
  imageMode(CORNER);
  image(background, 0, 0);
  imageMode(CENTER);
  image(basket, ba, bb);
  image(pizza, px, py);
  image(taco, x, y);
  //now lets make a score keeper, using the score variable
  textSize(20);
  text("SCORE = " + score, width/12, height/10);
  //Now I'll set up the moving variables
  ba = ba+va;
  y = y+vy;
  py = py+pv;
  //if taco lands in basket, reset taco and pizza to random positions and increase velocity of each
  //additionally, update score and play the success sound.
  if (dist(x, y, ba, bb)<100) {
    x=int(random(20, width));
    score+=1;
    y = 0;
    vy=vy+0.6;
    px=int(random(20,width));
    py = 0;
    pv = pv+0.6;
    yay.play();
    //if taco hits ground without basket catching it, game over
  } else if (y>height*0.95) {
    tacos.pause();
    gameState = "END";
    //if pizza lands in basket, game over
  } else if (dist(px,py,ba,bb)<25) {
    tacos.pause();
    gameState = "END";
  }
  
}

void keyPressed() {
  //lets activate is so that when the space bar is pressed, the game begins
  if (gameState=="START") {
    if (key == ' ') {
      tacos.play();
      tacos.jump(0.00);
      gameState="GAME";
      println("GAME");
      //declare starting values
      ba=width*0.75;
      bb=height*0.9;
      vy=2;
      pv=2;
      x=width/3;
      y=0;
      px=width/2;
      py=0;
    }
  }
  //This makes the basket move from left to right to catch the tacos
  if (gameState == "GAME") {
    if (keyCode == RIGHT) {
      //The va variable represents velocity of basket
      va = 5;
    } else if (keyCode == LEFT) {
      va = -5;
    } else if (gameState == "GAME") {
    } 
  }else if (gameState == "END") {
      //if the space button is pressed at the end of the game, the game will go back to the start or game screen
      if (key == ' ') {
        gameState="START";
        resetGame();
      }
    }
}

void keyReleased() {
  //keyReleased makes sure that the basket doesn't move forever, when you stop pressing the arrow key, the basket stops
  if (gameState == "GAME") {
    if (keyCode == LEFT || keyCode == RIGHT) {
      va = 0;
    }
  }
}

void drawEnd() {
  //lets make our end screen
  background(#B3CBB8);
  title = loadFont("ArimaKoshi-Bold-20.vlw");
  textFont(title);
  textSize(54);
  fill(#47644E);
  textAlign(CENTER);
  text("GAME OVER!", width/2, height/3.8);
  text("FINAL SCORE: " + score, width/2, height/2.8);
  
  text("HIT SPACE TO PLAY AGAIN", width/2, height/2);
 
  imageMode(CORNER);
  x=240;
  y=240;
}



void resetGame() {
  //put all values back to the beginning
  x=0;
  score = 0;
  y=0;
  ba=width*0.75;
  bb=height*0.9;;
  va= 0;
  vy= 0;
  px = 0;
  py = 0;

}

//HAVE FUN! i hope you enjoy my game 
