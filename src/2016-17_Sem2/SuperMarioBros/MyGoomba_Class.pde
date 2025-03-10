
class Goomba {
  float a, b, aVel;
  PImage goombaPic;

  Goomba(float tempA, float tempB) {
    goombaPic = loadImage("goomba.png");
    a = tempA;
    b = tempB;
    aVel = -1;
  }

  void display() {
    noStroke();
    noFill();
    ellipse(a-3, b, gR-1, gR-1);
    image(goombaPic, a, b);
    a += aVel;
    // draw goomba
  }
}