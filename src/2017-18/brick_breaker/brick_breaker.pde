
int state = 0;

PFont font;

ArrayList<Brick>bricks;

ArrayList<Circle> circles;

Brick b1;

void setup ()
{
  fullScreen(); 
  noCursor();
  b1 = new Brick(width/2-100, 9*height/10, 200, 15, color(255,0,0), 0);
  
  circles = new ArrayList<Circle>();
  circles.add( new Circle (width/2, 9*(height/10.0) - 20, 40,40, 4,-5));
  
  bricks = new ArrayList<Brick>();
  
  font = createFont("AvenirNextCondensed-HeavyItalic", 24);
  
  for (int i=0; i<11; i++)
  {
  
    for(int j =0; j<15; j++)
    {
      Brick plus = new Brick (j*112, 60+(i*40), 100,30,
      color(random(20,256), random(256), random(256)),0);
      
      bricks.add(plus);
    } 
  }
 
}



void draw()
{
  background(0);
  
  if(state==0)
  {
    drawStart();
  }
  
  else if (state == 1)
  {
    drawGame();
  }
  
  else if (state == 2)
  {
    drawEnd(); 
  }
  else if (state == 3)
  {
     drawWin(); 
  }


}


void initializeVariables()
{
    circles.add( new Circle (width/2, 9*(height/10.0) - 20, 40,40, 4,-5));
    b1.x = width/2-100;
    b1.y =  9*height/10;
    b1.l = 200;
    b1.w = 15;
    b1.c = color(255,0,0);  
    
    bricks.clear();
    for (int i=0; i<11; i++)
    {
      for(int j =0; j<13; j++)
      {
        Brick plus = new Brick (j*112, 60+(i*40), 100,30,   
        color(random(20,256), random(256), random(256)), 0);
        
        bricks.add(plus);
      } 
    }
}


void keyPressed()
{
  if(state == 0 && key == ' ')
  {
    state = 1;
    initializeVariables();
  }
  
  else if(state == 2 && key == ' ')
  {
    state = 0;
  }
  
    else if(state == 3 && key == ' ')
  {
    state = 0;
  }
  
  if(keyCode == RIGHT)
  {
    b1.vx = 10;
  }
  
  if(keyCode == LEFT)
  {
    b1.vx = -10;
  }
  {
    
  }
}
void keyReleased()
{
  b1.vx = 0;
} 



void drawStart()
{
  textSize(50);
  textAlign(CENTER);
  stroke(255);
  textFont(font);
  text ("Hello, welcome to Sydney Brown's game. Press the space bar to begin", width/2,height/4);
  text("Use the right and left arrow keys to move the paddle. Some bricks may be special, just make sure not the let all the balls fall!", width/2, height/3);
}


void drawGame()
{
  background(0);
  drawObjects();
  detectCollisions();
  doStateTransitions();
}

void drawObjects()
{
  b1.display();
  
  for (Brick b : bricks)
  {
    b.display();
  }
  
  for (Circle c: circles)
  {
    c.display();
  } 
   
  fill(255);
  noStroke();
 
}


void detectCollisions()
{
  ArrayList<Circle> newCircles = new ArrayList<Circle>();
  
  for (Circle c: circles)
  {
    for (Brick b : bricks)
    {
       if (b.isInside(c.x, c.y))
       {
          c.vy = -c.vy;
          b.c = 0;
  
          if (b.special)
          {
             newCircles.add( new Circle (c.x, c.y, 40,40, random(-5,5), random(-5,5)));
             newCircles.add( new Circle (c.x, c.y, 40,40,random(-5,5), random(-5,5)));
             newCircles.add( new Circle (c.x, c.y, 40,40, random(-5,5), random(-5,5)));
          }
       }
    }
    
    if(b1.isInside(c.x, c.y+20))
    {
      c.vy = -c.vy;
      
      if (c.x < b1.x + b1.w/3)
      {
        c.vy +=1;
        c.vx +=1;
      }
      if (c.x > b1.x + b1.x - b1.w/3);
      {
        c.vy -=1;
        c.vx -=1;
      }
    }
  }

  for (Circle c : newCircles)
    circles.add(c);
    
    for(int i = bricks.size()-1; i >=0; i--)
 {
   if(bricks.get(i).c == 0)
     bricks.remove(i);
 }
}




void doStateTransitions()
{
  for(int i = circles.size()-1; i >=0; i--)
 {
   if(circles.get(i).y >height)
     circles.remove(i);
 }

 
   if (circles.size() ==0)
   {
     state = 2;
     circles.clear();
   }
   
    if (bricks.size() < 1)
     {
       state = 3; 
       circles.clear();
     }
 
}

void drawEnd()
{
  background (0);
  textAlign(CENTER);
  text ("YOU LOSE!",width/2,height/4);
  text("press the space bar to play again", width/2, height/3);
}

void drawWin()
{
  background (0);
  textAlign (CENTER);
  text ("YOU WIN!", width/2, height/4);
  text("press the space bar to play again", width/2, height/3);
}