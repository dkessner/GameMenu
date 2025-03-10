ArrayList <Platform> platforms;

float x; 
float y;
float mY;
float xSpeed;
float ySpeed;
float xVel;
int score;
int random;
float yVel;
PFont coolFont;
boolean hit;
int go;


void setup() {
  size (750, 750); 
  x= width/2;
  y= height/2;
  mY= y;
  xSpeed= 0;
  ySpeed= 1;
  xVel=0;
  yVel=0;
  coolFont = loadFont("Serif-48.vlw");
  hit = false;

  platforms = new ArrayList<Platform>();

  for (int i = 0; i < 20; i++) {
    Platform p = new Platform(random(0, width), i*height/20, 9);
    platforms.add(p);
  }
}

// yVel (positive) moves platforms down. (negative #) moves the platform up

void drawStart() {
  background (211, 53, 82);
  textFont(coolFont, 35);
  fill (0, 102, 153);
  textFont(coolFont, 35);
  text("Press here to play", width/2, height/2);
}

void drawGame() {
  if (go == 1) {
    background (160, 222, 255);
    for (Platform p : platforms) {
      p.displayPlatforms();
    }

    rectMode (CORNER);
    updateMan ();
    checkCollision ();
    drawMan (x, mY);
    x=x+xVel;
    y=y+yVel;
  } else if (go ==2) {
    drawEnd();
  }
  if (mY>750) {
    println ("Julia");
    go=2;
  }
}

void drawEnd() {
  background (211, 53, 82);
  textFont(coolFont, 35);
  fill (0, 102, 153);
  textFont(coolFont, 35);
  text("GAME OVER", 100, 200);
}

void draw () {
  println (go);
  if (go == 0) {
    drawStart();
  } else if (go == 1) {
    drawGame();
  } else if (go == 2) {
    drawEnd();
  }
}



void checkCollision() {
  for (Platform p : platforms) {
    if (x > p.x && x< p.x +40 && mY > p.y && mY< p.y+ 10)
    {
      if (mY > height/2 && ySpeed> 1) {
        ySpeed = -7;
        hit = true;
      }
    }
  }
}

class Platform { 
  float x, y, w, yVel;
  int c;

  Platform(float tempX, float tempY, float tempYVel) {
    x=tempX;
    y=tempY;
    yVel=tempYVel;
    c=color(random(255), random(255), random(255));
  }
  void displayPlatforms() {

    rect (x, y, 50, 10);
    if (mY<height/2) { 
      y=y+yVel;
    }
    println("y position: " + + y);
    if (y > height) {
      y=0;
      x=random (100, 600);
    }
    //rect(width/4,height-200,50,10)
  }
}