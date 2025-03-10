
ArrayList <Rock> Rocks;
PImage turtle;
PImage rock;
PImage dirt;
PImage sand;
int x;
int y;
int xVel;
int wVel;
int n = -60;
int m = 350; 
int t = 30;
int timer, interval;
boolean display; 
int state = 0;
int xF, yF; 
Rock myRock;
void setup()
{
  fullScreen();
  //size(700, 700);
  xF = width/70;
  yF = height/70;
  x = 1;
  y = 1; 
  interval = 1000;
  timer = millis();

  textAlign(CENTER);
  textSize(30);

  timer = millis();
  interval = 1000;
  display = true;

  turtle = loadImage("Turtle.png");
  turtle.resize(75, 60);
  rock = loadImage("rock.png");
  dirt = loadImage("dirt.png");
  sand = loadImage("sand.png");
  sand.resize(xF*75, xF * 4);
  myRock = new Rock(100, 200, 50, 2, 5, 2);
  Rocks = new ArrayList<Rock>();
  for (int i = 0; i < 10; i++)
  {
    Rock b = new Rock(random(0, xF*70), 0, 60, 0, random(3, 5), 60);
    Rocks.add(b);
  }
}

void draw()
{
  if (state == 0)
    draw_start();
  else if (state ==1)
    draw_game();
  else if (state == 2)
    end_game();
  else if (state == 3)
    draw_restart();
    else if(state == 4) 
    draw_2();
    else if(state ==5)
    draw_end2();
    else if(state ==6)
    draw_3();
    else if(state ==7)
    draw_end3();
    else if(state ==8)
    draw_4();
    else if(state ==9)
    draw_end4();
    else if(state ==10)
    draw_5();
    else if(state ==11)
    draw_end5();
    else if(state ==12)
    draw_6();
      else if(state ==13)
    draw_end6();
        else if(state ==14)
    draw_7();
    else if(state ==15)
    draw_end7();
    
}

void draw_game()
{
  background(108, 205, 255);
  n = n + xVel;
  
  

  check_c();
  if (n > xF*70)
state = 3;

  if (n < -60)
    n = -60;
  if (n > xF*75)
    n = xF*70;
  if (millis() > timer + interval) {
    timer = millis();

    t--;
    if (t < 0)
      state = 2;
    if (n > xF*70)
      state = 3;
  }


  text(t, width/2, height/2);




  for (Rock b : Rocks) {
    b.displayRock();
  }
}



class Rock 
{
  float x, y, w, xVel, yVel, h;
  int c; 

  Rock(float tempX, float tempY, float tempW, float tempXVel, float tempYVel, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    xVel = tempXVel;
    yVel = tempYVel;
    c = color(random(255), random(255), random(255));
  }



  void displayRock() {

    fill(c);
    x=x+xVel;
    y+= yVel;


    if (x > width || x <0 ) {
      xVel *= -1;
    }

    if (y > height || y <0) {
      yVel *= -1;
    }
    //drawball

    draw_rock(x, y);

    draw_turtle(n, m);

    draw_sand(0, yF*68);
  }

  void draw_turtle(int turtleX, int turtleY )
  {
    image(turtle, turtleX, turtleY);
  }
  void draw_sand(int sandX, int sandY )
  {
    image(sand, sandX, sandY);
  }

  void draw_dirt(int dirt1, int dirt2)
  {
    image(dirt, dirt1, dirt2, 70, 60);
  }

  void draw_rock(float rock1, float rock2)
  {
    image(rock, rock1, rock2, w, w);
  }
}

void end_game()
{
  background(255, 0, 0);
  textSize(xF*2);
  text("YOU DIED", xF*35, yF*35);
  text("PRESS THE SPACEBAR TO RESTART!!!", xF*35, yF*50);
}

void draw_start()
{
  background(55, 175, 108);
  textSize(xF*2);
  stroke(0);
  fill(255);
  text("Start the game and avoid the rocks", xF*35, yF*20);
  text("Use the arrow keys to move the turtle, try and get to the other side", xF*35, yF*50);
  text("Press Spacebar to begin", xF*35, yF*35);
}

void draw_restart()
{
  background(170, 225, 255);
  textSize(xF*2);
  text("You have beat the Blue Sea, But can you handle the RED SEA??", xF*35, yF*35);
  text("(Press the Spacebar to continue)", xF*35, yF*60);
}

void draw_end2()
{
  background(255, 144, 144);
  textSize(xF*2);
  text("So it seems you have beaten the Red Sea....but can you beat...", xF*35, yF*35);
  text("The Purple Sea", xF*35, yF*50);
  
}

