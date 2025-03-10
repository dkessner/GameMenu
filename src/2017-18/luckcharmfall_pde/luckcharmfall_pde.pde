int score = 0;
int lives = 3;
int state = 1;

PImage cerealspill;
PImage bowl;
PImage charm1;
PImage charm2;
PImage charm3;
PImage charm4;
PImage charm5;
PImage charm6;
PImage charm7;
PImage boring1;
PImage boring2;
PImage boring3;
PImage boring4;

int vfall;

int xbowl;
int ybowl;

int xcharm1;
int xcharm2;
int xcharm3;
int xcharm4;
int xcharm5;
int xcharm6;
int xcharm7;
int ycharm1;
int ycharm2;
int ycharm3;
int ycharm4;
int ycharm5;
int ycharm6;
int ycharm7;

int xboring1;
int xboring2;
int xboring3;
int xboring4;
int yboring1;
int yboring2;
int yboring3;
int yboring4;








void setup()
{
  fullScreen();
  noCursor();
  imageMode(CENTER);

  charm1 = loadImage("charm1.png");
  charm2 = loadImage("charm2.png");
  charm3 = loadImage("charm3.png");
  charm4 = loadImage("charm4.png");
  charm5 = loadImage("charm5.png");
  charm6 = loadImage("charm6.png");
  charm7 = loadImage("charm7.png");
  boring1 = loadImage("boring1.png");
  boring2 = loadImage("boring2.png");
  boring3 = loadImage("boring3.png");
  boring4 = loadImage("boring4.png");
  
  cerealspill = loadImage("lucky charms spilling.png");
  bowl = loadImage("luckygamebowl.png");
  
  xbowl = width * 1/2;
  ybowl = height * 9/10;
  
  xcharm1 = width * 1/12;
  xcharm2 = width * 2/12;
  xcharm3 = width * 4/12;
  xcharm4 = width * 5/12;
  xcharm5 = width * 7/12;
  xcharm6 = width * 8/12;
  xcharm7 = width * 10/12;
  
  ycharm1 = height * 1/22;
  ycharm2 = height * 2/22;
  ycharm3 = height * 4/22;
  ycharm4 = height * 5/22;
  ycharm5 = height * 7/22;
  ycharm6 = height * 8/22;
  ycharm7 = height * 11/22;

  xboring1 = width * 3/12;
  xboring2 = width * 6/12;
  xboring3 = width * 9/12;
  xboring4 = width * 11/12;
  yboring1 = height * 3/22;
  yboring2 = height * 6/22;
  yboring3 = height * 9/22;
  yboring4 = height * 10/22;


}







