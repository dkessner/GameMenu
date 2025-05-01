class Bullet {
  float x, y, r;

  //bullet constructor with parameters for height
  Bullet(float x2In, float y2In) {
    x = x2In;
    y = y2In;
    r = 20;
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(x, y, r, r);
  }

  void update() {
    x += 20;
  }
}
