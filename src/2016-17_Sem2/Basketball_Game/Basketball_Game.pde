

float x=700;
int y=200;
int gameState=0;
int x1 = 450;
float vx = 0;
int y1=250;
int vy=5;
int basketballx = 700;
int score = 0;
float c = 1.2;
int keyvx = 3;
int time;
int startTime;
boolean visible = false;
int distraction2x = 200;
int distraction2y = 400;
int distraction2vx = 5;
int distraction2vy = 7;
boolean disvisible = false;


float basketbally, basketballvy, basketballay;

PImage basketball;
PImage hoop;
PImage distraction1;
PImage distraction2;
//PImage court;


void setup()
{
  fullScreen();
  basketball = loadImage("basketball.png");
  basketball.resize(130, 130);

  hoop = loadImage("hoop.png");
  hoop.resize(400, 400);

  distraction1 = loadImage("Distraction1.png");
  distraction1.resize(900, 700);
  
  distraction2 = loadImage("Distraction2.png");
  distraction2.resize(200,200);
 

  //court = loadImage("court.png");
  //court.resize(1200, 800);

  basketbally = 800;
  basketballvy = 0;
  basketballay = 0.3;
}
void drawStart()
{
  background(0);
  fill(225);
  textAlign(CENTER);
  textSize(35);
  text("Let's play some basketball!!!", 700, 350);
  text("Use the right and left arrow keys to move the ball.", 700, 400);
  text("Use the up arrow key to shoot the ball.", 700, 450);
  text("Try to make ten shots in the least amount of time possible!", 700, 500);
  text("Press space to continue.", 700, 600);
}


void drawGame()
{
  background(0);
  textSize(50);
  fill(255);

  time = (millis()-startTime)/1000;
  text("Time: " + time, 200, 800);

  fill(255);
  textSize(50);
  text("Score: " + score, 200, 725);


  imageMode(CENTER); 
  image(hoop, x, y);

  imageMode(CENTER);
  if(disvisible==true)
  {
    image(distraction2,distraction2x,distraction2y);
  }
  
  if(score >= 5)
  {
   disvisible = true;
   distraction2x = distraction2x+distraction2vx;
   distraction2y = distraction2y+distraction2vy;
  }
  
  if(distraction2x < 100||distraction2x > width-100)
  {
    distraction2vx = -distraction2vx;
  }
  
  if(distraction2y < 100||distraction2y > height-50)
  {
    distraction2vy = -distraction2vy;
  }


  basketballx += keyvx;

  x = x + vx;
  if (x<150||x>width-150)
  {
    vx = -vx;
  }

  if (dist(basketballx, basketbally, x, y) < 50)
  {
    score++;
    basketbally = 800;
    if (vx == 0)
      vx = 1;
    vx = vx * c;
  }


  {
    if (score == 10)
      gameState=2;
  }

  if (visible == true)
  {
    image(distraction1, 700, 500);
  }


  image(basketball, basketballx, basketbally);
  basketbally += basketballvy;
  basketballvy += basketballay;
  if (basketbally<50)
  {
    basketbally = 50;
  }
  if (basketbally>700)
  {
    basketbally = 700;
    basketballvy = 0;
  }
}

void drawEnd()
{
  background(255);
  fill(#F56105);
  ellipse(700, 465, 500, 500);
  stroke(0);
  strokeWeight(3);
  line(700, 715, 700, 215);
  stroke(0);
  strokeWeight(3);
  line(450, 465, 950, 465);
  noFill();
  arc(375, 463, 530, 533, radians(-48), radians(49));
  noFill();
  arc(1080, 463, 668, 533, radians(132), radians(227));


  fill(255);
  textAlign(CENTER);
  textSize(35);
  text("Press space to play again!!!", 700, 475);
  textSize(50);
  fill(0);
  text("Time: " + time, 200, 800);
}

void draw()
{
  if (gameState == 0)
  {
    drawStart();
  } else if (gameState == 1)
  {
    drawGame();
  } else if (gameState == 2)
  {
    drawEnd();
  }
}


void keyPressed()
{
  if (gameState == 0)
  {
    if (keyCode == ' ')
    {
      gameState++;
      startTime= millis();
    }
  } else if (gameState == 1)
  {
    if (keyCode == RIGHT)
    {
      keyvx = 5;
      //basketballx = basketballx + keyvx;
    } else if (keyCode == LEFT)
    {
      keyvx = -5;
      //basketballx = basketballx - keyvx;
    } else if (keyCode == UP && basketballvy==0)
    {
      basketballvy = -17.5;
    } else if (key == '3')
    {
      score = 9;
    } else if (key == '2')
    {
      score = 1;
    } else if (key == '1')
    {
      visible = true;
    }
  } else if (gameState>=2)
  {
    score = 0;
    gameState=0;
    vx = 0;
    x=700;
    y=200;
    basketballx=700;
  }
}

void keyReleased()
{
  keyvx = 0;
  visible = false;
}   