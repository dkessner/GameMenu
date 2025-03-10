class Base {

  float x, y;
  boolean destroyed;

  Base(float tempX, float tempY) {
    x= tempX;
    y = tempY;
  }

  void drawBase() {
    noStroke();
    if (destroyed) {
      fill(125);
    } else {
      fill(255);
    }
    triangle(x, y, x+xF, y, x+xF, y-yF);
    rect(x+xF, y-yF, xF*4, xF*2);
    rect(x+xF*2.7,y-yF*1.5,xF*0.6,yF*0.5);
    triangle(x+5*xF, y, x+6*xF, y, x+5*xF, y-yF);
  }
}