class GUI {
  PFont largeFont;
  PFont smallFont;
  PFont sparcFont;
  PFont studioFont;

  int colorFade = 217;
  int colorInterval = 5;

  GUI() {
    largeFont = loadFont("STYuanti-SC-Bold-140.vlw");
    smallFont = loadFont("STYuanti-SC-Bold-48.vlw");
    sparcFont = loadFont("ARDESTINE-48.vlw");
    studioFont = loadFont("ARBONNIE-48.vlw");
  }

  void drawStart() {
    background(bg);
    textAlign(CENTER);
    textFont(largeFont, 15*xF);
    fill(125);
    text("BAM", width/2+xF, height/3-yF);
    text("BLAM", width/2+xF, height/2+2*yF-yF);
    fill(fontColor);
    text("BAM", width/2, height/3);
    text("BLAM", width/2, height/2+2*yF);
    textFont(largeFont, 2.4*xF);
    fill(colorFade, 217, colorFade);
    colorFade += colorInterval;
    if (colorFade < 1 || colorFade > 255) {
      colorInterval *= -1;
    }
    text("PRESS ENTER TO START", width/2, height/2 +8*yF);
  }

  void drawGame() {
    fill(125);
    rectMode(CORNER);
    noStroke();
    rect(0, height-3.5*yF, width, 3.5*yF);
    rect(0, 0, width, 3.5*yF);
    fill(145);
    //rect(0, height-4.5*yF,width, yF);
    textAlign(CENTER);
    textFont(largeFont, 2.5*xF);
    fill(fontColor);
    text("SCORE: " + score, width/2, 2.5*yF);
    text("AMMO: " + ammoCount, width/2, height-yF);
  }

  void drawRect() {
    fill(145);
    rect(0, height-4.5*yF, width, yF);
  }

  void drawEnd() {
    background(bg);
    textAlign(CENTER);
    textFont(largeFont, 10*xF);
    fill(125);
    text("GAME", width/2+xF/2, height/3+2*yF-yF/2);
    text("OVER", width/2+xF/2, height/2-yF/2);
    fill(fontColor);
    text("GAME", width/2, height/3+2*yF);
    text("OVER", width/2, height/2);
    textFont(largeFont, 2.4*xF);
    fill(colorFade, 217, colorFade);
    colorFade += colorInterval;
    if (colorFade < 1 || colorFade > 255) {
      colorInterval *= -1;
    }
    text("PRESS ENTER TO START AGAIN", width/2, height/2 +10*yF);
  }
}