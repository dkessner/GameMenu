class Missile {


  float startTime;
  float splitTime;
  PVector start;
  PVector target;
  PVector newStart;
  float x, y, xSpeed, ySpeed, vSpeed;
  float fill = 0;
  float w = 0.8*xF;
  float theta;
  boolean detonated = false;
  boolean split = false;

  Type myType;


  Missile(float tempSpeed, Type type, PVector tempStart, PVector tempTarget) {
    startTime = millis();
    splitTime = random(2000,3000);
    myType = type;
    start = tempStart;
    newStart = tempStart;
    target = tempTarget;
    vSpeed = tempSpeed;
    x = start.x;
    y = start.y;
    theta = atan((start.y-target.y)/(start.x-target.x));
    if (start.x < target.x) {
      xSpeed = vSpeed*cos(theta);
      ySpeed = vSpeed*sin(theta);
    } else {
      xSpeed = vSpeed*cos(theta)*-1;
      ySpeed = vSpeed*sin(theta)*-1;
    }
  }

  void updateMissile() {

    switch(myType) {
    case MISSILE:
      x += xSpeed;
      y += ySpeed;
      break;
    case SPLITTER:
      if (!split && (startTime+splitTime)<millis()) {
        split = true;
        split();
      }
      x += xSpeed;
      y += ySpeed;
      break;

    case SMARTBOMB:
      if (startTime+splitTime<millis()) {
        startTime = millis();
        splitTime = random(2000,4000);
        smartBomb();
      }
      x += xSpeed;
      y += ySpeed;
      break;
    }
  }

  void drawMissile() {
    switch(myType) {

    case MISSILE:
      stroke(255, 100, 0);
      line(x, y, start.x, start.y);
      noStroke();
      fill(255, 0, 0);
      ellipseMode(CENTER);
      ellipse(x, y, w, w);
      break;

    case SPLITTER:
      stroke(255, 100, 0);
      line(newStart.x, newStart.y, start.x, start.y);
      line(x, y, newStart.x, newStart.y);
      noStroke();
      if (!split) {
        fill(255, fill%255, 0);
      } else {
        fill(255, 0, 0);
      }
      ellipseMode(CENTER);
      ellipse(x, y, w, w);
      fill+=10;
      break;


    case SMARTBOMB:
      noStroke();
      fill(fill%255, 255, 255);
      ellipseMode(CENTER);
      ellipse(x, y, w, w);
      fill+=10;
      break;
    }
  }

  void split() {
    newStart = new PVector(x, y);
    target = new PVector(random(0, width), height-3.5*yF);
    theta = atan((newStart.y-target.y)/(newStart.x-target.x));
    if (newStart.x < target.x) {
      xSpeed = vSpeed*cos(theta);
      ySpeed = vSpeed*sin(theta);
    } else {
      xSpeed = vSpeed*cos(theta)*-1;
      ySpeed = vSpeed*sin(theta)*-1;
    }
  }
  
    void smartBomb() {
    newStart = new PVector(x, y);
    target = new PVector(random(0, width), height-3.5*yF);
    theta = atan((newStart.y-target.y)/(newStart.x-target.x));
    if (newStart.x < target.x) {
      xSpeed = vSpeed*cos(theta);
      //ySpeed = vSpeed*sin(theta);
    } else {
      xSpeed = vSpeed*cos(theta)*-1;
      //ySpeed = vSpeed*sin(theta)*-1;
    }
  }
}