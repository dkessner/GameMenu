
int gameState = 0;

PImage hill;
PImage bird;
PImage cherry;


int score = 0;
int alarm = 0;

float ay;

Cherry cherry1;
Cherry cherry2;
Cherry cherry3;
Cherry cherry4;

Bird bird1;


//ArrayList< cherry > cherries;

void setup()
{
  noCursor();
  fullScreen();
  ay = 0.3;
  
  hill = loadImage("hill.png");
  hill.resize(width,height+85);
  
  bird = loadImage("bird.png");
  bird.resize(200,200);
  
  cherry=loadImage("cherry.png");
  cherry.resize(70,70);
  
  //cherries = new ArrayList<cherry();
  
  //for int i = o; int<10, i++)
 // {
  //  cherry c = new cherry(
  //}
  
  cherry1 = new Cherry(500, 200);
  cherry2 = new Cherry(700, 500);
  cherry3 = new Cherry(100, 400);
  cherry4 = new Cherry(600, 500);
  
  bird1 = new Bird(100, 100, 0, 0);
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
    drawEnd();
  }
}

void drawStart()
{
  background(#509BDB);
  textAlign(CENTER, CENTER);
  textSize(75);
  text("Welcome to Zippy Bird", width/2, height/2 - 100);
  textSize(35);
  text("Press the Spacebar to play", width/2, height/2);
  textSize(35);
  text("Try to collect the cherries.  Use the up arrow to make the bird fly", width/2, height/2 + 100);
}


void drawGame()
{
  background(#509BDB);
  imageMode(CORNER);
  image(hill,0,0-10);
  textAlign(LEFT);
  textSize(35);
  text("score = " + score,width*0.05,height*0.05);
  text("time: " + (alarm-millis())/1000, width*0.05, height*0.1);
  
  cherry1.display();
  cherry2.display();
  cherry3.display();
  cherry4.display();
  bird1.display();

  if (bird1.xbird > width + 100)
   {
    cherry1.x = random(0, width);
    cherry1.y = random(0, height);
    cherry2.x = random(0, width);
    cherry2.y = random(0, height);
    cherry3.x = random(0, width);
    cherry3.y = random(0, height);
    cherry4.x = random(0, width);
    cherry4.y = random(0, height);
    
    bird1.xbird = -50;
    {
      cherry1.visible = true;
      cherry2.visible = true;
      cherry3.visible= true;
      cherry4.visible = true;
    }
  }
  
  if(cherry1.visible && dist(cherry1.x,cherry1.y,bird1.xbird, bird1.ybird) < 85)
  {
    score++;
    cherry1.visible = false;
  }
  
  if(cherry2.visible && dist(cherry2.x,cherry2.y,bird1.xbird, bird1.ybird) < 85)
  {
    score++;
    cherry2.visible = false;
  }
  
  if(cherry3.visible && dist(cherry3.x,cherry3.y,bird1.xbird, bird1.ybird) < 85)
  {
    score++;
    cherry3.visible = false;
  }
  
  if(cherry4.visible && dist(cherry4.x,cherry4.y,bird1.xbird, bird1.ybird) < 85)
  {
    score++;
    cherry4.visible = false;
  }
  
  if(millis() >= alarm)
  {
    gameState = 2;
  }
}


void drawEnd()
{
  background(#509BDB);
  textSize(100);
  textAlign (CENTER, CENTER);
  text("GAME OVER!", 775, 450);
  textSize(35);
  text("score = " + score,100,175);
  text("Try to beat your high score! Press the space bar to play again",775,550);
}



void keyPressed()
{
  if(key == ' ')
  {
    gameState++;
    alarm = millis() + 61000;
  } 
  
    if(gameState>2)
  {
    gameState = 0;
    alarm = millis()+ 61000;
    score = 0;
    bird1.xbird = 300;
    bird1.ybird = 400;
    cherry1.visible = true;
    cherry2.visible = true;
    cherry3.visible = true;
    cherry4.visible = true;
  }
  
  if(key == '1')
    score = score +10;
    
  if(key == '2')
    alarm = alarm +10000; 
    
  if (key == '3')
    score = 0;
  
  if(key == ',')
    alarm = alarm - 10000;
    
  if(keyCode == UP)
    bird1.vybird = -5;
}