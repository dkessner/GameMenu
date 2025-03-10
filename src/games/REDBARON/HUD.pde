class HUD {

  Plane playerOne;
  Plane playerTwo;

  PFont largeFont;
  PFont hugeFont;
  int timer;

  HUD(Plane tempPlayerOne, Plane tempPlayerTwo) {
    playerOne = tempPlayerOne;
    playerTwo = tempPlayerTwo;
    largeFont = loadFont("JCsmPC-100.vlw");
    hugeFont = loadFont("JCsmPC-200.vlw");
    timer = 4;
  }

  void drawHUD() {
    pushMatrix();
    translate(0, 0, 2.5*yF);
    textFont(largeFont, xF);
    //text(playerOne.health, width/2, height/2);
    //drawBorder();
    drawGun(5*xF, height-4*yF, playerOne.gunTemp, 1);
    drawGun(width-5*xF, height-4*yF, playerTwo.gunTemp, -1);
    drawHealth(5*xF, height-3.5*yF, playerOne.health, 1);
    drawHealth(width-5*xF, height-3.5*yF, playerTwo.health, -1);
    drawPolarThrottle(4.5*xF, height-3.5*yF, playerOne.engineTemp);
    drawPolarThrottle(width-4.5*xF, height-3.5*yF, playerTwo.engineTemp);
    drawScore(width/2, height-2*yF);

    popMatrix();
  }

  void drawThrottle(float x, float y, float engineTemp) {
    fill(240);
    ellipse(x, y, xF*4, xF*4);
    noFill();
    stroke(0);
    strokeWeight(xF/3);
    ellipse(x, y, xF*4, xF*4);
    float tempArc = map(engineTemp, 0, 200, 0, TWO_PI);
    fill(engineTemp+55, 255-engineTemp, 0);
    arc(x, y, xF*4, xF*4, 0, tempArc);
    fill(255);
    arc(x, y, xF*4, xF*4, 0, tempArc-xF/30);
  }

  void drawPolarThrottle(float x, float y, float engineTemp) {
    fill(240);
    ellipse(x, y, xF*4, xF*4);
    noFill();
    stroke(0);
    strokeWeight(xF/3);
    ellipse(x, y, xF*4, xF*4);
    drawTicks(x, y);
    float tempTheta = map(engineTemp, 0, 200, 0, TWO_PI);
    pushMatrix();
    translate(x, y);
    rotateZ(tempTheta);
    stroke(engineTemp+55, 255-engineTemp, 0);
    strokeWeight(xF/3);
    line(0, 0, xF*1.8, 0);
    popMatrix();
    noStroke();
    fill(0);
    ellipse(x, y, xF, yF);
  }

  void drawTicks(float x, float y) {
    pushMatrix();
    translate(x, y);
    strokeWeight(1);
    line(xF, 0, 2*xF, 0);
    rotateZ(QUARTER_PI);
    line(xF, 0, 2*xF, 0);

    for (int i=0; i < 13; i++) {
      rotateZ(PI/8);
      line(1.5*xF, 0, 2*xF, 0);
    }
    popMatrix();
  } 

  void drawHealth(float x, float y, float health, int direction) {
    noStroke();
    //stroke(0);
    fill(200);
    rect(x, y, direction*xF*20, yF);
    float healthRect = map(health, 0, 100, 0, direction*xF*20);
    float healthColor = map(health, 0, 100, 0, 255);
    fill(255-healthColor, healthColor-50, 0);
    rect(x, y, healthRect, yF);
  }

  void drawGun(float x, float y, float gunTemp, int direction) {
    noStroke();
    //stroke(0);
    fill(200);
    rect(x, y, direction*xF*10, yF);
    float gunRect = map(gunTemp, 0, 100, 0, direction*xF*10);
    float gunColor = map(gunTemp, 0, 100, 0, 255);
    fill(gunColor, 255-gunColor, 0);
    rect(x, y, gunRect, yF );
  }

  void drawScore(float x, float y) {
    stroke(0);
    textFont(largeFont, 3.5*xF);

    fill(255, 0, 0);
    textAlign(RIGHT);
    text(playerOne.winCount, x-xF, y);

    fill(0, 0, 255);
    textAlign(LEFT);
    text(playerTwo.winCount, x+xF, y);
  }

  void drawRound() {
    pushMatrix();
    translate(0, 0, 3*xF);
    stroke(0);
    textFont(largeFont, 3.5*xF);
    fill(255, 0, 0);
    textAlign(CENTER);
    text("READY", width/2, height/2);
    text(timer, width/2, height/2+4*yF);
    popMatrix();
  }

  void drawStart() {
    pushMatrix();
    translate(0, 0, -3*xF);
    stroke(0);
    textFont(largeFont, 3*xF);
    fill(255, 0, 0);
    textAlign(CENTER);
    text("THE", width/2, height/2-8*xF);
    textFont(hugeFont, 11*xF);
    text("RED", width/2, height/2);
    text("BARON", width/2, height/2+8*xF);
    textFont(largeFont, 2*xF);
    fill(255, 0, 0);
    text("PRESS ENTER TO START", width/2, height/2+10*xF);
    drawControls(width/2-3*xF, height-3.5*xF);
    popMatrix();
  }

  void drawEnd() {
    pushMatrix();
    translate(0, 0, 3*xF);
    stroke(0);
    textAlign(CENTER);
    textFont(largeFont, 5*xF);
    if (playerOne.winCount > playerTwo.winCount) {
      fill(255, 0, 0);
      text("RED BARON WINS!", width/2, height/2);
    } else if (playerTwo.winCount > playerOne.winCount) {
      fill(0, 0, 255);
      text("BLUE BARON WINS!", width/2, height/2);
    } else {
      fill(0, 0, 0);
      text("DRAW!", width/2, height/2);
    }

    textFont(largeFont, 2.5*xF);
    fill(255, 0, 0);
    text("PRESS ENTER TO RETURN TO START", width/2, height/2+4*yF);
    popMatrix();
  }

  void drawControls(float x, float y) {
    pushMatrix();
    translate(x, y);
    drawArrow();
    rotateZ(HALF_PI);
    drawArrow();
    rotateZ(HALF_PI);
    drawArrow();
    rotateZ(HALF_PI);
    drawArrow();
    popMatrix();
    fill(0);
    ellipse(x, y, xF*3, xF*3);
    fill(255,0,0);
    ellipse(x+7*xF,y, xF*2, xF*2);
    ellipse(x+10*xF,y, xF*2, xF*2);
    fill(255);
    textMode(CENTER);
    textFont(largeFont,xF);
    text("STICK",x,y+xF/3);
    fill(0);
    text("GUN",x+7*xF,y+2*xF);
    text("GAS",x+10*xF,y+2*xF);
    text("CLIMB",x,y+4*xF);
    text("DESCEND",x,y-3*xF);
    text("ROLL",x-4*xF,y+xF/3);
    text("ROLL",x+4*xF,y+xF/3);
    
  }

  void drawArrow() {
    noStroke();
    fill(255, 0, 0);
    rect(xF, -xF/4, xF, xF/2);
    triangle(2*xF, -xF/2, 2*xF, xF/2, 3*xF, 0);
  }
}