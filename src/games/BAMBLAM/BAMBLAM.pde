//Created by Andrew Witman, Summer 2016

enum Scene {
  START, GAME, END
}

float xF;
float yF;
int ammoCount = 0;
int score = 0;

color bg = #AFA3AF;
color fontColor = #43F1FF;
color ammoColor = #18D8BD;
color enemyColor = #B240FF;

Scene myScene;
Player myPlayer;
Control myControl;
GUI myGUI;
Sound mySound;
HISCORE myHISCORE;

void setup() {
  fullScreen();
  //size(1000, 600);
  noCursor();
  xF = width/100;
  yF = height/60;

  myScene = Scene.START;
  myPlayer = new Player();
  myControl = new Control();
  myGUI = new GUI();
  mySound = new Sound(this);
  mySound.gameMusic.loop();
  myHISCORE = new HISCORE();
}

void draw() {
  switch(myScene) {
  case START:
    background(bg);

    myGUI.drawStart();
    myControl.startScene();
    myHISCORE.topFive();

    break;
  case GAME:
    gameScene();

    break;
  case END:
    endScene();
    break;
  }
}

void keyPressed() {
  switch(myScene) {
  case START:
    if (keyCode == ENTER || keyCode == RETURN) {
      myControl.clearGame(myPlayer);
      myScene = Scene.GAME;
    }
    break;
  case GAME:
    myPlayer.playerKeyPressed();
    break;
  case END:

    myHISCORE.keyPressedHISCORE();

    break;
  }
}

void keyReleased() {
  switch(myScene) {
  case GAME:
    myPlayer.playerKeyReleased();
    break;
  case END:

    myHISCORE.keyReleasedHISCORE();

    if (keyCode == ENTER || keyCode == RETURN) {
      mySound.endMusic.stop();
      mySound.gameMusic.loop();
      myScene = Scene.START;
    }

    break;
  }
}

void gameScene() {
  background(bg);
  myPlayer.updatePlayer();
  myGUI.drawRect();
  myPlayer.drawPlayerBack();
  myControl.masterControl();
  myPlayer.drawPlayer();
  myGUI.drawGame();
}

void endScene() {
  background(bg);
  if (myHISCORE.newScore) {
    myHISCORE.updateScores();
    myHISCORE.drawScores();
  } else {
    myGUI.drawEnd();
  }
}