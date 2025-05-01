float barWidth = 200;
float barHeight = 50;
PVector barPos = new PVector(200, 200);
PVector barVel = new PVector (0, 0);
PImage mona;
PVector mSize;
PImage brush;
PImage scream;
PImage louis; 
PImage log;
PFont font1, font2;
ball b;

int scene = 0;

void setup() {
  fullScreen();
  mona = loadImage("mona.jpg");
  brush = loadImage("brush.png");
  log = loadImage("log.png");
  scream = loadImage("scream.jpg");
  louis = loadImage("louis.jpg");
  mSize = new PVector(mona.width*height/mona.height, height);
  b = new ball();
  font1 = createFont("DoodleGum.ttf", 40);
  font2 = createFont("MelonCamp.otf", 20);
}

void draw() {
  if (scene == 0) {
    background(0);
    fill(255);
    textFont(font2);
    textSize(20);
    text("Welcome to the art museum! You are a master art defacer tasked with painting a mustache on a series of famous paintings. Use the left joystick \nto move the log and hit the brush. Hold the left blue button to paint. Use the right joystick to change colors. Have fun!",
      50, 100);
    textFont(font1);
    textAlign(CENTER);
    text("Hit any button to start", width/2, height/2);
    textAlign(CORNER);
  } else if (scene == 1) {
    background(255);
    imageMode(CORNER);
    image(mona, 0, 0, mSize.x, mSize.y);

    b.run();
    bar();

    //titles
    textFont(font1);
    textSize(20);
    fill(0);
    text("Draw a mustache on \n the Mona Lisa!", mSize.x+50, 50);
    textFont(font2);
    textSize(15);
    text("Use the left joystick to move the log and hit the brush. Hold the left blue button to paint. \nUse the right joystick to change colors. Have fun!",
      mSize.x + 50, 150);
  } else if (scene == 2) {
    background(255);
    imageMode(CORNER);
    image(scream, 0, 0, mSize.x, mSize.y);
    b.run();
    bar();
    //titles
    textFont(font1);
    textSize(20);
    fill(0);
    text("Draw a mustache on \n The Scream!", mSize.x+50, 50);
    textFont(font2);
    textSize(15);
    text("Use the left joystick to move the log and hit the brush. Hold the left blue button to paint. \nUse the right joystick to change colors. Have fun!",
      mSize.x + 50, 150);
  } else if (scene == 3) {
    background(255);
    imageMode(CORNER);
    image(louis, 0, 0, mSize.x, mSize.y);
    b.run();
    bar();
    //titles
    textFont(font1);
    textSize(20);
    fill(0);
    text("Draw a mustache on \n King Louis!", mSize.x+50, 50);
    textFont(font2);
    textSize(15);
    text("Use the left joystick to move the log and hit the brush. Hold the left blue button to paint. \nUse the right joystick to change colors. Have fun!",
      mSize.x + 50, 150);
  } else {
    background(0);
    textFont(font1);
    fill(255);
    textAlign(CENTER);
    textSize(20);
    text("Congrats! You've finished the game.", width/2, height/2);
    textAlign(CORNER);
  }
}
void keyPressed() {
  if (scene == 0) {
    scene ++;
  } else {
    b.keyPressed();
    if (keyCode == RIGHT) {
      barVel.x = 15;
    } else if (keyCode == LEFT) {
      barVel.x = -15;
    } else if (keyCode == UP) {
      barVel.y = -15;
    } else if (keyCode == DOWN) {
      barVel.y = 15;
    }
  }
}
void keyReleased() {
  b.keyReleased();
  barVel.x = 0;
  barVel.y = 0;
}

void bar() {
  //bar
  barPos.x += barVel.x;
  barPos.y +=barVel.y;
  if (barPos.x > mSize.x) {
    barPos.x = mSize.x;
    barVel.x = 0;
  } else if (barPos.x <0) {
    barPos.x = 0;
    barVel.x = 0;
  }
  imageMode(CORNER);
  image(log, barPos.x, barPos.y, barWidth, barHeight);
}
