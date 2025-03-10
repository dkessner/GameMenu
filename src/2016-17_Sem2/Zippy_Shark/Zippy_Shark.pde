int gameState = 0;

int sharkx = 50;
int sharky = 50;

int sharkvx = 0;
int sharkvy = 0;

int humanx = 1000;
int humany = 500;

int humanvx = 0;
int humanvy = 0;

int portalx = 800;
int portaly = 600;

int bubblex = 100;
int bubbley = 100;

int bubblevx = 0;
int bubblevy = 0;

ArrayList<Bubble> bubbleList;

PImage ocean;
PImage shark;
PImage human;
PImage portal;
PImage bubbles;

int alarm = 0;
int count = 20;
int humanalarm = 0;

boolean openPortal = false;
boolean showBubbles = false;
boolean humanFrozen = false;

void setup()
{
  fullScreen();
  noCursor();
  ocean = loadImage("ocean.png");
  ocean.resize(width, height);
  human = loadImage("human.png");
  human.resize(150,150);
  shark = loadImage("shark.png");
  shark.resize(250,250);
  portal = loadImage("portal.png");
  portal.resize(250, 250);
  bubbles = loadImage("bubbles.png");
  bubbles.resize(50, 50);
  
  //bubble = new Bubble(200, 200, 0, -3);
  
  bubbleList = new ArrayList<Bubble>();
}

void draw()
{
  if (gameState == 0)
  {
    drawStart();
  }
  else if(gameState ==1)
  {
    drawGame();
  }
  else if(gameState == 2)
  {
    sharkWins();
  }
  else if(gameState == 3)
  {
    humanWins();
  }


}

void drawPortal()
{
image(portal, portalx, portaly);
}

void drawStart()
{
  imageMode(CORNER);
  image(ocean, 0, 0);
  textAlign(CENTER, CENTER);
  textSize(65);
  text("Welcome to our Game!", width/2, height/2 - 200);
  textSize(35);
  text("This is a two player game - ", width/2, height/2 - 100);
  text("One Shark and one Human", width/2, height/2 - 50);
  text("Shark - try to eat the human before the timer runs out", width/2, height/2);
  text("Human - swim away from the shark until the timer runs out", width/2, height/2 + 50);
  text("Press the first green button to play", width/2, height/2 + 100);
  text("If the Human gets hit by the bubbles, they will freeze for 3 seconds", width/2, height/2 + 150);
  text("The Shark only gets 20 bubbles so use them wisely", width/2, height/2 + 200);
}

void drawGame()
{
  image(ocean, 0, 0);
  image(human, humanx, humany);
    humanx += humanvx;
    humany += humanvy;
  image(shark, sharkx, sharky);
    sharkx += sharkvx;
    sharky += sharkvy;
  
  for (Bubble b : bubbleList)
      b.display();
    
  if(humanx >= width)
    humanx = 0;
  if(humanx <= -10)
    humanx = width;
  if(humany >= height)
    humany = 0;
  if(humany <= -10)
    humany = height;
  if(sharkx >= width)
    sharkx = 0;
  if(sharkx <= -20)
    sharkx = width;
  if(sharky >= height)
    sharky = 0;
  if(sharky <= -20)
    sharky = height;
  
  if(openPortal == true)
  {
    drawPortal();
  }
 
  if(openPortal == true && dist(humanx, humany, portalx, portaly)<155)
  {
    humanx = (int)random(100, width - 100);
    humany = (int)random(100, height - 100);
    portalx = (int)random(100, width - 100);
    portaly = (int)random(100, height - 100);
  }
  
  if(dist(humanx, humany, sharkx, sharky)<100)
  {
     gameState = 2; 
  }
  textAlign(LEFT);
  text("time: " + (alarm-millis())/1000,width*0.05, height*0.05);
  if(millis() >= alarm)
  {
    gameState = 3;
  }
  if(millis() >= alarm - 15000)
  {
    openPortal = true;
  }
  
 if(millis() > humanalarm)
   humanFrozen = false;
  
  for (int i=bubbleList.size()-1; i>=0; i--)
  {
     if (bubbleList.get(i).y < -10)
         bubbleList.remove(i);
  }
  if (count <= 20)
    text("Sharks Bubbles ="+count, width*0.05, height*0.1);
 // if (count <= 0)
  //  text("Sharks Bubbles = 0" , width*0.15, height*0.1);
}


void sharkWins()
{
  textAlign(CENTER);
  image(ocean,0,0);
  textSize(80);
  text("SHARK WINS!", width/2, height/2);
}

void humanWins()
{
  textAlign(CENTER);
  image(ocean, 0, 0);
  textSize(80);
  text("HUMAN WINS!", width/2, height/2);
}

void keyPressed()
{
  if(key == ' ')
  {
    if (gameState == 0)
    {
      gameState++;
      alarm = millis() + 31000;
      openPortal = false;
    }
    else if (gameState == 2 || gameState == 3)
    {
      gameState = 0;
      alarm = millis() + 31000;
      humanx = 250;
      humany = 250;
      sharkx = 400;
      sharky = 400;
      bubbleList = new ArrayList<Bubble>();
    }
  }
  
  int s = 4;
  int h = 4;
  
  if (keyCode == UP)
  {
    sharkvy = -s;
  }
  else if(keyCode == DOWN)
  {
    sharkvy = s;
  }
  else if(keyCode == RIGHT)
  {
     sharkvx = s; 
  }
  else if (keyCode == LEFT)
  {
     sharkvx = -s; 
  }
   if (key == 'w')
  {
    if(humanFrozen == false)
    humanvy = -h;
  }
  else if(key == 's')
  {
    if(humanFrozen == false)
    humanvy = h;
  }
  else if(key == 'd')
  {
    if(humanFrozen == false)
     humanvx = h; 
  }
  else if (key == 'a')
  {
    if(humanFrozen == false)
     humanvx = -h; 
  }
  else if (key == '.')
  {
      if(count > 0)
        bubbleList.add(new Bubble(sharkx, sharky, (int)random(-4, 4), (int)random(-4, -1)));
        count = count-1;
      if(count <=0)
        count = 0;
  }
  
}

void keyReleased()
{
  if (keyCode == UP)
  {
    sharkvy = 0;
  }
  else if(keyCode == DOWN)
  {
    sharkvy = 0;
  }
  else if(keyCode == RIGHT)
  {
     sharkvx = 0; 
  }
  else if (keyCode == LEFT)
  {
     sharkvx = 0; 
  }
   if (key == 'w')
  {
    humanvy = 0;
  }
  else if(key == 's')
  {
    humanvy = 0;
  }
  else if(key == 'd')
  {
     humanvx = 0; 
  }
  else if (key == 'a')
  {
     humanvx = 0; 
  }
}