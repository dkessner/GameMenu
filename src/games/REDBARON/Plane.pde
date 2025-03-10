class Plane {

  ArrayList<Smoke> smoke = new ArrayList<Smoke>();

  float xPos, yPos, w; 
  float xVel, yVel, velocity;
  float thetaZ, thetaX, turnRadius, leftRollAmount, rightRollAmount;
  float xTarget, yTarget, thetaTarget, absThetaZ;
  float health, gunTemp, engineTemp;
  float interval;

  int upKey, downKey, rightKey, leftKey, shootKey, throttleKey;
  int winCount;

  color planeColor;

  boolean facingRight, rising, falling, rollLeft, rollRight;
  boolean rollingLeft, rollingRight;
  boolean shooting, canShoot, canFly;
  boolean throttling, canThrottle;
  boolean hit, destroyed;

  Plane(float startX, float startY, float tempThetaZ, float tempThetaX, boolean tempFacingRight, 
    int tempUpKey, int tempDownKey, int tempRightKey, int tempLeftKey, int tempShootKey, int tempThrottleKey, color tempPlaneColor) {
    w = 5*xF;
    xPos = startX;
    yPos = startY;
    velocity = xF/5;
    health = 100;
    thetaX = tempThetaX;
    thetaZ = tempThetaZ;
    turnRadius = 0.05;
    facingRight = tempFacingRight;
    rollingLeft = false;
    rollingRight = false;
    rollLeft = false;
    rollRight = false;
    rising = false;
    falling = false;
    canShoot = true;
    canThrottle = true;
    throttling = false;
    shooting = false;
    canFly = true;
    hit = false;
    destroyed = false;
    leftRollAmount = 0;
    rightRollAmount = 0;
    upKey = tempUpKey;
    downKey = tempDownKey;
    leftKey = tempLeftKey;
    rightKey = tempRightKey;
    shootKey = tempShootKey;
    throttleKey = tempThrottleKey;
    planeColor = tempPlaneColor;
    xTarget = 0;
    yTarget = 0;
    thetaTarget = 0;
    gunTemp = 0;
    engineTemp = 0;
    winCount = 0;
    interval = 200;
  }

  void resetPlane(float startX, float startY, float tempThetaZ, float tempThetaX, boolean tempFacingRight) {
    xPos = startX;
    yPos = startY;
    velocity = xF/3;
    health = 100;
    thetaX = tempThetaX;
    thetaZ = tempThetaZ;
    facingRight = tempFacingRight;
    rollingLeft = false;
    rollingRight = false;
    rollLeft = false;
    rollRight = false;
    rising = false;
    falling = false;
    canShoot = true;
    canThrottle = true;
    throttling = false;
    shooting = false;
    canFly = true;
    hit = false;
    destroyed = false;
    leftRollAmount = 0;
    rightRollAmount = 0;
    xTarget = 0;
    yTarget = 0;
    thetaTarget = 0;
    gunTemp = 0;
    engineTemp = 0;
    winCount = 0;
    interval = 200;
  }

  void updatePlane() {

    if (falling) {
      if (facingRight) {
        thetaZ += turnRadius/3;
        if (thetaZ > TWO_PI || thetaZ < -1 * TWO_PI) {
          thetaZ = 0;
        }
      } else {
        thetaZ -= turnRadius/3;
        if (thetaZ > TWO_PI || thetaZ < -1 * TWO_PI) {
          thetaZ = 0;
        }
      }
    } else if (rising) {
      if (facingRight) {
        thetaZ -= turnRadius;
        if (thetaZ > TWO_PI || thetaZ < -1 * TWO_PI) {
          thetaZ = 0;
        }
      } else {
        thetaZ += turnRadius;
        if (thetaZ > TWO_PI || thetaZ < -1 * TWO_PI) {
          thetaZ = 0;
        }
      }
    } else if (rollLeft) {
      if (!rollingLeft && !rollingRight) {
        rollingLeft = true;
        facingRight = !facingRight;
      }
    } else if (rollRight) {
      if (!rollingLeft && !rollingRight) {
        rollingRight = true;
        facingRight = !facingRight;
      }
    }


    xVel = velocity*cos(thetaZ);
    yVel = velocity*sin(thetaZ);

    xPos += xVel;
    yPos += yVel;

    if (xPos > width) {
      xPos = 0;
    } else if (xPos < 0) {
      xPos = width;
    }

    if (yPos > height) {
      yPos = 0;
    } else if (yPos < 0) {
      yPos = height;
    }

    rollLeft();
    rollRight();
  }

  void displayPlane(Plane otherPlane) {
    lights();
    directionalLight(255, 255, 0, 0, 1, 0);

    if (millis()%interval < 50) {
      smoke.add(new Smoke(xPos, yPos, health));
    }
    for (int i = smoke.size()-1; i > -1; i--) {
      Smoke s = smoke.get(i);
      s.drawSmoke();
      if (s.alpha < 0) {
        smoke.remove(i);
      }
    }
    pushMatrix();
    translate(xPos, yPos);
    rotateZ(thetaZ);
    rotateX(thetaX);

    drawPlane(otherPlane);
    popMatrix();
  }



  void rollLeft() {
    if (rollingLeft) {
      if (leftRollAmount<PI) {
        thetaX += turnRadius;
        leftRollAmount += turnRadius;
      } else {
        rollingLeft = false;
        leftRollAmount = 0;
      }
    }
  }

  void rollRight() {
    if (rollingRight) {
      if (rightRollAmount<PI) {
        thetaX -= turnRadius;
        rightRollAmount += turnRadius;
      } else {
        rollingRight = false;
        rightRollAmount = 0;
      }
    }
  }

  boolean aimCheck(Plane otherPlane) {
    xTarget = abs(xPos - otherPlane.xPos);
    yTarget = abs(yPos - otherPlane.yPos);

    if (thetaZ >= 0) {
      absThetaZ = thetaZ;
    } else {
      absThetaZ = TWO_PI + thetaZ;
    }

    if (otherPlane.xPos > xPos) {
      if (otherPlane.yPos > yPos) {
        thetaTarget = atan(yTarget/xTarget);
      } else {
        thetaTarget = atan(xTarget/yTarget) + 3*PI/2;
      }
    } else {
      if (otherPlane.yPos > yPos) {
        thetaTarget = atan(xTarget/yTarget) + HALF_PI;
      } else {
        thetaTarget = atan(yTarget/xTarget) + PI;
      }
    }
    //println("xTarget " + xTarget + " yTarget " + yTarget);
    //println("absthetaZ " + absThetaZ + " thetaTarget " + thetaTarget);
    if (absThetaZ > thetaTarget - 0.2 && absThetaZ < thetaTarget + 0.2) {
      //println("hit");
      return true;
    } else {
      return false;
    }
  }


  void dealDamage(Plane otherPlane) {
    float shotPower = 10*yF/dist(xPos, yPos, otherPlane.xPos, otherPlane.yPos);
    controlGun();
    if (shooting && canShoot) {
      if (millis()%20 > 15) {
        mySound.gun.play();
      }
      gunTemp++;
      if (aimCheck(otherPlane)) {
        otherPlane.health-=shotPower;
        otherPlane.hit = true;
        //println(otherPlane.health);
      }
    } else {
      otherPlane.hit = false;
      gunTemp--;
    }
    gunTemp = constrain(gunTemp, 0, 100);
  }

  void controlGun() {
    if (gunTemp == 100) {
      canShoot = false;
    } else if (gunTemp == 0) {
      canShoot = true;
    }
  }

  void throttle() {
    controlThrottle();
    if (throttling && canThrottle) {
      engineTemp++;
    } else {
      engineTemp--;
    }

    engineTemp = constrain(engineTemp, 20, 200);
    float engineVolume = map(engineTemp, 20, 200, 0.005, 0.05);
    velocity = map(engineTemp, 20, 200, xF/7, xF/2);
    if (myScene == Scene.GAME) {
      mySound.engine.amp(engineVolume);
      mySound.engine.play();
    }
  }

  void controlThrottle() {
    if (engineTemp == 200) {
      canThrottle = false;
    } else if (engineTemp == 20) {
      canThrottle = true;
    }
  }


  void drawBullets(Plane otherPlane) {
    if (shooting && canShoot && myScene == Scene.GAME) {
      strokeWeight(xF/5);
      stroke(#FFE343);
      if (aimCheck(otherPlane)) {
        line(random(xF, 5*xF), 0, random(0, dist(xPos, yPos, otherPlane.xPos, otherPlane.yPos)), random(-yF, yF));
      } else {
        line(random(xF, 20*xF), 0, random(0, 40*xF), random(-yF, yF));
      }
    }
  }

  void planeCheck(Plane otherPlane) {
    if (health < 0) {
      otherPlane.winCount++;
      health = 100;
      globalTime = millis();
      myScene = Scene.RESET;
    }
  }

  void planeKeyPressed() {
    if (canFly) {
      if (keyCode == upKey) {
        falling = true;
      } else if (keyCode == downKey) {
        rising = true;
      } else if (keyCode == leftKey) {
        rollLeft = true;
      } else if (keyCode == rightKey) {
        rollRight = true;
      } else if (keyCode == shootKey) {
        shooting = true;
      } else if (keyCode == throttleKey) {
        throttling = true;
      }
    }
  }

  void planeKeyReleased() {
    if (keyCode == upKey) {
      falling = false;
    } else if (keyCode == downKey) {
      rising = false;
    } else if (keyCode == leftKey) {
      rollLeft = false;
    } else if (keyCode == rightKey) {
      rollRight = false;
    } else if (keyCode == shootKey) {
      shooting = false;
    } else if (keyCode == throttleKey) {
      throttling = false;
    }
  }

  void drawPlane(Plane otherPlane) {

    drawBullets(otherPlane);
    strokeWeight(xF/10);
    //pilot
    noStroke();
    fill(#A77205);
    pushMatrix();
    translate(0, -yF/7, 0);
    sphere(yF/4);
    popMatrix();

    pushMatrix();
    stroke(0);
    fill(0);
    rotateZ(HALF_PI);
    translate(-xF/10, -yF, -yF/8);
    drawCylinder(yF/10, yF/10, yF/1.5, 10);
    translate(0, 0, +yF/4);
    drawCylinder(yF/10, yF/10, yF/1.5, 10);
    popMatrix();

    if (hit && millis()%interval < 50 && myScene == Scene.GAME) {
      fill(255);
    } else if (myScene == Scene.RESET) {
      fill(planeColor, 75);
    } else {
      fill(planeColor);
    }


    //middle wing
    beginShape();
    vertex(0, 0, -2*yF);
    vertex(0, 0, 2*yF);
    vertex(xF, 0, 2*yF);
    vertex(xF, 0, -2*yF);
    endShape(CLOSE);

    //top wing
    beginShape();
    vertex(0+xF/4, -yF-xF/26, -2*yF);
    vertex(0+xF/4, -yF-xF/26, 2*yF);
    vertex(xF+xF/4, -yF-xF/26, 2*yF);
    vertex(xF+xF/4, -yF-xF/26, -2*yF);
    endShape(CLOSE);

    //bottom wing
    beginShape();
    vertex(0-xF/4, yF+xF/26, -2*yF);
    vertex(0-xF/4, yF+xF/26, 2*yF);
    vertex(xF-xF/4, yF+xF/26, 2*yF);
    vertex(xF-xF/4, yF+xF/26, -2*yF);
    endShape(CLOSE);

    //struts
    beginShape();
    vertex(xF-xF/4, -yF, -1.75*yF);
    vertex(0+xF/4, +yF, -1.75*yF);
    vertex(0+xF/2, +yF, -1.75*yF);
    vertex(xF, -yF, -1.75*yF);
    endShape(CLOSE);

    beginShape();
    vertex(xF-xF/4, -yF, +1.75*yF);
    vertex(0+xF/4, +yF, +1.75*yF);
    vertex(0+xF/2, +yF, +1.75*yF);
    vertex(xF, -yF, +1.75*yF);
    endShape(CLOSE);

    //plane body
    beginShape();
    vertex(xF, 0, -yF/2);
    vertex(xF, 0, yF/2);
    vertex(xF, yF, yF/2);
    vertex(xF, yF, -yF/2);
    endShape(CLOSE);

    beginShape();
    vertex(xF, 0, yF/2);
    vertex(xF, yF, yF/2);
    vertex(0, yF, yF/2);
    vertex(0, 0, yF/2);
    endShape(CLOSE);

    beginShape();
    vertex(xF, 0, -yF/2);
    vertex(xF, yF, -yF/2);
    vertex(0, yF, -yF/2);
    vertex(0, 0, -yF/2);
    endShape(CLOSE);


    beginShape();
    vertex(0, yF, yF/2);
    vertex(xF, yF, yF/2);
    vertex(xF, yF, -yF/2);
    vertex(0, yF, -yF/2);
    endShape(CLOSE);

    //wheels
    beginShape();
    vertex(xF/1.25, 1.75*yF, yF/1.5);
    vertex(xF, yF, yF/3);
    vertex(xF/4, yF, yF/3);
    vertex(xF/2, 1.75*yF, yF/1.5);
    endShape(CLOSE);

    beginShape();
    vertex(xF/1.25, 1.75*yF, -1*yF/1.5);
    vertex(xF, yF, -1*yF/3);
    vertex(xF/4, yF, -1*yF/3);
    vertex(xF/2, 1.75*yF, -1*yF/1.5);
    endShape(CLOSE);

    //right wheel
    pushMatrix();
    fill(0);
    translate(xF/1.6, yF/1.5, yF/1.5);
    ellipse(0, yF, xF/2, xF/2);
    fill(planeColor);
    translate(0, 0, xF/26);
    ellipse(0, yF, xF/2.5, xF/2.5);
    popMatrix();

    pushMatrix();
    fill(0);
    translate(xF/1.6, yF/1.5, -1*yF/1.5);
    ellipse(0, yF, xF/2, xF/2);
    fill(planeColor);
    translate(0, 0, -1*xF/26);
    ellipse(0, yF, xF/2.5, xF/2.5);
    popMatrix();

    if (hit && millis()%interval < 50 && myScene == Scene.GAME) {
      fill(255);
    } else if (myScene == Scene.RESET) {
      fill(planeColor, 75);
    } else {
      fill(planeColor);
    }

    //tailshape
    beginShape();
    vertex(-2*xF, yF/4, 0);
    vertex(-2*xF, yF/2, 0);
    vertex(0, yF, -yF/2);
    vertex(0, 0, -yF/2);
    endShape(CLOSE);

    beginShape();
    vertex(-2*xF, yF/4, 0);
    vertex(-2*xF, yF/2, 0);
    vertex(0, yF, yF/2);
    vertex(0, 0, yF/2);
    endShape(CLOSE);

    beginShape();
    vertex(-2*xF, yF/4, 0);
    vertex(0, 0, -yF/2);
    vertex(0, 0, yF/2);
    endShape(CLOSE);

    beginShape();
    vertex(-2*xF, yF/2, 0);
    vertex(0, yF, -yF/2);
    vertex(0, yF, yF/2);
    endShape(CLOSE);


    ellipse(-2*xF, 0, yF, yF);

    beginShape();
    vertex(-2*xF, yF/3, +yF/1.5);
    vertex(-2*xF, yF/3, -yF/1.5);
    vertex(-0.5*xF, yF/3, 0);
    endShape(CLOSE);

    //engine
    rotateY(HALF_PI);
    translate(0, 0, 1.5*xF);
    ellipse(0, yF/2, yF, yF);
    translate(0, 0, -1.5*xF);

    rotateY(-1*HALF_PI);
    translate(1.5*xF, yF/2);
    rotateZ(HALF_PI);


    drawCylinder(xF/2, xF/2, yF/2, 10);

    //propeller
    fill(0, 0, 0, 100);
    noStroke();
    sphere(yF/2);
  }

  void drawCylinder(float topRadius, float bottomRadius, float tall, int sides) {
    float angle = 0;
    float angleIncrement = TWO_PI / sides;
    beginShape(QUAD_STRIP);
    for (int i = 0; i < sides + 1; ++i) {
      vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
      vertex(bottomRadius*cos(angle), tall, bottomRadius*sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }
}