class Ship {
  PVector position, velocity, acceleration;
  float radius, topSpeed, mass;
  boolean dead = false;

  Ship() {
    //assign values to variables
    position = new PVector(width, height/1.1);
    velocity = new PVector(0, 0);
    //give acceleration an initial value
    acceleration = new PVector(0, 0);
    radius = (27);
    topSpeed = 10;
    mass = random(1, 10);
  }
  void shipKeyPressed() {
    if (keyCode  == RIGHT) {
      velocity.x = 5;
    }
    //else if left key is pressed
    else if (keyCode == LEFT) {
      velocity.x = -5;
    }
  }
  void update() {
    position.add(velocity);
  }
  void display() {
    pushMatrix();
    translate(position.x, position.y);
    triangle(0, -radius*2, radius, radius, -radius, radius);
    popMatrix();
  }
  boolean checkShip(Rock r) {
    if (dist(r.position.x, r.position.y, position.x, position.y) < radius + r.radius) {
      dead = true;
      return true;
    } else {
      return false;
    }
  }

  void checkEdgesBounce() {
    //check right edge of the mover with right edge of the screen
    if (position.x + radius > width) {
      //reverse the x velocity
      velocity.x *= -1;
      //snap the mover back to the right edge of the screen
      position.x = width-radius;
    } else if (position.x - radius < 0) {
      velocity.x *= -1;
      position.x = 0 + radius;
    }

    if (position.y + radius > height) {
      velocity.y *= -1;
      position.y = height - radius;
    } else if (position.y - radius < 0) {
      velocity.y *= -1;
      position.y = 0 + radius;
    }
  }
}
