class Cursor {

  ArrayList<Rocket> rockets = new ArrayList<Rocket>();

  Base leftBase;
  Base rightBase;
  Base centerBase;

  int score = 0;
  int leftRockets = 10;
  int centerRockets = 10;
  int rightRockets = 10;
  float x, y, w, h;
  float cursorSpeed = 0.5*xF;
  float xSpeed;
  float ySpeed;

  boolean left = false;
  boolean center = false;
  boolean right = false;

  Cursor() {
    x = width/2;
    y = height/2;
    w = xF;
    h = xF;
    leftBase = new Base((3.5*xF), (height-(4*yF)));
    centerBase = new Base(width/2-3.5*xF, height-4*yF);
    rightBase = new Base(width-10*xF, height-4*yF);
  }

  void drawCursor() {
    strokeWeight(2.5);
    stroke(255, 0, 0);
    line(x-w, y, x+w, y);
    line(x, y-h, x, y+h);
    strokeWeight(1);
    leftBase.drawBase();
    centerBase.drawBase();
    rightBase.drawBase();
  }

  void updateCursor() {
    x += xSpeed;
    y += ySpeed;
    if(x<0){
    x = width;
    }else if(x > width){
    x = 0;
    }
    //x = constrain(x, 0, width);
    y = constrain(y, 0, height-5.6*yF);
    for (Rocket r : rockets) {
      r.updateRocket();
      r.drawRocket();
    }
  }



  void cursorKeyPressed() {
    if (keyCode == UP) {
      ySpeed = -1*cursorSpeed;
    } else if (keyCode == RIGHT) {
      xSpeed = cursorSpeed;
    } else if (keyCode == LEFT) {
      xSpeed = -1*cursorSpeed;
    } else if (keyCode == DOWN) {
      ySpeed = cursorSpeed;
    } 
    if (key == ',') {
      if (!center && centerRockets > 0) {
        mySound.launch.play();
        rockets.add(new Rocket(new PVector(width/2-0.5*xF, height-5*yF), new PVector(x, y), 0.5*xF));
        centerRockets -= 1;
        center = true;
      }
    } else if (key == ' ') {
      if (!left && leftRockets > 0) {
        mySound.launch.play();
        rockets.add(new Rocket(new PVector(6.5*xF, height-5*yF), new PVector(x, y), 0.5*xF));
        leftRockets -= 1;
        left = true;
      }
    } else if (key == '.') {
      if (!right && rightRockets > 0) {
        mySound.launch.play();
        rockets.add(new Rocket(new PVector(width-7*xF, height-5*yF), new PVector(x, y), 0.5*xF));
        rightRockets -= 1;
        right = true;
      }
    }
  } 

  void cursorKeyReleased() {
    if (keyCode == UP || keyCode == DOWN) {
      ySpeed = 0;
    } else if (keyCode == RIGHT || keyCode == LEFT) {
      xSpeed = 0;
    }
    if (key == ',') {
      center = false;
    } else if (key == ' ') {
      left = false;
    } else if (key == '.') {
      right = false;
    }
  }

  void removeAllRockets() {
    for (int i = rockets.size()-1; i > -1; i--) {
      rockets.remove(i);
    }
  }

  void resetCursorVariables() {
    leftBase.destroyed = false;
    rightBase.destroyed = false;
    centerBase.destroyed = false;

    score = 0;
    leftRockets = 10;
    centerRockets = 10;
    rightRockets = 10;


    left = false;
    center = false;
    right = false;
  }
}
