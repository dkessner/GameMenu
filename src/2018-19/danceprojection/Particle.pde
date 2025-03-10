class Particle
{
  
  float r;
  PVector velocity, position, acceleration;
  int c;
  float startXPos;
  float startYPos;
  PVector previousPosition;
  
  Particle(float r, PVector position, PVector velocity, int c, float startXPos, float startYPos)
  {
    this.r = r;
    this.position = position;
    this.velocity = velocity;
    acceleration = new PVector(0,.1);
    this.c = c;
    this.startXPos = startXPos;
    this.startYPos = startYPos;
    this.previousPosition = position.copy();
  }
  
  void display()
  {
    previousPosition = position.copy();
    fill(c);
    rect(position.x, position.y, r, r);
    position.add(velocity);
   // velocity.add(acceleration);
   
   //change bounce limits to get margins
   if(position.x < r  || position.x>width-r)
      velocity.x *=-1;
     
      
     
    if(position.y <r || position.y>height-r)
      velocity.y *=-1;  
      
    }

    void push(PVector force)
    {
       force.mult(-2);
       velocity.add(force);
    }
 
    void pull(PVector force)
    {
      if (force.mag()> .03)
         force.setMag(.03);
       velocity.add(force);
    }
}
