int gameState = 0;

float x=400;
float y=490;
float vxBella = 4;
float vyBella = 0;
float ay=0;
boolean bellaJumping = false;

int boatx=400;
int boaty=490;
int boatvx=4;
float x11 = 800;
int y11 = 800;
float x22 = 800;
int y22 = 700;
float x33 = 700;
int y33 = 800;
float x44 = 700;
int y44 = 700;
float x55 = 600;
int y55 = 800;
float x66 = 600;
int y66 = 700;

int vx1 = 3;
int vx2 = 4;
int vx3 = 5;
int vx4 = 6;
int vx5 = 7;
int vx6 = 8;
float vx=0;
float vy=0;
int x1 = width+50; //x
int ax = 5; //velocity
int y1 = 700; //y
int x2 = width+50;
int bx = 7;
int y2 = 600;
int x3 = width+50;
int cx = 6;
int y3 = 800;
int x4 = width+50;
int dx = 8;                                            
int y4 = 500;
int score = 0;

boolean visible = true;

PImage net;
PImage fish;
PImage salmon1;
PImage emmafish;
PImage SidneyFish;

float playerX = 500;
float playerY = 500;
float playervx = 0;
float playervy = 0;

float keyvx = 0;
float keyvy = 0;

void setup()
{
  fullScreen();
  noCursor();

  fish = loadImage("Fish.png");
  fish.resize (50, 50);

  salmon1 = loadImage("Salmon1.png");
  salmon1.resize (50, 50);
  
  emmafish = loadImage("Emma Cruzship.png");
  emmafish.resize (150,150);
  
  SidneyFish = loadImage("SidneyFish.png");
  SidneyFish.resize (150,150);
  
  net = loadImage("Net.png");
  net.resize(200, 220);
}
void bella(float x, float y)
{
  fill(255);
  ellipse (x, y, 50, 50); //head
  line(x, y+25, x, y+90);//body
  line(x, y+90, x-25, y+105);//left leg
  line(x, y+90, x+25, y+105);//right leg
  fill(0);
  ellipse (x+10, y-5, 5, 5);//right eye
  arc(x, y+10, 10, 10, 0, PI);//smile
  ellipse(x-10, y-5, 5, 5);//left eye
  line(x, y+45, x-30, y+25); //left arm
  line(x, y+45, x+30, y+25); //right arm
  strokeWeight(6);
  line(x-20, y-25, x-40, y+40);//hair
  line(x+20, y-25, x+40, y+40); //hair
  line(x-20, y-25, x+20, y-25);//hair
  strokeWeight(1);
  fill(#522C0F);
  arc(boatx-50, boaty+60, 200, 200, 0, PI);//boat
  line(boatx-75, boaty+60, boatx-75, boaty-40);
  fill(255, 0, 0);
  triangle(boatx-75, boaty-30, boatx-75, boaty-90, boatx-150, boaty-30);

  
  if (visible == true)
  {

    fill(0);
    textSize(15);
    textAlign(CENTER);
    text("I want to go fishing! Yayayayayayayaya!", x+300, y-75);
    text("...1 hour later...", x+300, y-50);
    text("I want to go fishing! Yayayayayayayaya!", x+300, y-25);
    text("...2 hours later...", x +300, y);
    text("I want to go fishing! Yayayayayayayaya!", x+300, y+25);
    text("...3 hours later...", x+300, y+50);
    text("Oh no! I cannot catch any fish! I should jump off the boat and try.", x+300, y+75);
    text("Press 1 to continue!", x+300, y+100);
    stroke(#A27126);
  strokeWeight(3);
  line(x+30, y+25, x+100, y+25);//fishing rod
  stroke(0);
  strokeWeight(1);
  line(x+100, y+25, x+100, y+170);//fishing line
  
}
    fill(#075FF2);
  rect(0, 650, width, 650);
}

void drawStart()
{
  background(#05F2EC);
  
  stroke(0);
  strokeWeight(3);

  background(#05F2EC);
  
  stroke(0);
  strokeWeight(3);

  // bella
  bella(x, y);
  x=x+vxBella;
  y+=vyBella;  
  vyBella+=ay;
  
  if (bellaJumping == false)
  {
    if (x>=900||x<=300)
    {
      vxBella=-vxBella;
    }
  }
  
  boatx=boatx+boatvx;
  if (boatx>=900||boatx<=300)
  {
    boatvx=-boatvx;
  }

    imageMode(CENTER);
  image(fish, x11, y11); //fish
  x11 = x11-vx1;
  if (x11 < -50)
  {
    x11 = width+50;
  }
  image(salmon1, x22, y22); //salmon
  x22 = x22-vx2;
  if (x22 < -50)
  {
    x22 = width+50;
  }
  image(salmon1, x33, y33);
  x33 = x33-vx3;
  if (x33 < -50)
  {
    x33 = width+50;
  }
  image(fish, x44, y44);
  x44 = x44-vx4;
  if (x44 < -50)
  {
    x44 = width+50;
  }
  image(salmon1, x55, y55);
  x55 = x55-vx5;
  if (x55 < -50)
  {
    x55 = width+50;
  }

  image(fish, x66, y66);
  x66 = x66-vx6;
  if (x66 < -50)
  {
    x66 = width+50;
  }
  
  if(y>=1000)
  {
    gameState++;
  }
}
void drawGame()
{
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("Bella Rhow Your Boat was rowing her boat and wanted to catch some fish.", width/2,300);
  text("However, she could not get any fish so she jumped off her boat.",width/2,350);
  text("Help Bella get some fish! If she gets them in the net she gets a point.",width/2,400);
  text("If you catch Emma Cruzship the salmon, then you get ten points!", width/2,450);
  text("If you catch Sidney the piranha, then you lose all your points and die!", width/2, 500);
  text("Press space to start", width/2, 600);
}
void drawEnd()
{
background(#1A18ED);

fill(#05FFFD);
rect(0, 0, width, 150);

fill(0);
textSize(30);
text("Score: " + score,80,50);
if(dist(playerX, playerY, x1, y1) < 50)
score ++;

if(dist(playerX-15, playerY-110, x1, y1) < 30)
{
  score ++;
x1 = -50;
}


imageMode(CENTER);
image(fish, x1, y1); //fish
x1 = x1 - ax;
if(x1<-100)
{
  x1 = width+50;
  ax = (int)random(1,10);
  y1 = (int)random(200,800);
}


if(dist(playerX-15, playerY-110, x2, y2) < 30)
{
  score ++;
  x2=-50;
}

image(salmon1, x2, y2); //salmon
x2 = x2-bx;
if(x2<-125)
{
  x2 = width+50;
  bx = (int)random(1,10);
  y2 = (int)random(200,800);
}

if(dist(playerX-15, playerY-110, x3, y3) < 30)
{
score= score + 10;
x3 = -50;
}


image(emmafish, x3, y3); //emmacruzfish
x3=x3-cx;
if(x3<-100)
{
  x3 = width+50;
  cx = (int)random(6,12);
  y3 = (int)random(200,800);
}


if(dist(playerX-15, playerY-110, x4, y4) < 30)
{
  score=0;
x4 = -50;
gameState=3;
}

image(SidneyFish, x4,y4); //sidneyfish
x4=x4-dx;
if (x4<-100)

{
  x4 = width+50;
  dx = (int)random(6,12);
  y4 = (int)random(200,800);
}

playerX += keyvx;
playerY += keyvy;

imageMode(CORNER);
image(net, playerX-210,playerY-170); //net


fill(255);
ellipse (playerX, playerY, 50, 50); //head
stroke(0);
strokeWeight(7);
line(playerX+25,playerY-10,playerX-35,playerY-25); //hair
line(playerX+25,playerY-10,playerX-25,playerY-35);//hair

stroke(0);
strokeWeight(3);
line(playerX-25, playerY, playerX-100, playerY); //body

stroke(0);
strokeWeight(3);
line(playerX-100, playerY, playerX-110, playerY-25); //leg

stroke(0);
strokeWeight(3);
line(playerX-100, playerY, playerX-110, playerY+25); //leg

line(playerX-60,playerY,playerX-40,playerY-25); //arm
line(playerX-60,playerY,playerX-40,playerY+25); //arm

fill(0);
ellipse(playerX+15, playerY, 8, 8); //eye

stroke(0);
strokeWeight(3);
line(playerX+5, playerY+8, playerX+17, playerY+12); 

textSize(50);
text("SALMON FAMINE!!!", width/2,100);

if(playerX < -30)
{
  playerX = width+25;
}
if(playerX > width+30)
{
  playerX = -25;
}
if(playerY < -30)
{
  playerY = height+25;
}
if(playerY>height+30)
{
  playerY=-25;
}
}

void drawFinal()
{
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(25);
  text("Oh no! Bella got eaten! Press space to try again.",width/2,450);
}



void keyPressed() {
  if (key == '1')
  {
    vxBella=3;
    vyBella=-5;
    ay = .1;
    bellaJumping = true;
    boatvx = 0;
    visible = false;
  }  

  if(keyCode == ' ')
  {
    gameState++;
  }
  if(gameState>3)
  {
    gameState=0;
    y = 490;
    x = 400;
    vxBella = 4;
    boatx=400;
    boaty=490;
    boatvx=4;
    vyBella = 0;
    ay=0;
    visible = true;
    bellaJumping = false;
  }
{
    if (keyCode == RIGHT)
    {
      keyvx = 8;
    } 
    else if (keyCode == LEFT)
    {
      keyvx = -8;
    } 
    else if (keyCode == UP)
    {
      keyvy = -8;
    }
    else if (keyCode == DOWN)
    {
      keyvy = 8;
    }
  }
}

void keyReleased()
{
  keyvx = 0;
  keyvy = 0; 
}