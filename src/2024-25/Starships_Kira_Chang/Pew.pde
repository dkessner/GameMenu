
class Pew {
  PVector position, velocity, acceleration;
  float radius, topSpeed, mass;
  float lifespan = 100;
  boolean dead = false;

  Pew(float shipx) {
    //assign values to variables
    position = new PVector(shipx, height/1.18);
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, -9);
    radius = (27);
    topSpeed = 10;
    mass = (10);
  }

  boolean checkRock(Rock r) {
    if (dist(r.position.x, r.position.y, position.x, position.y) < radius + r.radius) {
      //set the fill to red
      dead = true;
      return true;
    } else {
      return false;
    }
  }

  boolean isOffScreen() {
    if (position.y < 0) {
      return true;
    } else {
      return false;
    }
  }

  void update() {
    lifespan--;
    velocity.add(acceleration);
    //limit the velocity by topSpeed
    velocity.limit(topSpeed);
    //println(velocity.mag());
    //increment position by velocity
    position.add(velocity);
  }
  void display() {
    circle(position.x, position.y, 15);
  }
}
