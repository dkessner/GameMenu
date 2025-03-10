class Cherry
{
  float x;
  float y;
  boolean visible; // true or false
 
 Cherry(float xIn, float yIn)
 {
   x = xIn;
   y = yIn;
   visible = true;
 }

 void display()
 {
   imageMode(CENTER);
   if (visible)
     image(cherry, x, y);
 }
}