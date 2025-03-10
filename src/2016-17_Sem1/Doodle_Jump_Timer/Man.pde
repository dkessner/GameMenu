

void keyPressed() {
  if (keyCode == LEFT) {
    xVel= -5;
  } else if (keyCode == RIGHT) {
    xVel = 5;
  } else if (keyCode == ENTER) {
    go++;
    if (go > 2)
      go = 0;

    mY=height/2-50;
    x=width/2;
    ySpeed = 1;
  }
}

void keyReleased() {
  if (keyCode == LEFT || keyCode == RIGHT) {
    xVel = 0;
  } else if (keyCode == UP || keyCode == DOWN) {
    yVel=2;
  }
}

void drawMan (float x, float y) {
  fill (0, 0, 255); 
  ellipse ( x, y, 30, 30);
}



void updateMan () {

  mY = mY + ySpeed;
  if (mY < height/2-10) {
    ySpeed = ySpeed +1;
    //mY = height/2+10;
    mY= constrain (mY, 0, 700);
  }


  ySpeed = ySpeed + 0.03;
}