void draw_end3()
{
  background(219,143,252);
  textSize(xF*2); 
  text("So it seems you have beaten the Purple Sea....but can you beat...", xF*35, yF*35);
  text("The Orange Sea, but this time stay alive until the timer runs out", xF*35, yF*50);
  
}
void draw_end4()
{
  background(252,195,69);
  textSize(xF*2);
  text("So it seems you have beaten the Orange Sea....but can you beat...", xF*35, yF*35);
  text("The Green Sea", xF*35, yF*50);
  
}

void draw_end5()
{
  background(88,234,199);
  textSize(xF*2);
  text("So it seems you have beaten the Green Sea....but can you beat...", xF*35, yF*35);
  text("The Gray Sea", xF*35, yF*50);
  
}

void draw_end6()
{
  background(165,165,160);
  textSize(xF*2);
  text("So it seems you have beaten the Gray Sea....but can you survive...", xF*35, yF*35);
  text("The 7th Sea", xF*35, yF*50);
  
}

void draw_end7()
{
  background(255);
  noStroke();
  fill(255, 0, 0);
  rect(0, 0, xF * 100, yF * 10);
  fill(252,195,69);
  rect(0, yF * 10, xF * 100, yF * 10);
  fill(252,245,8);
  rect(0, yF * 20, xF * 100, yF * 10);
  fill(50,234,9);
  rect(0, yF * 30, xF * 100, yF * 10);
  fill(9,199,234);
  rect(0, yF * 40, xF * 100, yF * 10);
  fill(31,158,234);
  rect(0, yF * 50, xF * 100, yF * 10);
  fill(174,42,232);
  rect(0, yF * 60, xF * 100, yF * 10);
  stroke(0);
  fill(0);
  PFont font;
font = loadFont("font2.vlw");
textFont(font, 48);
  text("YOU HAVE SURVIVED THE 7 SEAS!", xF*35, yF*35);
  
}


void draw_2()
{
  
  background(255, 144, 144);
  if (m < 0)
  m = 0;
  
  if (m> yF * 67)
  m = yF * 67;
  
  n = n + xVel;
  m = m + wVel;

  check_c();
if (n > xF*70)
state = 5;
  if (n < -60)
    n = -60;
  if (n > xF*75)
    n = xF*70;
  if (millis() > timer + interval) {
    timer = millis();

    t--;
    if (t < 0)
      state = 2;
    if (n > xF*70)
      state = 3;
  }


  text(t, width/2, height/2);




  for (Rock b : Rocks) {
    b.displayRock();
  }
}

void draw_3()
{
  
  background(219,143,252);
  if (m < 0)
  m = 0;
  
  if (m> yF * 67)
  m = yF * 67;
  n = n + xVel;
  m = m + wVel;

  check_c();
if (n > xF*70)
state = 7;
  if (n < -60)
    n = -60;
  if (n > xF*75)
    n = xF*70;
  if (millis() > timer + interval) {
    timer = millis();

    t--;
    if (t < 0)
      state = 2;
    if (n > xF*70)
      state = 3;
  }


  text(t, width/2, height/2);




  for (Rock b : Rocks) {
    b.displayRock();
  }
}

void draw_4()
{
  
  background(252,195,69);
  if (m < 0)
  m = 0;
  
  if (m> yF * 67)
  m = yF * 67;
  n = n + xVel;
  m = m + wVel;

  check_c();

  if (n < -60)
    n = -60;
  if (n > xF*75)
    n = xF*70;
  if (millis() > timer + interval) {
    timer = millis();

    t--;
    if (t < 1)
      state = 9;
  }


  text(t, width/2, height/2);




  for (Rock b : Rocks) {
    b.displayRock();
  }
}

void draw_5()
{
  
  background(88,234,199);
  if (m < 0)
  m = 0;
  
  if (m> yF * 67)
  m = yF * 67;
  n = n + xVel;
  m = m + wVel;

  check_c();

  if (n < -60)
    n = -60;
  if (n > xF*75)
    n = xF*70;
  if (millis() > timer + interval) {
    timer = millis();

    t--;
    if (t < 1)
      state = 11;
  }


  text(t, width/2, height/2);




  for (Rock b : Rocks) {
    b.displayRock();
  }
}

void draw_6()
{
  
  background(165,165,160);
  if (m < 0)
  m = 0;
  
  if (m> yF * 67)
  m = yF * 67;
  n = n + xVel;
  m = m + wVel;

  check_c();

  if (n < -60)
    n = -60;
  if (n > xF*75)
    n = xF*70;
  if (millis() > timer + interval) {
    timer = millis();

    t--;
    if (t < 1)
      state = 13;
  }


  text(t, width/2, height/2);




  for (Rock b : Rocks) {
    b.displayRock();
  }
}

