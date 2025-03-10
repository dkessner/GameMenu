class Door {
  float x;
  PImage inside;
  String name;
  boolean isDisplayed = false;
  
  float floorVal;
  int doorHeight = int(height*yScaleMult);
  int doorWidth = int(width*xScaleMult);
  
  Door(float xIn, String display) {
    x = xIn;
    name = display;                   
  }
  
  void display() {
    
    floorVal = ((height*scaleMult)-doorHeight);
    
    fill(66, 38, 8);
    rect(x, floorVal, doorWidth, doorHeight);
    fill(255);
    textSize(10);
    textAlign(CENTER, CENTER);
    text(name, x, floorVal, doorWidth, doorHeight);
    isDisplayed = true;
  }
  
  void open() {
    if (playerOn()) {
      //fill(0);
      //text(name,x-50, 420);
    }
  }
  
  boolean playerOn() {
    if (isDisplayed == true && player.position.x > x && player.position.x < (x+100)) {
      return true;
    }
    else
      return false;
  }

  boolean isInside(float xIn, float yIn)
  {
    return (isDisplayed && x < xIn && xIn < x + doorWidth &&
            floorVal < yIn && yIn < floorVal + doorHeight);
  }
}
