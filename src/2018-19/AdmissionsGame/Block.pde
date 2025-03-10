
class Block
{
  PVector position; 
  
  int w; 
  int h; 
  int c; 
  
  
  Block(PVector positionIn, int wIn, int hIn, int cIn)
  {
    position = positionIn; 
    w = wIn;
    h = hIn; 
    c = cIn; 
  }
  
  void display()
  {
    fill(c); 
    rectMode(CORNER);
    rect(position.x, position.y, w, h);
      
  }
  
  boolean isInside(PVector v)
  {
    if(position.x < v.x && v.x < position.x + w && position.y < v.y && v.y < position.y + h)
    return true; 
    else 
    return false; 
  }
  
  
}
