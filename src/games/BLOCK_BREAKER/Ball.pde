class Ball {

  float x, y, xspeed, yspeed, w, h;
  float buffer = width/150;
  float rfactor = 0;
  boolean offScreen = false;

  Ball() {
    noStroke();
    x = 00;
    y = 200;
    xspeed = width/200;
    yspeed = height/200;
    w = width/65;
    h = width/65;
  }

  void moveBall(Paddle paddle) {
    if (paddle.start) {
      x = x + xspeed;
      y = y + yspeed;
    } else {
      x = paddle.x + paddle.w/2-w/2;
      y = paddle.y - (h+1);
    }
  }


  void checkBlockCollision(Block block) {
    //check if collision happened
    if ((x + w) > block.x && x < (block.x + block.w) && (y + h) > block.y && y < (block.y + block.h)) {
      block.hit = true;
      hit.play();
      //decide where collision happened
      if ((x + w) < (block.x + buffer)) {
        x = block.x - w;
        xspeed = xspeed * random(-1-rfactor, -1+rfactor);
      } else if (x > (block.x + block.w - buffer)) {
        x = block.x + block.w;
        xspeed = xspeed * random(-1-rfactor, -1+rfactor);
      }

      if ((y + h) < (block.y + buffer)) {
        y = block.y - h;
        yspeed = yspeed * random(-1-rfactor, -1+rfactor);
      } else if (y > block.y + block.h - buffer) {
        y = block.y + block.h;
        yspeed = yspeed * random(-1-rfactor, -1+rfactor);
      }
    }
  }

  void checkPaddleCollision(Paddle paddle) {
    //check if collision happened
    if ((x + w) > paddle.x && x < (paddle.x + paddle.w) && (y + h) > paddle.y && y < (paddle.y + paddle.h)) {
      paddleBounce.play();
      //decide where collision happened
      if ((x + w) < (paddle.x + buffer)) {
        x = paddle.x - w;
        xspeed = xspeed * -1;
      } else if (x > (paddle.x + paddle.w - buffer)) {
        x = paddle.x + paddle.w;
        xspeed = xspeed * -1;
      }

      if ((y + h) < (paddle.y + buffer)) {
        y = paddle.y - h;
        yspeed = yspeed * -1;
      } else if (y > paddle.y + paddle.h - buffer) {
        y = paddle.y + paddle.h;
        yspeed = yspeed * -1;
      }
    }
  }

  void checkWallCollision() {
    if (x > (width-w)) {
      wallBounce.play();
      xspeed = xspeed * -1;
      x = width-w;
    }

    if (x < 0) {
      wallBounce.play();
      xspeed = xspeed * -1;
      x = 0;
    }

    if (y < 0) {
      wallBounce.play();
      yspeed = yspeed * -1;
    }

    if (y > height) {
      offScreen = true;
    }
  }

  void drawBall() {
    fill(ballColor);
    rect(x, y, w, h);
  }
}