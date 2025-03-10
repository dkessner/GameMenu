PFont testFont;

import processing.sound.*;
SoundFile explosionSound;

ArrayList<Cannonball> cannonballs;
Cannonball current;

ArrayList<Target> targets;

PImage[] explosion = new PImage[26];
boolean exploding = false; 
int explosionIndex = 0;
  
PImage cannonball;

PImage cannon;

int xCannon;
int yCannon;
int vxCannon = 0;
int gameState = 0;
float xExplosion = 0;
float yExplosion = 0;
int score = 0;

float vx = 0;
float vy = 0;


void setup()
{
  fullScreen();
  noCursor();
  testFont = createFont("AmericanCaptain.ttf", 40);
  textFont(testFont);
  textSize(50);
  explosionSound = new SoundFile(this, "explosion.mp3");
  
   xCannon = width/2;
   yCannon = height-50;
  
  cannonballs = new ArrayList<Cannonball>();
  
  cannonball = loadImage("cannonball.png");
  cannonball.resize(30, 30);
  current = new Cannonball(xCannon, yCannon, 0, 0);
 
  cannon = loadImage("cannon.png");
  cannon.resize(250, 150);

  targets = new ArrayList<Target>();
  targets.add(new Target(width/2, height/2, 5, 0));  
  
  imageMode(CENTER);
  for (int i = 0; i<explosion.length; i++)
    {
      explosion[i] = loadImage("explosion" + i + ".png");
      explosion[i].resize(200, 110);
    }
}

void drawStart()
{
  textAlign(CENTER);
  background(0);
  textSize(100);
  fill(255, 0, 0);
  text("Cannon Game", width/2, height-700);
  textSize(35);
  fill(255);
  text("Hit the targets moving across the sky. " +
       "If the target moves off of the screen before " +
       "you hit it, you will lose 5 points.  " +
       "Every target you hit gives you 5 points.  " + 
       "Reach 100 points and you win!", 
       width/7, height-500, 1000, 600);
  text("BY: Eleanor Hawley", width/2, height-200);
}

void drawEnd()
{
  background(0);
  fill(0, 255, 0);
  text("You win!", width/2, height-500);
  fill(255);
  text("Press any key to restart", width/2, height-400);
}



void drawExplosion()
{
   
    if (exploding == true)
    {
     if (explosionIndex < explosion.length)
       image(explosion[explosionIndex], xExplosion, yExplosion);
       
     if (frameCount%2 == 00)
       explosionIndex++;
       
     if (explosionIndex >= explosion.length)
     {
        exploding = false;
        explosionIndex = 0;
     }
    }
}

void checkForCollisions()
{
   
  for (Target target : targets)
  {
    for (Cannonball b : cannonballs)
    {
        if (exploding == false && dist(b.x, b.y, target.x, target.y) < 15 + 25)
        {
          exploding = true;
          xExplosion = target.x;
          yExplosion = target.y;
          b.visible = false;
          target.visible = false;
          target.x = -100;
          target.y = 100;
          explosionSound.play();
          score += 5;
        }
    }
  }
  
  for (Target target : targets)
    {
      if (target.visible == true && (target.x > width || target.x<0))
      {
        score -= 5;
        target.visible = false;
      }
    }
  
  if (score >= 100)
    gameState = 2;
}

void addTargets()
{
   if (frameCount % 100 == 0)
   {
      // add target 
      targets.add(new Target(random(25, width), 
                             random(25, height-200), 
                             random(-4, 4), 
                             0));
   }
}

void drawGame()
{
  //background
  background(#398BE0);
  fill(#178618);  
  stroke(#178618);
  rect(0,height-100, width, 100); 
  
  
  //cannon
  imageMode(CENTER);
  image(cannon, xCannon, yCannon);
 
  current.display();
  
  for (Cannonball b : cannonballs)
    b.display();
 
  for (Target t : targets)
  {
    t.display();
  }  
  
  fill(255);
  text(score, 35, 50);
  drawExplosion();
  checkForCollisions();
  addTargets();
  
  xCannon += vx;
  current.x = xCannon;
  
}


void draw()
{
  if (gameState == 0 )
    drawStart();
  else if (gameState == 1)
    drawGame();
  else
    drawEnd();
    
 
  
    for (int i=targets.size()-1; i>=0; i--)
      {
        Target temp = targets.get(i);
        if (temp.visible == false)
          targets.remove(i);
      }
    for (int i=cannonballs.size()-1; i>=0; i--)
      {
        Cannonball temp = cannonballs.get(i);
        if (temp.visible == false)
          cannonballs.remove(i);
      }
      
}



void keyPressed()
{
 
  if (gameState == 0)
  {
    gameState = 1;
  } 
  else if (gameState == 1)
  { 
     if (keyCode == RIGHT)
        vx = 5;
        
     else if (keyCode == LEFT)
        vx = -5;
       
 
     
     if (key == ' ')
     {
        current.vy = -5;
        cannonballs.add(current);
        current = new Cannonball(xCannon, yCannon-20, 0, 0);
     }
     else if (key == 'e')
     {
         exploding = true;
         explosionIndex = 0;
     }     
  }
  else if (gameState == 2)
  {
    gameState = 0;
    score = 0;
    cannonballs.clear();
    exploding = false;
    explosionIndex = 0;
  }
}

void keyReleased()
{
  vx = 0;
  vy = 0;
}