void draw_7()
{
  
  background(31,158,234);
  if (m < 0)
  m = 0;
  
  if (m> yF * 67)
  m = yF * 67;
  if( n > xF * 70)
  n = xF * 70;
  n = n + xVel;
  m = m + wVel;

  check_c();

  if (n < -60)
    n = -60;
  if (n > xF*75)
    n = xF*70;
  if (millis() > timer + interval) {
    timer = millis();

    t--;
    if (t < 1)
      state = 15;
  }


  text(t, width/2, height/2);




  for (Rock b : Rocks) {
    b.displayRock();
  }
}


void check_c()
{
  for (Rock b : Rocks)
  {
    /*
    if(dist(b.x, b.y, n, m) <  b.w + n) 
     {
     println("got hit");
     text("got hit ", 100, 100);
     }
     */
    if (b.x + b.w/2 > n - 30 && b.x - b.w/2 < n + 30 && b.y + b.h > m - 30 && b.y < m + 30)

    {
      state = 2;
    }
  }
}

void keyPressed()
{
  if (state == 0)
  {
    state = 1;
  }

  if (state == 1)
    draw_game();
  
   if (state == 4)
    draw_2();
  if (key == ' ' && state == 3)
  {

    state = 4;
    m = 300;
    n = -60;
    t = 20;
    for(Rock b: Rocks)
    {
    b.x = (random(0, xF*70));
    b.y = (random(0, yF * 70));
    b.w = 60;
    b.h = 0;
    b.xVel = random(3, 5);
    b.yVel = random(3, 5);
    }
    
  }
  if (key == ' ' && state == 5)
  {

    state = 6;
    m = 300;
    n = -60;
    t = 20;
    for(Rock b: Rocks)
    {
    b.x = (random(0, xF*70));
    b.y = (random(0, yF * 70));
    b.w = 60;
    b.h = 0;
    b.xVel = random(3, 5);
    b.yVel = random(3, 5);
    }
    
  }
   if (key == ' ' && state == 7)
  {

    state = 8;
    m = 300;
    n = -60;
    t = 25;
    for(Rock b: Rocks)
    {
    b.x = (random(0, xF*70));
    b.y = (random(0, yF * 70));
    b.w = 60;
    b.h = 0;
    b.xVel = random(3, 5);
    b.yVel = random(3, 5);
    }
    
  }
  
  if (key == ' ' && state == 9)
  {

    state = 10;
    m = 300;
    n = -60;
    t = 30;
    for(Rock b: Rocks)
    {
    b.x = (random(0, xF*70));
    b.y = (random(0, yF * 70));
    b.w = 60;
    b.h = 0;
    b.xVel = random(4, 6);
    b.yVel = random(4, 6);
    }
    
  }
   if (key == ' ' && state == 11)
  {

    state = 12;
    m = 300;
    n = -60;
    t = 35;
    for(Rock b: Rocks)
    {
    b.x = (random(0, xF*70));
    b.y = (random(0, yF * 70));
    b.w = 60;
    b.h = 0;
    b.xVel = random(5, 6);
    b.yVel = random(5, 6);
    }
    
  }
  if (key == ' ' && state == 13)
  {

    state = 14;
    m = 300;
    n = -60;
    t = 40;
    for(Rock b: Rocks)
    {
    b.x = (random(0, xF*70));
    b.y = (random(0, yF * 70));
    b.w = 60;
    b.h = 0;
    b.xVel = random(3, 7);
    b.yVel = random(3, 7);
    }
    
  }
 

  if (keyCode == LEFT)
  {
    xVel = -3;
  }

  if (keyCode == RIGHT)
  {
    xVel = 3;
  }
 

  /*if (state == 2)
   state = 0;
   }*/
  if (key == ' ' && state == 2)
  {

    state = 0;
    m = 300;
    n = -60;
    t = 30;
     for(Rock b: Rocks)
    {
    b.x = random(0, xF*70);
    b.y = 0;
    b.w = 60;
    b.h = 60;
    b.xVel = 0;
    b.yVel = random(3, 5);
    }
  }
  
 
 
 if (keyCode == UP)
 {
 wVel = -3;
 }
 if (keyCode == DOWN)
 {
 wVel = 3;
 } 
}

void keyReleased()
{
  if (keyCode == LEFT || keyCode == RIGHT) {
    xVel = 0;
  }
  if (keyCode == UP || keyCode == DOWN) {
    wVel = 0;
  }
  
  if (key== '1')
  {
    state = 0;
  }
   if (key== '2')
  {
    state = 3;
  }
   if (key== '3')
  {
    state = 5;
  }
   if (key== '4')
  {
    state = 7;
  }
   if (key== '5')
  {
    state = 9;
  }
  if (key== '6')
  {
    state = 11;
  }
  if (key== '7')
  {
    state = 13;
  }
}