class ball {
  PVector pos = new PVector();
  PVector vel = new PVector();
  float r;
  boolean drawing = false;
  ArrayList<PVector> lines = new ArrayList<PVector>();
  ArrayList<PVector> mustaches = new ArrayList<PVector>();
  float score = 0;

  ball() {
    pos.x=random(mSize.x);
    pos.y=0;
    vel.x=random(2,4);
    vel.y=random(2,4);
    r=10;

    for (float x = mSize.x/2; x>= mSize.x/2 - mSize.x/10; x--) {
      for (float y = mSize.y/3 - mSize.y/37; y >=mSize.y/3 - mSize.y/37 - mSize.y/60; y--) {
        mustaches.add(new PVector(x, y));
      }
    }
  }
  void run() {
    fill(255, 255, 0);
    ellipse(pos.x, pos.y, r*2, r*2);

    if (drawing) {
      lines.add(new PVector (pos.x, pos.y));
      checkMustache(new PVector(pos.x, pos.y));
    }

    fill(0);
    textSize(15);
    text("MUSTACHE SIMILARITY SCORE: " + round(score/1000), width-600, 500);

    for (PVector p : lines) {
      fill(0);
      circle(p.x, p.y, 5);
    }
    pos.add(vel);
    vel.limit(5);

    if (pos.x > mSize.x) {
      vel.x = -vel.x;
      pos.x = mSize.x;
    } else if (pos.x <0) {
      vel.x = -vel.x;
      pos.x = 0;
    }
    if (pos.y >mSize.y) {
      vel.y = - vel.y;
      pos.y = mSize.y;
    } else if (pos.y<0) {
      vel.y = - vel.y;
      pos.y = 0;
    }

    if ( pos.x + r >= barPos.x && pos.x -r <=barPos.x + barWidth ) {
      if (pos.y +r >= barPos.y && pos.y + r <= barPos.y + barHeight/2) { // top of bar
        if (vel.y>0) {
          vel.y *= -1;
        } else if (vel.y <=0) {
          vel.y +=0.2;
        }
        float fromCenter = pos.x - barPos.x + barWidth/2;
        vel.x += map(fromCenter, -barWidth/2, barWidth/2, 0.2, -0.2);
      } else if (pos.y -r >= barPos.y + barHeight/2 && pos.y - r <= barPos.y + barHeight) { // bottom of bar
        if (vel.y>=0) {
          vel.y +=0.2;
        } else if (vel.y <0) {
          vel.y *=-1;
        }
      }
    }
  }
  void keyPressed() {
    if (key == ' ') {
      drawing = true;
    }
  }
  void keyReleased() {
    drawing = false;
  }
  void checkMustache(PVector toCheck) {
    for (PVector m : mustaches) {
      if (dist(toCheck.x, toCheck.y, m.x, m.y)<20) {
        score+=5;
      } else if (dist(toCheck.x, toCheck.y, m.x, m.y)<100) {
        score+=0.5;
      } else if (dist(toCheck.x, toCheck.y, m.x, m.y)<200){
        score +=0.05;
      } else {
        score --;
      }
    }
  }
}
