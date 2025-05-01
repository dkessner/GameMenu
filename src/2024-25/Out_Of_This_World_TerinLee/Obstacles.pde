
class Obstacle {
  PImage image;
  float x, y, vx;

  Obstacle(float xIn, float yIn, float vxIn, PImage imageIn) {
    x = xIn;
    y = yIn;
    vx = vxIn;
    image = imageIn;
  }

  void display() {
    //drawing moving planet
    imageMode(CENTER);
    image(image, x, y);
    x=x+vx;
  }
}
