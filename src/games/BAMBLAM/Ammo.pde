class Ammo {

  float x, y, w, speed;

  Ammo(float tempSpeed) {
    w = 3*xF;
    x = random(5*xF, width-5*xF);
    y = 0-2*w;
    speed = tempSpeed;
  }

  void updateAmmo() {
    y += speed;
  }

  void drawAmmo() {
    fill(125);
    ellipse(x+xF/5, y-yF/5, w+xF/5, w+yF/5);
    fill(ammoColor);
    ellipseMode(CENTER);
    ellipse(x, y, w, w);
  }
}