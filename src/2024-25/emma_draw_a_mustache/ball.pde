class ball {
  PVector pos = new PVector();
  PVector vel = new PVector();
  float r;
  boolean drawing = false;
  ArrayList<PVector> lines = new ArrayList<PVector>();
  FloatList line_colors = new FloatList(); //https://processing.org/reference/FloatList.html
  ArrayList<PVector> mustaches = new ArrayList<PVector>();
  float score = 0;
  float hue = 100;
  float hueVel = 0;
  float maxScore = 40;
  ball() {
    pos.x=random(mSize.x);
    pos.y=0;
    vel.x=random(4, 6);
    vel.y=random(4, 6);
    r=50;
    setMustache(1);
  }
  void run() {
    imageMode(CENTER);
    image(brush, pos.x, pos.y, r, r); //draw the brush

   /* for (PVector m: mustaches){ //draw the ideal mustache
     circle(m.x, m.y, 1);
     */

    hue +=hueVel;
    //draw the colors
    strokeWeight(20);
    colorMode(HSB, 400, 100, 100);
    for (int i = 0; i<400; i+=10) {
      stroke(i, 100, 100);
      line(mSize.x, i*2, mSize.x + 20, i*2);
    }
    stroke(0);
    strokeWeight(3);
    line(mSize.x, hue*2, mSize.x + 30, hue*2);
    for (int i = 0; i<lines.size(); i++) { // draw the lines already in the array
      fill(line_colors.get(i), 100, 100);
      noStroke();
      circle(lines.get(i).x, lines.get(i).y, 5);
    }
    colorMode(RGB, 255, 255, 255);

    if (drawing) { // add lines to the array
      lines.add(new PVector (pos.x-r/2, pos.y-r/2));
      line_colors.append(new Float(hue));
      checkMustache(new PVector(pos.x, pos.y));
    }

    fill(0); // write score
    textSize(15);
    textFont(font2);
    text("MUSTACHE SIMILARITY SCORE: " + round(score/1000), mSize.x + 50, 500);

    if (round(score/1000) >=maxScore) {
      fill(#13CE3C);
      text("What an amazing mustache! Click the right blue button to go \nto the next level or stay here to keep drawing", mSize.x+50, 600);
    }

    //check edges
    if (pos.x > mSize.x) {
      vel.x = -vel.x;
      pos.x = mSize.x;
    } else if (pos.x <0) {
      vel.x = -vel.x;
      pos.x = 0;
    }
    if (pos.y >height) {
      vel.y = - vel.y;
      pos.y = height;
    } else if (pos.y<0) {
      vel.y = - vel.y;
      pos.y = 0;
    }
    //check contact with bar
    if (pos.x + r/2 > barPos.x && pos.x -r/2 <barPos.x + barWidth  && pos.y + r/2 >barPos.y && pos.y - r/2 <barPos.y+barHeight) {
      vel.y = -vel.y;
      vel.y*=1.2;
      if (pos.y >barPos.y+barHeight/2) {
        pos.y = barPos.y + barHeight + r/2;
      } else {
        pos.y = barPos.y - r/2;
      }
      float fromCenter = pos.x - barPos.x + barWidth/2;
      vel.x += map(fromCenter, -barWidth/2, barWidth/2, 0.3, -0.3);
    }
    pos.add(vel);
    vel.limit(5);
    if (vel.x<1 && vel.x >0) {
      vel.x+=0.1;
    } else if (vel.x<0 && vel.x>-1){
      vel.x-=0.1;
    }if (vel.y <1 && vel.y>0){
      vel.y+=0.1;
    }else if (vel.y<0 && vel.y>-1){
      vel.y-=0.1;
    }
  }
  void keyPressed() {
    if (key == ' ') {
      drawing = true;
    } else if (key == 'w' && hue>0) {
      hueVel = -5;
    } else if (key == 's' && hue <400) {
      hueVel = 5;
    } else if ((key == '.' && round(score/1000)>=maxScore) || (key == '!')){
      lines.clear();
      pos.y = 0;
      pos.x = 0;
      score = 0;
      scene ++;
      setMustache(scene);
    }
  }
  void keyReleased() {
    drawing = false;
    hueVel = 0;
  }
  void checkMustache(PVector toCheck) {
    for (PVector m : mustaches) {
      if (dist(toCheck.x, toCheck.y, m.x, m.y)<20) {
        score+=5;
      } else if (dist(toCheck.x, toCheck.y, m.x, m.y)<100) {
        score+=0.5;
      } else if (dist(toCheck.x, toCheck.y, m.x, m.y)<200) {
        score +=0.05;
      } else {
        score --;
      }
    }
  }
  void setMustache(int scene) {
    mustaches.clear();
    if (scene == 1) {
      for (float x = mSize.x/2; x>= mSize.x/2 - mSize.x/10; x--) {
        for (float y = mSize.y/3 - mSize.y/37; y >=mSize.y/3 - mSize.y/37 - mSize.y/60; y--) {
          mustaches.add(new PVector(x, y));
        }
      }
    } else if (scene == 2) {
      for (float x = mSize.x*17/32 + mSize.x/100; x>= mSize.x*17/32 - mSize.x/30; x--) {
        for (float y = mSize.y*19/32; y >=mSize.y*19/32 - mSize.y/60; y--) {
          mustaches.add(new PVector(x, y));
        }
      }
      maxScore = 20;
    } else if (scene == 3) {
      for (float x = mSize.x/2; x>= mSize.x/2 - mSize.x/10; x--) {
          mustaches.add(new PVector(x, mSize.y *26.5/100));
      }
      maxScore = 5;
    }
  }
}
