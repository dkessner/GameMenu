
class Ball 
{
  PVector position; 
  PVector velocity; 
  int c; 
  int r; 
  
  
  Ball(PVector positionIn, PVector velocityIn, int rIn, int cIn)
  {
    position = positionIn; 
    velocity = velocityIn; 
    r = rIn;
    c = cIn; 
    
  }
  
  void display()
  {
    fill(c); 
    ellipse(position.x, position.y, r, r); 
    
    PVector newPos = position.copy();
    newPos.add(velocity);
   
    
    boolean rightSideOkay = true; // = isValidSide(5, 5);
    boolean leftSideOkay = true; // isValidSide(5, 5);
    boolean topOkay = true; // isValidSide(5, 5); 
    boolean bottomOkay = true; //isValidSide(5, 5); 
  
    rightSideOkay = isValidSide(newPos, 5, 0);
    leftSideOkay = isValidSide(newPos, -5, 0); 
    topOkay = isValidSide(newPos, 0, -5);
    bottomOkay = isValidSide(newPos, 0, 5); 
    boolean upperLeftOkay = isValidSide(newPos, -5, -5);
    boolean upperRightOkay = isValidSide(newPos, 5, -5); 
    boolean bottomLeftOkay = isValidSide(newPos, -5, 5); 
    boolean bottomRightOkay = isValidSide(newPos, 5, 5);
     
    if(rightSideOkay && leftSideOkay && topOkay && bottomOkay && upperLeftOkay)
      position = newPos; 
      
    else if(!rightSideOkay || !leftSideOkay)
    {
      velocity.x *= -1; 
      position.add(velocity);
    }
    else if(!topOkay || !bottomOkay)
    {
      velocity.y *= -1; 
      position.add(velocity);
    }
    else if (!upperLeftOkay || !upperRightOkay || !bottomLeftOkay || !bottomRightOkay)
    {
       velocity.mult(-1); 
    }
    
    // side bouncing
    
    if(position.x < r || position.x > width - r)
     velocity.x *= -1;
     
    if(position.y < r || position.y > height - r)
      velocity.y *= -1;     
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
  
  boolean isValidSide(PVector newpos, float x, float y)
  {
    PVector side = newpos.copy();
    side.x += x;
    side.y += y;
    return isValidPosition(side); 
  }
  
  boolean isInsideBall(PVector v)
  {
    if(position.x < v.x && v.x < position.x + r && position.y < v.y && v.y < position.y + r)
    return true; 
    else 
    return false; 
  }
  
  PVector getPosition()
  {
   return position;  
  }
  
  //getPosition
}