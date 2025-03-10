
class Block
{
  PVector position; 
  
  int w; 
  int h; 
  int r;
  
  
  
  Block(PVector positionIn, int wIn, int hIn, int rIn)
  {
    position = positionIn; 
    w = wIn;
    h = hIn; 
    r = rIn; 

  }
  
  void display()
  {
    fill(0);
    rectMode(CORNER);
    rect(position.x, position.y, w, h, r);
      
  }
  
  boolean isInside(PVector v)
  {
    if(position.x < v.x && v.x < position.x + w && position.y < v.y && v.y < position.y + h)
    return true; 
    else 
    return false; 
  }
  
  
}