class Block {

  float x, y, w, h;
  boolean hit = false;
  color blockColor;

  Block(float tempX, float tempY, float tempW, float tempH, color tempColor) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    blockColor = color(tempColor);
  }


  void drawBlock() {
    stroke(bg);
    strokeWeight(width/600);
    fill(blockColor);
    rect(x, y, w, h);
    strokeWeight(1);
  }
}