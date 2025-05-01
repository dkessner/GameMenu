class Bullet {
  PVector position, velocity;
  float r;
  color c;
  boolean isDead = false;
  
  Bullet(PVector velocityIn, PVector positionIn, color cIn) {
    c = cIn;
    velocity = velocityIn;
    position = new PVector(positionIn.x,positionIn.y);
    r = grid;
  }
  
  void update(){
    noStroke();
    fill(c);
    position.add(velocity);
    ellipse(position.x,position.y, r,r);
    
  }
}
