class Player {

  ArrayList<Bullet> bullets = new ArrayList<Bullet>();

  float x, y, fx, fy, w, h, xSpeed, ySpeed, speed;
  boolean canShoot;

  Player() {
    w = 6 * xF;
    h = 4 * yF;
    x = width/2;
    y = height-4*yF;
    fy = height - 5.5*yF;
    fx = -4*xF;
    speed = xF;
    canShoot = true;
  }

  void playerKeyPressed() {
    if (keyCode == RIGHT || key == 'd') {
      xSpeed = speed;
    } else if (keyCode == LEFT || key == 'a') {
      xSpeed = -1*speed;
    } else if (keyCode == UP) {
      ySpeed = -1*speed;
    } else if (keyCode == DOWN) {
      ySpeed = speed;
    } else if (key == ' ' || key == ',') {
      if (ammoCount > 0 && canShoot) {
        canShoot = false;
        ammoCount--;
        bullets.add(new Bullet(myPlayer));
        mySound.shoot.play();
      }
    }
  }

  void playerKeyReleased() {
    if (keyCode == RIGHT || keyCode == LEFT || key == 'd' || key == 'a') {
      xSpeed = 0;
    } else if (keyCode == UP || keyCode == DOWN) {
      ySpeed = 0;
    } else if (key == ' ' || key == ',') {
      canShoot = true;
    }
  }

  void updatePlayer() {
    x += xSpeed;
    y += ySpeed;
    x = constrain(x, 0, width-w);
    y = constrain(y, 3.5*yF, height - 3.5*yF-h);

    for (Bullet b : bullets) {
      b.updateBullet();
    }
  }

  void drawPlayer() {
    fill(0, 0, 220);
    rectMode(CORNER);


    //draw catcher
    rect(x, fy, w, h);
    fill(125);
    quad(x+w, fy, x+1.25*w, fy-h/4, x+1.25*w, fy+h, x+w, fy+h);

    for (Bullet b : bullets) {
      b.drawBullet();
    }

    //draw cannon
    fill(0, 0, 220);
    rect(fx, y, w, h);
    fill(200);
    quad(fx, y, fx+w/4, y-h/4, fx+1.25*w, y-h/4, fx+w, y);
  }

  void drawPlayerBack() {
    rectMode(CORNER);

    //catcher
    fill(220);
    quad(x, fy, x+w/4, fy-h/4, x+1.25*w, fy-h/4, x+w, fy);
    fill(100);
    triangle(x, fy, x+w/4, fy-h/4, x+w/4, fy);
    
    //cannon
    fill(145);
    quad(fx+w, y, fx+1.25*w, y-h/4, fx+1.25*w, y+0.75*h, fx+w, y+h);
    fill(100);
    triangle(fx+w, y+h, fx+w, y+0.75*h, fx+1.25*w, y+0.75*h);
  }
}