PFont font;
int x;
int y;
int a;
int b;
int va=(int)random (3,6);
int vb=(int)random (3,6);
int vx=0;
int vy=0;
int state=1;
int score1=0;
int score2=0;
int alarm1=10000000;
int alarm2=10000000;

void setup()
{
  //size(800,800);
  fullScreen();
  background(0);
  font = createFont("Pixeled.ttf", 20);
  x=height/2;
  y=height/2;
  a=width/2;
  b=height/2;
  noCursor();
}


int color1 = color(255);
int color2 = color(0);
int currentColor = color1;

void drawStart ()
{
  background(0);
  fill(255);
  textFont(font);
  fill(255);
  textSize(150);
  textAlign(CENTER);
  text("PONG", width/2,height/3);
  textSize(12);
  text("BY: OLIVIA HOCKLEY-RODES", width/2, 11*height/12);
  textSize(16);
  fill(currentColor);
  text("PRESS ANY KEY TO BEGIN", width/2, 7*height/9);
  if (frameCount%30 == 0)
  {
      if (currentColor == color1)
        currentColor = color2;
      else
        currentColor = color1;
  }
  
  textSize(20);
  fill(255,0,0);
  text("PLAYER 1: UP TO MOVE UP, DOWN TO MOVE DOWN.", width/2, 5*height/10);
  fill (0,0,255);
  text("PLAYER 2: W TO MOVE UP, S TO MOVE DOWN.", width/2, 11*height/20);
}


void drawPlayer1 ()
{
  background(0);
  fill(255);
  textSize(30);
  fill(255,0,0);
  textAlign(CENTER);
  text("PLAYER 1 WINS!", width/2, height/2);
  text("CLICK TO PLAY AGAIN", width/2,height/1.5);
}


void drawPlayer2()
{
  background(0);
  fill(255);
  textSize(30);
  fill(0,0,255);
  textAlign(CENTER);
  text("PLAYER 2 WINS!", width/2, height/2);
  text("CLICK TO PLAY AGAIN", width/2, height/1.5);
}


void drawGame()
{
  background(0);
    fill(0,0,255);
    rect(20,x,20,80);
    fill (255,0,0);
    rect(width-40,y,20,80);
    fill(255);
    ellipse(a,b,20,20);
    text("" +score1,20,30);
    text("" +score2, width-20,30);
    a=a+va;
    b=b+vb;
    
    // pause after each score
    
    if (millis()>alarm1)
    {
      va=(int)random(-2,-5);
      vb=(int)random(2,5);
      
      if (random(0,1) < .5)
       {
         vb=-vb;
       }
      alarm1 = 10000000;
    }
    
    if (millis()>alarm2)
    {
      va=(int)random(2,5);
      vb=(int)random(2,5);
      if (random(0,1) < .5)
      {
        vb=-vb;
      }
      
      alarm2 = 10000000;
    }
    
    //paddle movement
    if (x>-10-vx && x<height-70-vx)
      x=x+vx;
    
    if (y>-10-vy &&  y<height-70-vy)
      y=y+vy;
    
    //ball bounce on paddle
    if (a < 48 && a > 28 && b > x && b < x + 80)
    {
      va=-va;
    }
    if (a > width-48 && a < width-28 && b > y && b < y + 80)
    {
      va=-va;
    }
    
    //ball bounce on wall
    if (b <= 8)
    {
      vb=-vb;
    }
    if (b >= height-8)
    {
      vb=-vb;
    }
    
    // add velocity
    if (a >= width-48 && a <= width-28 && b > y && b < y + 80 && (vy >= 1 || vy <= -1))
    {
      if (va > 0)
        va=va+1;
      else if (va < 0)
        va=va-1;
      if (vb > 0)
        vb=vb+1;
      else if (vb < 0)
        vb=vb-1;
    }
    
    if (a <= 48 && a >= 28 && b > x && b < x + 80 && (vx >= 1 || vx <= -1))
    {
      if (va > 0)
        va=va+1;
      else if (va < 0)
        va=va-1;
      if (vb > 0)
        vb=vb+1;
      else if (vb < 0)
        vb=vb-1;
    }
 
    
    //score addition
    if (a < 0)
    {
      score2++;
      a=width/2;
      b=height/2;
      va=0;
      vb=0;
      alarm1=millis()+1500;
    }
    if (a > width)
    {
      score1++;
      a=width/2;
      b=height/2;
      va=0;
      vb=0;
      alarm2=millis()+1500;
    }
    
    //winning screens
    if (score1 == 10)
    {
      state = 4;
    }
    if (score2 == 10)
    {
      state = 3;
    }
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
  else if (state == 3)
  {
    drawPlayer1();
  }
  else if (state == 4)
  {
    drawPlayer2();
  }
}


void keyPressed()
{
  if (state == 1)
  {
    state = 2;
  }
  if (key == 'w')
  {
     vy=-12;
  }
  else if (key == 's')
  {
    vy=12;
  }
  else if (keyCode == DOWN)
  {
    vx=12;
  }
  else if (keyCode == UP)
  {
    vx=-12;
  }
}


void keyReleased()
{
  if (keyCode == DOWN || keyCode == UP)
  {
    vx=0;
  }
  else if (key == 'w' || key == 's')
  {
    vy=0;
  }
}


void mousePressed()
{
  if (state == 3)
  {
    state = 1;
    a=width/2;
    b=height/2;
  }
  if (state == 4)
  {
    state = 1;
    a=width/2;
    b=height/2;
  }
}
