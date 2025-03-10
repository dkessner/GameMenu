class Paddle {

  float x, y;
  float w = width/10;
  float h = height/30;
  float paddleSpeed = width/150;
  boolean right = false;
  boolean left = false;
  boolean start = false;

  Paddle() {
    x = mouseX;
    y = height-(height/15);
    noStroke();
    fill(0);
  }

  void drawPaddle() {
    fill(paddleColor);
    // x = mouseX;
    rect(x, y, w, h);
  }

  void movePaddle() {
    keyReleased();
    if (keyPressed) {
      if (keyCode == UP) {
        start = true;
      }
      if (keyCode == RIGHT) {
        right = true;
      } 
      if (keyCode == LEFT) {
        left = true;
      }
    } 

    if (right) {
      if (x < width - w) {
        x += paddleSpeed;
      }
    } else if (left) {
      if (x > 0) {
        x -= paddleSpeed;
      }
    }
  }

  void autoPlay(Ball myBall) {
    x = myBall.x-w/2;
    y = height-(height/15);
  }

  void keyReleased() {
    if (keyCode == RIGHT) {
      right = false;
    }
    if (keyCode == LEFT) {
      left = false;
    }
  }
}