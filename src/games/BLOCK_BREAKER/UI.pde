class UI {

  PFont font;
  PFont sparcFont;
  PFont studioFont;

  int fadeFill = 255;
  int fadeInterval = 5;
  int colorInterval = 5;
  float lineX=width/2-131;
  float waitTime;
  float largeFontSize = width/10;
  float smallFontSize = width/30;
  int colorFade = 217;
  boolean waiting = false;

  UI() {
    font = loadFont("AgencyFB-Bold-48.vlw");
    sparcFont = loadFont("ARDESTINE-48.vlw");
    studioFont = loadFont("ARBONNIE-48.vlw");
  }

  void drawSplash() {
    background(0);
    fill(bg);
    textAlign(CENTER);
    stroke(255);
    line(width/2-132, height/2+5, lineX, height/2+5);
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

  void fadeReset() {
    fadeFill = 255;
    fadeInterval = 5;
  }


  void drawScore(int score) {
    textFont(font, smallFontSize);
    fill(textColor);
    textAlign(CENTER);
    text("SCORE: " + score, width/2, height/18);
  }

  void drawStart() {
    background(bg);
    textFont(font, largeFontSize);
    fill(textColor);
    textAlign(CENTER);
    text("BLOCK BREAKER", width/2, height/2);
    textFont(font, smallFontSize);
    fill(colorFade, 217, colorFade);
    colorFade += colorInterval;
    if (colorFade < 1 || colorFade > 255) {
      colorInterval *= -1;
    }
    text("PRESS ENTER TO START", width/2, height/2 +height/10);
    fade();
  }

  void wait(int milliseconds, int goToScene) {
    if (!waiting) {
      waiting = true;
      waitTime = millis()+milliseconds;
    } else {
      if (waitTime < millis()) {
        waiting = false;
        scene = goToScene;
      }
    }
  }

  void drawEnd() {
    textFont(font, largeFontSize*0.7);
    fill(textColor);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2-40);
  }
}