class City {

  float x, y;
  boolean destroyed;

  City(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void drawCity() {
    rectMode(CORNER);
    fill(0, 0, 255);
    stroke(0);

    quad(x+xF, y+yF, x+3*xF, y, x+3*xF, y+4*yF, x+xF, y+4*yF);

    triangle(x+3*xF, y+4*yF, x+4*xF, y+4*yF, x+3.5*xF, y-1.5*yF);
    arc(x+3.5*xF, y+4*yF, 4*xF, 3.5*yF, PI, TWO_PI);
    rect(x, y+2*yF, 2*xF, 2*yF);
  }
}