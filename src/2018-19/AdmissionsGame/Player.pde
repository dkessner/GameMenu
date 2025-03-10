PImage sally;


class Player {
  PVector position;
  PVector velocity = new PVector(0,0);
  int r = 50;
  int velMult = 4;
  PVector acceleration = new PVector(1,0);
  
  Player(PVector positionIn) {
    position = positionIn;
  }
  
  void display() {
    fill(255,255,0);
    image(sally, position.x-(sally.width/2), position.y-2*(sally.height/3));
    position.add(velocity);
  }
  
  void changeVelocity(int direction) {
     velocity.x = velMult*direction;
  }
  
  void applyAcc(int direction) {
    if (direction == 0) {
      velMult = 4;
    }
    if (velMult <= 9) {
      velMult += acceleration.x;
    }
  }
}
