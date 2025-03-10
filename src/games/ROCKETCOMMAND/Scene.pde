class Scene {
  PFont font;
  PFont sparcFont;
  PFont studioFont;


  int fadeFill = 255;
  int fadeInterval = 5;
  int colorInterval = 5;
  float lineX=width/2-130;
  float waitTime;
  int colorFade = 217;
  boolean waiting = false;

  Scene() {
    font = loadFont("QuartzMS-48.vlw");
    sparcFont = loadFont("ARDESTINE-48.vlw");
    studioFont = loadFont("ARBONNIE-48.vlw");
  }

  void drawStart() {
    textAlign(CENTER);
    textFont(font, 7*xF);
    fill(250, 220, 40);
    text("ROCKET COMMANDER", width/2, height/2);
    textFont(font, 2.4*xF);
    fill(colorFade, 217, colorFade);
    colorFade += colorInterval;
    if (colorFade < 1 || colorFade > 255) {
      colorInterval *= -1;
    }
    text("PRESS ENTER TO START", width/2, height/2 +4*yF);
    fade();
    noStroke();
    rectMode(CORNER);
    fill(0, 255, 0);
    rect(0, height-4*yF, width, 4*yF);
  }

  void drawGame(Cursor cursor) {

    noStroke();
    rectMode(CORNER);
    fill(0, 255, 0);
    rect(0, height-4*yF, width, 4*yF);
    //draw missileCounts
    fill(255);
    textAlign(RIGHT);
    textFont(font, 2.8*xF);
    text(cursor.leftRockets, cursor.leftBase.x+4*xF, height-yF);
    text(cursor.centerRockets, cursor.centerBase.x+4*xF, height-yF);
    text(cursor.rightRockets, cursor.rightBase.x+4*xF, height-yF);
    //draw score
    textAlign(CENTER);
    fill(255, 0, 0);
    text("SCORE: "+cursor.score, width/2, 3*yF);
  }

  void drawRoundEnd(Control c) {
    textAlign(CENTER);
    fill(250, 220, 40);
    textFont(font, 4*xF);
    text("ROUND " + (c.round+1) +" COMPLETED", width/2, height/2 );
    textFont(font, 2.4*xF);
    fill(colorFade, 217, colorFade);
    colorFade += colorInterval;
    if (colorFade < 1 || colorFade > 255) {
      colorInterval *= -1;
    }
    text("PRESS ENTER TO CONTINUE", width/2, height/2 +10*yF);
  }



  void drawEnd() {

    textAlign(CENTER);
    fill(250, 220, 40);
    textFont(font, 4*xF);
    text("THE END", width/2, height/2 );
    textFont(font, 2.4*xF);
    fill(colorFade, 217, colorFade);
    colorFade += colorInterval;
    if (colorFade < 1 || colorFade > 255) {
      colorInterval *= -1;
    }
    text("PRESS ENTER TO CONTINUE", width/2, height/2 +10*yF);
  }


void drawSplash() {
  background(0);
  fill(255, 255, 120);
  textAlign(CENTER);
  stroke(255);
  line(width/2-130, height/2+5, lineX, height/2+5);
  lineX += 2;

  textFont(sparcFont, 48);
  text("spARC", width/2-65, height/2);
  fill(230, 110, 230);
  textFont(studioFont, 45);
  text("studios", width/2+60, height/2);

  noStroke();
  fill(0);
  rect(lineX, 0, width, height);
  for (int i = 0; i < 10; i++) {
    stroke(130, 235, 235);
    line(lineX, height/2+5, random(lineX-10, lineX+10), random(height/2, height/2+20));
  }
}

void fade() {
  fill(0, 0, 0, fadeFill);
  rect(0, 0, width, height);
  fadeFill -= fadeInterval;
  fadeFill = constrain(fadeFill, 0, 255);
}

void sceneVariableReset() {
  fadeFill = 255;
  fadeInterval = 5;
  colorInterval = 5;
  waiting = false;
}

void wait(int milliseconds, Screen goToScreen) {
  if (!waiting) {
    waiting = true;
    waitTime = millis()+milliseconds;
  } else {
    if (waitTime < millis()) {
      waiting = false;
      myScreen = goToScreen;
    }
  }
}
}