void drawStart() 
{
  background(#FFDEDE);
  image (cerealspill, 500, 325, 1100, 650);
  textSize(65);
  textAlign(CENTER);
  fill(0);
  text("Collect marshmallow charms and avoid cereal.", width * 1/2, height * 8/20);
  text("Use side arrow keys to move bowl left and right.", width * 1/2, height * 10/20);
  text("Press SPACE key to begin.", width * 1/2, height * 12/20);
}








void drawGame() 
{
background(#FFDEDE);
textSize(60);
fill(0);
text("score:" + score, width * 1/14, height * 1/14);
text("lives:" + lives, width * 1/14, height * 2/14);
image (bowl, xbowl, ybowl, 300, 300);

if (dist(xbowl, ybowl, xcharm1, ycharm1)<50)
   {
     score ++;
     ycharm1 = -50;
   }
   
if (dist(xbowl, ybowl, xcharm2, ycharm2)<150)
   {
     score ++;
     ycharm2 = -50;
   }
if (dist(xbowl, ybowl, xcharm3, ycharm3)<150)
   {
     score ++;
     ycharm3 = -50;
   }
if (dist(xbowl, ybowl, xcharm4, ycharm4)<150)
   {
     score ++;
     ycharm4 = -50;
   }
if (dist(xbowl, ybowl, xcharm5, ycharm5)<150)
   {
     score ++;
     ycharm5 = -50;
   }
if (dist(xbowl, ybowl, xcharm6, ycharm6)<150)
   {
     score ++;
     ycharm6 = -50;
   }
if (dist(xbowl, ybowl, xcharm7, ycharm7)<150)
   {
     score ++;
     ycharm7 = -50;
   }
   
if (dist(xbowl, ybowl, xboring1, yboring1)<150)
   {
     lives --;
     yboring1 = -50;
   }
if (dist(xbowl, ybowl, xboring2, yboring2)<150)
   {
     lives --;
     yboring2 = -50;
   }
if (dist(xbowl, ybowl, xboring3, yboring3)<150)
   {
     lives --;
     yboring3 = -50;
   }
if (dist(xbowl, ybowl, xboring4, yboring4)<150)
   {
     lives --;
     yboring4 = -50;
   }
  
if (lives == 0)
   {
    state = 3;
   }











image(boring1, xboring1, yboring1, 80, 80);
yboring1 += 6;
if(yboring1 > height)
  {
   yboring1 = 0;
   xboring1 = (int)random(0, width);
  }
image(boring2, xboring2, yboring2, 80, 80);
yboring2 += 7;
if(yboring2 > height)
  {
   yboring2 = 0;
   xboring2 = (int)random(0, width);
  }
image(boring3, xboring3, yboring3, 80, 80);
yboring3 += 5;
if(yboring3 > height)
  {
   yboring3 = 0;
   xboring3 = (int)random(0, width);
  }
image(boring4, xboring4, yboring4, 80, 80);
yboring4 += 6;
if(yboring4 > height)
  {
   yboring4 = 0;
   xboring4 = (int)random(0, width);
  }
image(charm1, xcharm1, ycharm1, 80, 80);
ycharm1 += 6;
if(ycharm1 > height)
  {
   ycharm1 = 0;
   xcharm1 = (int)random(0, width);
  }
image(charm2, xcharm2, ycharm2, 80, 80);
ycharm2 += 7;
if(ycharm2 > height)
  {
   ycharm2 = 0;
   xcharm2 = (int)random(0, width);
  }
image(charm3, xcharm3, ycharm3, 80, 80);
ycharm3 += 5;
if(ycharm3 > height)
  {
   ycharm3 = 0;
   xcharm3 = (int)random(0, width);
  }
image(charm4, xcharm4, ycharm4, 80, 80);
ycharm4 += 6;
if(ycharm4 > height)
  {
   ycharm4 = 0;
   xcharm4 = (int)random(0, width);
  }
image(charm5, xcharm5, ycharm5, 80, 80);
ycharm5 += 7;
if(ycharm5 > height)
  {
   ycharm5 = 0;
   xcharm5 = (int)random(0, width);
  }
image(charm6, xcharm6, ycharm6, 80, 80);
ycharm6 += 8;
if(ycharm6 > height)
  {
   ycharm6 = 0;
   xcharm6 = (int)random(0, width);
  }
image(charm7, xcharm7, ycharm7, 80, 80);
ycharm7 += 5;
if(ycharm7 > height)
  {
   ycharm7 = 0;
   xcharm7 = (int)random(0, width);
  }
}









void drawEnd()
{
  background(#BCEEFF);
  textSize(100);
  fill(#10CB0E);
  text("score:" + score, width * 1/2, height * 4/10);
  textSize(100);
  text("Press space key to play again!", width * 1/2, height * 5/10) ;
}









void draw()
  {
      if (state == 1)
      {
        drawStart();
      }
      else if (state == 2)
      {
        drawGame();
      }
      else
      {
        drawEnd();
      }
  }
  
  
  
  
  
  
  
  
  
 
void keyPressed()
{
  if (state == 1)
   {
      if (key == ' ')
      state = 2;
   }
  else if (state == 2)
  { 
     if (keyCode == RIGHT)
     {
        xbowl += 15;
     }
    else if (keyCode == LEFT)
     {
        xbowl -= 15;     
     }
  }
  else if (state == 3)
   {
    if (key == ' ')
    {
      state = 1;
      score = 0;
      lives = 3;
    }
   }
}
