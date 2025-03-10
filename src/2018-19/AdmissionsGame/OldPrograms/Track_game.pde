//
// Track_game
//

// preload directives for processing.js
/* @pjs preload="data/TrackField.jpg"; */


int trackState = 0;
int trackScore = 0;

boolean visible = true;

boolean trackTiming;
float trackClock;

PImage img;

int currentX;
float xPerson = 50;   // position
float yPerson = 500;
float vyPerson = 5;// velocity
float vxPerson = 0;
float ayPerson = 1; // acceleration


float xRect = random(650, 800); //x val of position of rectangles
float vxRect = -10; //come back to this
float wRect = 35; //width hurdle

float yRect2 = 400; //y val of position of rectangle

float hRect2 = 50;


void trackSetup() {
  
  img = loadImage("data/TrackField.jpg");
  img.resize(width, height);
}


void trackDraw() {
   println(trackTiming);
   println(trackState);
   if (trackTiming) {
     if (millis() - trackClock >= 3000)
       trackState = 0;
       gameState = 40;
       trackTiming = false;
   }
  
   if (trackState == 0)
     drawStart();
   else if (trackState == 1)
     drawGame();
   else {
     drawEnd();
     if (trackTiming == false) {
       trackClock = millis();
       trackTiming = true;}
   }
}

void drawStart() {
  background(0);
  fill(255);
  textSize(30);
  text("Press any key to start", 350, 300);
  text("Press spacebar to jump", 335, 350);
}


void drawEnd() {
  background(0);
  fill(255);
  text("The end", 450, 300);
  text("Returning to campus...", 325, 350);
}

void drawGame() {
  background(0);
  image(img, 0, 0);
  fill(#0B891F); //ground
  stroke (#0B891F);
  rect (0, 580, 1000, 20);

  stroke(#FFD152); //hurdles
  fill(#FFD152);
  
  rect(xRect, yRect2, wRect, hRect2); //bottom rectangle
  
  xRect = xRect + vxRect;
  
  if (xRect <= -50) {

    if (xPerson > xRect)
      trackScore++;

    xRect = width+20;
    //xRect = random(500, 800); -->trying to change pos so they come at unpredictable intervals
    hRect2 = 400;
    //hRect2 = (int)random (200, 300);
    yRect2 = random(300, 550); //changing height of hurdles
    //hRect2 = 800-400;
  }

  drawPerson(xPerson, yPerson);
  xPerson = xPerson + vxPerson;
  yPerson = yPerson + vyPerson;
  
  if (yPerson < 0) {
     yPerson = 0;
     vyPerson = 0;
  }
  
  if (yPerson > height - 87) { //parameter of person @ bottom
    yPerson = height - 87;
    vyPerson = 0;
  }
  
  vyPerson = vyPerson + ayPerson;
   

  fill(255);
  text("Score: " + trackScore, width*.8, height*.1);

  /*
   if (xPerson + 87 > xRect && yPerson > yRect2) 
     trackState=2;
     */

  if (trackScore > 5)
        trackState = 2;
}

void drawPerson(float x, float y) {
  stroke(255);
  noFill();
  ellipse(x, y, 30, 30);
  line(x, y+15, x, y+50);
  line(x, y+50, x+10, y+60);
  line(x, y+50, x-10, y+60);
  line(x, y+35, x+10, y+20);
  line(x, y+35, x-10, y+20);
}

void trackKeys() {
  if (!trackTiming) {
    if (trackState == 0) 
    {
      trackState = 1;
    }
    else if (trackState == 1) {
      if (key == ' ') {
        vyPerson = vyPerson - 15;
      }
    }
    else {
      trackState = 0; 
      xRect = 400;
    }
  }
}
