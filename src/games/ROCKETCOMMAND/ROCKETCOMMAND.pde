//By Andrew Witman, Summer 2016. Based on the arcade game Missile Command

enum Screen {
  SPLASH, START, GAME, RESET, END
}

enum Type {
  MISSILE, SPLITTER, SMARTBOMB
}

Screen myScreen;
Control myControl;
Cursor myCursor;
Scene myScene;
Sound mySound;
HISCORE myHISCORE;

int bgColor = 0;
float xF;
float yF;


void setup() {
  //size(500,300);
  fullScreen();
  noCursor();
  xF = width/100;
  yF = height/60;

  myControl = new Control();
  myCursor = new Cursor();
  myScene = new Scene();
  mySound = new Sound(this);
  myScreen = Screen.SPLASH;
  myHISCORE = new HISCORE();
}

void draw() {

  switch(myScreen) {
  case START:
    startScreen();
    break;
  case GAME:    
    gameScreen();
    break;
  case RESET:
    resetScreen();
    break;
  case END:
    endScreen();
    break;
  case SPLASH:
    splashScreen();
    break;
  }
}

void keyPressed() {
  switch(myScreen) {
  case GAME:
    myCursor.cursorKeyPressed();
    break;
  case END:
    myHISCORE.keyPressedHISCORE();
  }
}

void keyReleased() {
  switch(myScreen) {
  case START:
    if (keyCode == ENTER || keyCode == RETURN) {
      mySound.startTone.play();
      resetGame();
      myScreen = Screen.GAME;
    }
    break;
  case GAME:
    myCursor.cursorKeyReleased();
    break;

  case RESET:
    if (keyCode == ENTER || keyCode == RETURN) {
      mySound.startTone.play();
      resetRound();
      myScreen = Screen.GAME;
    }
    break;


  case END:
    myHISCORE.keyReleasedHISCORE();
    if (keyCode == ENTER || keyCode == RETURN) {
      mySound.startTone.play();
      resetGame();
      myScreen = Screen.START;
    }
    break;
  }
}

void startScreen() {
  //println("Start");
  background(bgColor, 0, 0);
  bgColor-=2;
  bgColor = constrain(bgColor, 0, 255);
  myControl.missilesLaunched = 0;
  myControl.missileCount = 10;
  myControl.missileAttack();
  myControl.checkAirborneCollisions(myCursor);
  myControl.checkGroundCollisions(myCursor);
  myControl.drawCities();
  myCursor.leftBase.drawBase();
  myCursor.centerBase.drawBase();
  myCursor.rightBase.drawBase();
  myHISCORE.topFive();
  myScene.drawStart();
}

void gameScreen() {
  background(bgColor, 0, 0);
  bgColor-=2;
  bgColor = constrain(bgColor, 0, 255);
  myCursor.updateCursor();
  myCursor.drawCursor();
  myControl.missileAttack();
  myControl.checkAirborneCollisions(myCursor);
  myControl.checkGroundCollisions(myCursor);
  myControl.drawCities();
  //println("missileCount: " + myControl.missileCount);
  myScene.drawGame(myCursor);
  if (myControl.roundEnd()) {
    if (myControl.citiesRemain()) {
      myScreen = Screen.RESET;
    } else {
      mySound.endGame.play();
      if (myHISCORE.checkScore(myCursor.score)) {
        myHISCORE.newScore = true;
        myHISCORE.findRank(myCursor.score);
        myHISCORE.shiftScores(myHISCORE.rank);
      }
      myScreen = Screen.END;
    }
  }
}

void splashScreen() {
  myScene.drawSplash();
  myScene.fade();
  if (myScene.fadeFill == 0 && millis()>3000) {
    myScene.fadeInterval *= -1;
  }
  if (millis() > 4000) {
    myScene.sceneVariableReset();
    mySound.startTone.play();
    myScreen = Screen.START;
  }
}

void resetScreen() {
  background(0);
  myControl.drawCities();
  myCursor.drawCursor();
  myScene.drawGame(myCursor);
  myScene.drawRoundEnd(myControl);
}

void endScreen() {
  background(0);
  myControl.drawCities();
  myCursor.drawCursor();
  myScene.drawGame(myCursor);
  if (myHISCORE.newScore) {
    myHISCORE.updateScores();
    myHISCORE.drawScores();
  } else {
    myScene.drawEnd();
  }
}

void resetGame() {
  bgColor = 0;
  myCursor.removeAllRockets();
  myCursor.resetCursorVariables();
  myControl.removeAllMissiles();
  myControl.resetControlVariables();
  myScene.sceneVariableReset();
}

void resetRound() {
  bgColor = 0;
  myCursor.removeAllRockets();
  myControl.removeAllMissiles();
  myScene.sceneVariableReset();
  myControl.drawCities();
  myScene.drawGame(myCursor);
  myControl.resetRound(myCursor);
}