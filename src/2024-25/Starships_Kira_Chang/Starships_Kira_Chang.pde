import processing.sound.*;

SoundFile sound;
Ship ship;
ArrayList<Rock> rocks;
ArrayList <Pew> pews;
String gameState = "START";
PVector gravity = new PVector(0, 0.1);
int score;
PImage space;

void setup() {
  fullScreen();
  ship = new Ship();
  pews = new ArrayList<Pew>();
  rocks = new ArrayList<Rock>();

  sound = new SoundFile(this, "pewpew.mp3");
  for (int i = 0; i < 40; i++) {
    Rock r = new Rock();
    rocks.add(r);
  }
  space = loadImage("space.png");
  space.resize(width, height);
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

void keyPressed() {
  if (gameState == "START") {
    if (keyCode == ENTER) {
      gameState = "GAME";
    }
  }
  if (gameState == "GAME") {
    ship.shipKeyPressed();
    if (key == ' ') {
      sound.play();
      Pew p = new Pew(ship.position.x);
      pews.add(p);
    }
  }
  if (gameState == "END") {
    if (key == '.') {
      gameState = "START";
    }
  }
}

void drawStart() {
  background(0);
  image(space, 0, 0);
  textSize(25);
  textAlign(CENTER);
  text("Hit enter to play", width/2, height/2);
  text("Instructions: Use arrow keys/left joystick to control ship", width/2, height/3);
  text("Use the space bar/left button to shoot", width/2, height/2.7);
  text("Good luck!", width/2, height/2.4);
}

void drawGame() {
  background(0);
  image(space, 0, 0);
  textSize(25);
  text("SCORE =" + score, width/6, height/6);
  ship.update();
  ship.display();
  ship.checkEdgesBounce();

  for (Pew p : pews) {
    p.display();
    p.update();
    for (int i = rocks.size()-1; i >= 0; i--) {
      //retrieve the particle at the index i
      Rock checkedRock = rocks.get(i);
      if (p.checkRock(checkedRock)) {
        rocks.remove(checkedRock);
        score += 1;
      }
    }
  }
  for (int i = pews.size()-1; i >= 0; i--) {
    //retrieve the particle at the index i
    Pew checkedPew = pews.get(i);
    if (checkedPew.dead) {
      pews.remove(checkedPew);
    }
  }
  for (Rock r : rocks) {
    r.update();
    // r.applyGravity(gravity);
    r.display();
    // r.accelerateRandomly();
    r.checkEdgesWrap();
    //r.time();

    if (ship.checkShip(r)) {
      gameState = "END";
    }
  }
  int size = rocks.size();
  if (size < 1) {
    gameState = "END";
  }
}
void resetGame() {
  rocks = new ArrayList<Rock>();
  for (int i = 0; i < 40; i++) {
    Rock r = new Rock();
    rocks.add(r);
  }
  ship = new Ship();
  score = 0;
  pews = new ArrayList<Pew>();
}

void drawEnd() {
  background(0);
  image(space, 0, 0);
  textSize(25);
  textAlign(CENTER);
  text("Hit left button/period to play again", width/2, height/2);
  text("GAME OVER!", width/2, height/3);
  resetGame();
}
