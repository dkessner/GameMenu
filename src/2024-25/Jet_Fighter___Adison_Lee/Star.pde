class Star {

  PVector position, velocity;
  float r;

  Star() {
    velocity = new PVector(random(0.2,0.6), 0);
    position = new PVector(random(width), random(height));
    r = grid/2;
  }

  void display () {
    noStroke();
    fill(255);
    position.add(velocity);
    ellipse(position.x, position.y, r, r);
  }
  
  void starsWrap() {
    //if x position reaches right side of screen...
    if (position.x-r > width) {
      //reset x position to left side of screen
      position.x = 0-r;
    } else if (position.x+r < 0) {
      //if x position reaches left side of screen....
      position.x = width+r;
    }

    if (position.y - r > height) {
      position.y = 0-r;
    } else if (position.y + r < 0) {
      position.y = height+r;
    }
  }
}
