
class Player
{
  PVector position; 
  float heading; 
  float vHeading; 
  PVector velocity; 
  int c; 
  ArrayList <Ball> balls;
  int lives; 
  
  
  Player(PVector positionIn, PVector velocityIn, int cIn)
  {
    initialize(); 
    position = positionIn; 
    velocity = velocityIn; 
    heading = 0; 
    c = cIn; 
    lives = 3; 
  }
  //initialize arraylist (setup)
  void initialize()
  {
   balls = new ArrayList<Ball>(); 
  }
  
  ArrayList<Ball> getBalls()
  {
   return balls;  
  }
  
  int getLives()
  {
    return lives;
  }
  
  void display()
  {

    fill(c); 
    boundaries(); 
    
    //loop through the balls
    for (Ball b: balls) 
    {
      b.display();
    }
    
    rectMode(CENTER);
    
    pushMatrix();
    translate(position.x, position.y);
    rotate(heading);
    
    if (isValidRotate(40, 15) && isValidRotate(40, -15) && isValidRotate(-40, 15) && isValidRotate(-40, -15))
      heading += vHeading;
   
    rect(0, 0, 80, 30, 3);
    ellipse(20, 0, 20, 20); 
 
    popMatrix();
    
    
    PVector newPos = position.copy();
    newPos.add(velocity);
    
    if (isValidCorner(40, 15) && isValidCorner(40, -15) && isValidCorner(-40, 15) && isValidCorner(-40, -15))
      position = newPos;
      
    
   
  }
   boolean isInsidePlayer(PVector v)
  {
    if(dist(position.x, position.y, v.x, v.y) < 30)
    return true; 
    else 
    return false; 
    
  }
  
 
  boolean isValidCorner(float x, float y)
  {
    PVector newPos = position.copy();
    newPos.add(velocity);
    
    PVector corner = new PVector(x, y);
    corner.rotate(heading);
    
    newPos.add(corner);
    
    return isValidPosition(newPos);
  }
  
   boolean isValidRotate(float x, float y)
  {
    PVector newPos = position.copy();
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
    if(position.x > width - 20)
    position.x = width - 20; 
    if(position.x < 15)
    position.x = 15; 
    if(position.y > height - 20)
    position.y = height - 20; 
    if(position.y < 15)
    position.y = 15;
  }
  
  void shoot(int red, int blue)
  {
    float speed = 5;
    Ball b = new Ball(new PVector(position.x, position.y), new PVector(speed*cos(heading), speed*sin(heading)), 10, color(red, 0, blue));
      balls.add(b); 
    
    if (balls.size() > 10)
      balls.remove(0);
  }
  
 
  void livesUpDown(ArrayList<Ball> otherballs)
  {
    for(int i = otherballs.size()-1; i>=0; i--)
    {
       Ball b = otherballs.get(i);
       if(isInsidePlayer(b.getPosition()))
       {
        lives --;
        otherballs.remove(i); 
       }
    }
      
    
  } 
  
  
}