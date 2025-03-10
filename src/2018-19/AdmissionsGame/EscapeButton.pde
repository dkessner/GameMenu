class Escape {
  float x;
  float y;
  String escapeText;
  int l = 120;
  int w = 60;
  boolean active = false;
  
  Escape(String display) {
    x = width-20-l;
    y = height-20-w;
    escapeText = display;
  }
  
  void display() {
    rectMode(CORNER);
    fill(255);
    strokeWeight(mouseOn() ? 3 : 1);
    rect(x,y,l,w);
    textSize(15);
    fill(0);
    textAlign(CENTER, CENTER);

    //rectMode(CORNERS);
    //text(escapeText, x+2, y+2, x+l-2, y+w-2);

    text(escapeText, x+2, y+2, l-2, w-2);
    setActive(true);
  }
  
  boolean mouseOn() 
  {
     return mouseX >= x && 
            mouseX <= (x+l) && 
            mouseY >= y && 
            mouseY <= y+w;
  }

  boolean isActive() {return active;}
  void setActive(boolean value) {active = value;}
}
