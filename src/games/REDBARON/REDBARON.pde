//created by Andrew Witman, Fall 2016
enum Scene {
  START, GAME, RESET, END
}

float xF, yF;
float globalTime, roundDelay, displayDelay;

color bgColor = #94E1FC;

boolean display;

Scene myScene;
Plane playerOne;
Plane playerTwo;
Sound mySound;
HUD myHUD;

void setup() {
  //size(800, 600, P3D);
  //ortho();
  fullScreen(P3D);
  noCursor();
  xF = width/60;
  yF = height/40;

  myScene = Scene.START;
  playerOne = new Plane(width/2, height/2, 0, 0, true, 38, 40, 39, 37, 32, 44, color(255, 0, 0));
  playerTwo = new Plane(width/2, height/2, PI, PI, false, 87, 83, 68, 65, 49, 50, color(50, 100, 200));
  mySound = new Sound(this);
  myHUD = new HUD(playerOne, playerTwo);

  globalTime = millis();
  roundDelay = 4000;
  displayDelay = 1000;
  display = true;
  
  //mySound.music.play();
  //mySound.music.loop();
}

void draw() {
  println(myScene);
  switch(myScene) {
  case START:
    background(bgColor);
    myHUD.drawStart();
    playerOne.updatePlane();
    playerTwo.updatePlane();
    playerOne.throttle();
    playerTwo.throttle();
    playerOne.displayPlane(playerTwo);
    //playerTwo.displayPlane(playerOne);
    break;
  case GAME:
    background(bgColor);
    playerOne.updatePlane();
    playerTwo.updatePlane();
    playerOne.displayPlane(playerTwo);
    playerTwo.displayPlane(playerOne);
    playerOne.dealDamage(playerTwo);
    playerTwo.dealDamage(playerOne);
    playerOne.throttle();
    playerTwo.throttle();
    playerOne.planeCheck(playerTwo);
    playerTwo.planeCheck(playerOne);
    myHUD.drawHUD();
    if (playerOne.winCount == 5 || playerTwo.winCount == 5) {
      mySound.lowTone.play();
      myScene = Scene.END;
    }
    break;
  case RESET:
    background(bgColor);
    playerOne.updatePlane();
    playerTwo.updatePlane();
    if (globalTime + displayDelay < millis()) {
      display = !display;
      displayDelay+=1000;
      myHUD.timer--;
      mySound.lowTone.play();
    }

    playerOne.displayPlane(playerTwo);
    playerTwo.displayPlane(playerOne);

    playerOne.throttle();
    playerTwo.throttle();
    myHUD.drawHUD();
    myHUD.drawRound();
    if (globalTime+roundDelay<millis()) {
      myScene = Scene.GAME;
      displayDelay = 1000;
      myHUD.timer = 4;
      mySound.highTone.play();
    }
    break;
  case END:
    background(bgColor);
    playerOne.updatePlane();
    playerTwo.updatePlane();

    playerOne.displayPlane(playerTwo);
    playerTwo.displayPlane(playerOne);

    playerOne.throttle();
    playerTwo.throttle();
    myHUD.drawEnd();
    break;
  }
}

void keyPressed() {
  switch(myScene) {
  case START:
    playerOne.planeKeyPressed();
    playerTwo.planeKeyPressed();
    if (key == ENTER || key==RETURN) {
      globalTime = millis();
      myScene = Scene.RESET;
      playerOne.resetPlane(width/2, height/2, 0, 0, true);
      playerTwo.resetPlane(width/2, height/2, PI, PI, false);
      //mySound.music.stop();
    }
    break;
  case GAME:
    playerOne.planeKeyPressed();
    playerTwo.planeKeyPressed();
    break;
  case RESET:
    playerOne.planeKeyPressed();
    playerTwo.planeKeyPressed();
    break;
  }
}

void keyReleased() {
  switch(myScene) {
  case START:
    playerOne.planeKeyReleased();
    playerTwo.planeKeyReleased();
  case GAME:
    playerOne.planeKeyReleased();
    playerTwo.planeKeyReleased();
    break;
  case RESET:
    playerOne.planeKeyReleased();
    playerTwo.planeKeyReleased();
    break;
  case END:
    if (key == ENTER || key==RETURN) {
      playerOne.resetPlane(width/2, height/2, 0, 0, true);
      playerTwo.resetPlane(width/2, height/2, PI, PI, false);
      myScene = Scene.START;
      //mySound.music.play();
    }
    break;
  }
}