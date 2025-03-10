
class Car
{
  int x;
  int y;
  int vx = 3;
  int vy;
  
  Car(int x, int y, int vx, int vy)
  {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
  }
  
  void display()
  {
    rectMode(CENTER);
    
    fill(255, 0, 0);
    rect(x, y, 24, 14);
    fill(170);
    
    ellipse(x-10, y+7, 10, 10);
    ellipse(x+11, y+7, 10, 10);
    
    fill(0);
    ellipse(x-10, y+7, 3, 3);
    ellipse(x+11, y+7, 3, 3);
    
    fill(#B1FAE3);
    rect(x, y-2, 20, 5);
   
    stroke(0);
    line(x, y-5, x, y);
    
    x = x + vx;
    
    if(x > width+20)
      x = -20;
      
    else if( x < -20)
      x = width+20;
     
   rectMode(CORNER);
    
  }
}

class Log
{
  int x;
  int y;
  int vx = 3;
  int vy;
  
  Log(int x, int y, int vx, int vy)
  {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
  }
  
  void display() //fill Kyra in on log details (lines)
  {
    rectMode(CENTER);
    
    fill(#814A16);
    rect(x, y, 130, 20);
    
    stroke(#D3792F);
    line(x-65, y-5, x-20, y-5);
    line(x+65, y, x+15, y);
    line(x-65, y+5, x-35, y+5);
    
    stroke(0);
    
    x = x + vx;
    
    if(x > width+130)
      x = -130;
      
    else if( x < -130)
      x = width+130;
    
    rectMode(CORNER);
  }
}

class Turtle
{
  int x;
  int y;
  int vx = 3;
  int vy;
  
  Turtle(int x, int y, int vx, int vy)
  {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
  }
  
  void display()
  {
    fill(#B3F755);
    stroke(0);
    strokeWeight(0.5);
    ellipse(x+23, y, 10, 8);
    ellipse(x-37, y, 10, 8);
    ellipse(x+83, y, 10, 8);
    
    ellipse(x-23, y, 10, 8);
    ellipse(x+37, y, 10, 8);
    ellipse(x-83, y, 10, 8);
    
    stroke(#B3F755);
    strokeWeight(3);
    
    line(x-10, y-10, x-12, y-15);
    line(x-10, y+10, x-12, y+15);
    line(x+10, y-10, x+12, y-15);
    line(x+10, y+10, x+12, y+15);
    
    line(x-70, y-10, x-72, y-15);
    line(x-70, y+10, x-72, y+15);
    line(x-50, y-10, x-48, y-15);
    line(x-50, y+10, x-48, y+15);
    
    line(x+70, y-10, x+72, y-15);
    line(x+70, y+10, x+72, y+15);
    line(x+50, y-10, x+48, y-15);
    line(x+50, y+10, x+48, y+15); 
    
    
    
    strokeWeight(1);
    stroke(0);
    
    fill(#3ADEC6);
    
    ellipse(x-60, y, 40, 20);  //bodies of turtles
    ellipse(x, y, 40, 20);
    ellipse(x+60, y, 40, 20);
    
    stroke(#238B2E);
     
    line(x-20, y, x+20, y);
    line(x-10, y-10, x-10, y+10);
    line(x+10, y-10, x+10, y+10);
    
    line(x-80, y, x-40, y);
    line(x-70, y-10, x-70, y+10);
    line(x-50, y-10, x-50, y+10);
    
    line(x+80, y, x+40, y);
    line(x+70, y-10, x+70, y+10);
    line(x+50, y-10, x+50, y+10);
    

    x = x + vx;
    
    if(x > width+130)
      x = -130;
      
    else if( x < -130)
      x = width+130;
    
  }
}

class Lilypad
{
  int x;
  int y;
  int vx = 3;
  int vy;
  
  Lilypad(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  void display()
  {
    fill(#258E11);
    arc(x, y, 50, 50, 0-PI/8, PI+5*PI/8, PIE);
    
  }
}