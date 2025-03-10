
class Robot
{
  PVector position; 
  float heading; 
  float vHeading; 
  PVector velocity; 
  int c; 
  
  Robot(PVector positionIn, PVector velocityIn, int cIn)
  {
    position = positionIn; 
    velocity = velocityIn; 
    heading = 0; 
    c = cIn; 
  }
  
  void display()
  {
    fill(c); 
    boundaries(); 
    
    rectMode(CENTER);
    
    pushMatrix();
    translate(position.x, position.y);
    rotate(heading);
    
    if (isValidRotate(40, 15) && isValidRotate(40, -15) && isValidRotate(-40, 15) && isValidRotate(-40, -15))
      heading += vHeading;
    
    rect(0, 0, 80, 30);
    ellipse(20, 0, 20, 20); 
 
    popMatrix();
    
    
    PVector newPos = new PVector(position.x, position.y);
    newPos.add(velocity);
    
    if (isValidCorner(40, 15) && isValidCorner(40, -15) && isValidCorner(-40, 15) && isValidCorner(-40, -15))
      position = newPos;
    
   
  }
  
  boolean isValidCorner(float x, float y)
  {
    PVector newPos = new PVector(position.x, position.y);
    newPos.add(velocity);
    
    PVector corner = new PVector(x, y);
    corner.rotate(heading);
    
    newPos.add(corner);
    
    return isValidPosition(newPos);
  }
  
   boolean isValidRotate(float x, float y)
  {
    PVector newPos = new PVector(position.x, position.y);
    newPos.add(velocity);
    
    PVector corner = new PVector(x, y);
    corner.rotate(heading + vHeading);
    
    newPos.add(corner);
    
    return isValidPosition(newPos);
  }
  
  boolean isValidPosition(PVector newPosition)
  {
    for(Block b : blocks) 
    {
      if(b.isInside(newPosition))
      
      return false; 
      
    }
   
    return true;
  }
  
  void moveRight()
  {
    vHeading += .06; 
  }
  
  void moveLeft()
  {
    vHeading -= .06; 
  }
  
  void stopTurn()
  {
     vHeading = 0; 
  }
  
  void moveForward()
  {
    
    velocity = new PVector(1, 0);
    velocity.rotate(heading);
    velocity.mult(5); 
    
    
  }
  
  void stopMove()
  {
    velocity.mult(0);  
  }
  
  void moveBackward()
  {
    
    PVector v = new PVector(cos(heading), sin(heading));
    v.mult(5); 
    position.sub(velocity);
    velocity.sub(v); 
    
  }
  
  void boundaries()
  {
    if(position.x > width)
    position.x = width; 
    if(position.x < 0)
    position.x = 30; 
    if(position.y > height)
    position.y = height; 
    if(position.y < 0)
    position.y = 50;
    
  }
  
  void winCheck(float x, float y)
  {
    
    if(position.x - 40 < x && x < position.x + 40 && position.y - 15 < y && y < position.y + 15)
    {
      robotstate ++;
      position.x=width/10;
      position.y=height/10;
      heading = 0;
    }
    
    
  }
  
  
}
