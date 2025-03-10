int gameState=0;
float boyx=0;
float boyvx=0;
float boyax=0;
PImage snowflake;
PImage boy;
PImage background;
PImage bug;
PImage start;
int flycaught = 3;
int snowcaught = 0;
float two = 0;


ArrayList<Fly> fly;
ArrayList<Snow> snow;

void setup()
{
  fullScreen();
  background(255);
  snowflake = loadImage("snowflakes_PNG7545.png");
  boy = loadImage("imgres-1.png");
  snow = new ArrayList<Snow>();
  fly = new ArrayList<Fly>();
  background = loadImage("lan.png");
  background.resize(width, height);
  bug = loadImage("fly-clip-art-blue-fly-hi.png");
  start = loadImage("Screen Shot 2016-10-17 at 10.23.52 AM.png");
  start.resize(width, height+200);
  textAlign(CENTER, CENTER);
  for (int i=0; i<30; i++)
  {
    Snow b = new Snow((float)random(width), (float)random(-height-200, -25));
    snow.add(b);
  }
  for (int i=0; i<15; i++)
  {
    Fly b = new Fly((float)random(width), (float)random(-height-200, -25));
    fly.add(b);
  }
  imageMode(CENTER);
  
  boyx = width/2;
}

void draw()
{
  if (gameState == 0)
    drawStart();
  else if (gameState == 1)
    drawGame();
  else if (gameState == 2)
    drawEnd();
  else if (gameState>2)
    gameState=0;
}

void drawStart()
{
  background(255);
  fill(0);
  image(start, width/2, height/2);
   textSize(30);
  text("Press space to play", 1170, 730);
  if (key == ' ')
  {
    gameState = 1;
  }
}

void drawGame()
{
  if (flycaught <= 0)
  {
    gameState = 2;
  }
  background(255);
  image(background, width/2, height/2);
  fill(0);  
  image(boy, boyx, height-100); // tongue at ((mouseX-47), 456)
  boyvx+=boyax;
  boyx = boyx+boyvx+two;
  
  textSize(18);
  text(("Lives left: " + flycaught), width-100, 100);
  text(("Snowflakes Caught: " + snowcaught), width-100, 50);

 
 for (Fly b : fly)
   b.display();
  
  for (Snow b : snow)
    b.display();
    
    
   for (Snow s : snow)
   {
      if (dist(boyx-47, height-144, s.x, s.y) < 10)
      {
        snowcaught++;
        println("snow caught: " + snowcaught);
        s.y = random(-height, -25);
        s.x = random(width);
      }
    
   for (Fly f : fly)
   {
     if (dist(boyx-47, height-144, f.x, f.y) < 10)
      {
        flycaught = flycaught-1;
        println("Flies caught: " + flycaught);
        f.y = random(-height, -25);
        f.x = random(width);
      }
   }
   }
   
   if (boyx < -100)
     flycaught=0;
     
   else if (boyx > width+100)
     flycaught=0;
   
}



void drawEnd()
{
  background(255);
  fill(0);
  image(background, width/2, height/2);
  textSize(40);
  if (key == ' ')
  {
    for (Snow s : snow)
    {
      s.x = random(width);
      s.y = random (-height, -25);
    }
    flycaught = 3;
    snowcaught = 0;
    gameState = 1;
    
    for (Fly f : fly)
    {
      f.x = random(width);
      f.y = random(-height, -25);
    }
    boyx = width/2;
  }
  text(("Snowflakes Caught: " + snowcaught), width/2, height/2);
  textSize(30);
  text("Press space to try again", width/2, 670);
}

void keyPressed()
{

  if (keyCode == RIGHT)
  {
    two = 3;
   boyvx+= 0.5;
   boyax=1;
  }
  else if (keyCode == LEFT)
  {
    two = -3;
     boyvx+= -0.5;  
     boyax=-1;
  }
}

void keyReleased()
{
   if (keyCode == RIGHT)
   {
     two = 0;
      boyvx = 0;
      boyax=0;
   }
  else if (keyCode == LEFT)
  {
    two = 0;
     boyvx= 0; 
     boyax=0;
  }
}

class Fly
{
  float x;
  float y;
  Fly(float xIn, float yIn)
  { 
    x = xIn;
    y = yIn; 
  }
  void display()
  {
    image(bug, x, y);
    y = y+random(-1,7);
    x = x+random(-2,2);
    if (x<0)
    {
      x = 10;
    }
    else if (x>width)
    {
      x = 590;
    }
    if (y>height+15)
    {
      y = random(-height, -25);
      x = random(width);
    } 
  }
}

class Snow
{
  float x;
  float y;
  Snow(float xIn, float yIn)
  { 
    x = xIn;
    y = yIn; 
  }
  void display()
  {
    image(snowflake, x, y);
    y = y+3;
    if (y>height+15)
    {
      y = random(-height, -25);
      x = random(width);
    } 
  }
}