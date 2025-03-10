
class Player
{
  
  int a;
  int b;
  int va = 0;
  boolean alive=true;
  
  Player(int a, int b, int va)
  {
    this.a = a;
    this.b = b;
    this.va = va;
  }
  
  void display()
  {
    if(!alive)
      return;
      
    fill(#DAFF0F);
    strokeWeight(2);
    stroke(#2FF551);
  
    ellipse(a, b, 16, 20);

    line(a-8, b-5, a-15, b-10);
    line(a+8, b-5, a+15, b-10);

    line(a-9, b+7, a-17, b+12);
    line(a+9, b+7, a+17, b+12);

    triangle(a-15, b-10, a-18, b-8, a-18, b-12);
    triangle(a+15, b-10, a+18, b-8, a+18, b-12);

    triangle(a-17, b+12, a-20, b+10, a-20, b+14);
    triangle(a+17, b+12, a+20, b+10, a+20, b+14);
    
    fill(#D30BCA);
    ellipse(a-5, b-8, 6, 6);
    ellipse(a+5, b-8, 6, 6);
    
    stroke(0);
   
    if(b < height && b > 350)
    {
      va = 0;
    }
    
    if(b == 325)
    {
      va = 1;
    }
    
    if(b == 275)
    {
      va = -1;
    }
    
    if(b == 225)
    {
      va = 2;
    }
    
    if(b == 175)
    {
      va = -2;
    }
    
    if(b == 125)
    {
      va = 1;
    }
    
    if(b < 125)
    {
      va = 0;
    }
    
    if(a >= width || a <= 0)
    {
      gameState=3;
    }
    
    a = a + va;
  }
  
}