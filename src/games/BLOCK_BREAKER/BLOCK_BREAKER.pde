//we are testing git
import processing.sound.*;

Control myControl;
Paddle myPaddle;
Ball myBall;
UI myUI;
HISCORE myHISCORE;

int scene = 6;
int score = 0;
int blockR = 255;
int blockG = 0;
int blockB = 0;

float xF;
float yF;

color bg = color(19, 134, 134);
color textColor = color(0, 217, 0);
color ballColor = color(255, 255, 0);
color paddleColor = color(45, 29, 59);

SoundFile wallBounce;
SoundFile paddleBounce;
SoundFile startGame;
SoundFile endGame;
SoundFile hit;

void setup() {
  //size(400,300);
  fullScreen();

  xF = width/100;
  yF = height/100;
  noCursor();
  background(0);
  noStroke();
  myControl = new Control();
  myPaddle = new Paddle();
  myBall = new Ball();
  myUI = new UI();
  myHISCORE = new HISCORE();

  myControl.createBlocks(myControl.blockNumber);

  paddleBounce = new SoundFile(this, "lowblip.wav");
  paddleBounce.amp(0.5);
  hit = new SoundFile(this, "hit.wav");
  startGame = new SoundFile(this, "startTone.wav");
  endGame = new SoundFile(this, "endGame.wav");
  wallBounce = new SoundFile(this, "highblip.wav");
  wallBounce.amp(0.5);

}


void draw() {

  switch(scene) {

    //variable reset for start screen
  case 0:
    myBall.y = height/2;
    myBall.offScreen = false;
    myPaddle.start = true;
    myControl.removeAllBlocks();
    myControl.blockNumber = 10;
    myControl.createBlocks(myControl.blockNumber);
    myUI.fadeReset();
    startGame.play();
    scene = 1;
    break;
    //start screen
  case 1:
    myUI.drawStart();
    myPaddle.autoPlay(myBall);
    myPaddle.drawPaddle();
    myBall.moveBall(myPaddle);
    myBall.drawBall();
    myBall.checkWallCollision();
    myBall.checkPaddleCollision(myPaddle); 
    myControl.removeBlocks(myBall);
    myControl.drawBlocks();
    myHISCORE.topFive();
    if (keyPressed) {
      if (key == ENTER || key == RETURN) {
        scene = 2;
      }
    }
    break;
    //variable reset for gameplay
  case 2:
    score = 0;
    myBall.offScreen = false;
    myPaddle.start = false;
    myPaddle.right = false;
    myPaddle.left = false;
    myControl.blockNumber = 10;
    myControl.removeAllBlocks();
    println(myControl.blocks.size());
    myControl.createBlocks(myControl.blockNumber);
    myUI.fadeReset();
    scene = 3;
    //gameplay
  case 3:
    background(bg);
    noStroke();
    myPaddle.movePaddle();
    myPaddle.drawPaddle();
    myBall.moveBall(myPaddle);
    myBall.drawBall();
    myBall.checkWallCollision();
    myBall.checkPaddleCollision(myPaddle); 
    myControl.removeBlocks(myBall);
    myControl.resetCheck(myPaddle);
    myControl.drawBlocks();
    myUI.drawScore(score);
    if (myBall.offScreen) {
      if (myHISCORE.checkScore(score)) {
        myHISCORE.newScore = true;
        myHISCORE.findRank(score);
        myHISCORE.shiftScores(myHISCORE.rank);
        scene = 5;
      } else {
        myUI.drawEnd();
        myUI.wait(3000, 0);
      }
    }
    break;
  case 5:
    background(bg);
    myHISCORE.updateScores();
    myHISCORE.drawScores();
    break;

  case 6:
    myUI.drawSplash();
    myUI.fade();
    if (myUI.fadeFill == 0 && millis()>3000) {
      myUI.fadeInterval *= -1;
    }
    if (millis() > 4000) {
      scene = 0;
    }
    break;
  }
}

void keyPressed() {
  switch(scene) {
  case 5:
    myHISCORE.keyPressedHISCORE();
    break;
  }
}

void keyReleased() {
  switch(scene) {
  case 5:
    myHISCORE.keyReleasedHISCORE();
    break;
  }
}