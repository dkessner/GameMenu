class Rocket {

  PVector[] tail = new PVector[25];
  PVector start;
  PVector target;
  float x, y, xSpeed, ySpeed, vSpeed;
  float w = 0.8*xF;
  float blastRadius = 5*xF;
  float theta;
  float fill;
  float alpha;
  boolean detonated = false;


  Rocket(PVector tempStart, PVector tempTarget, float tempSpeed) {
    fill = 0;
    alpha = 255;
    start = tempStart;
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

    for (int i = 0; i < tail.length; i++) {
      tail[i] = new PVector(x, y);
    }
  }

  void updateRocket() {
    for (int i =0; i < tail.length-1; i++) {
      tail[i] = tail[i+1];
    }
    tail[tail.length - 1] = new PVector(x, y);
    if (!detonated && target.y<y) {
      x += xSpeed;
      y += ySpeed;
    } else {

      explodeRocket();
    }
  }

  void drawRocket() {
    noStroke();
    ellipseMode(CENTER);
    if (!detonated) {
      fill(255);
      for (int i = 0; i< tail.length; i++) {
        fill(0, 0, i*10);
        ellipse(tail[i].x, tail[i].y, 5, 5);
      }
      fill(255);
      ellipse(x, y, w, w);
    } else {
      fill(fill, 0, 0, alpha);
      ellipse(x, y, w, w);
    }
  }

  void explodeRocket() {
    if(!detonated){
       mySound.detonate.play();
    }
    detonated = true;
    if (w < blastRadius) {
      w++;
    }
    fill+=10;
    alpha-=2;
    if (alpha < 0) {
      x = -1000;
      y = 0;
    }
  }

  boolean collision(Missile m) {
    if (dist(x, y, m.x, m.y) < (w/2 + m.w/2)) {
      if (!detonated) {
        mySound.detonate.play();
        detonated = true;
      }
      return true;
    } else {
      return false;
    }
  }
}