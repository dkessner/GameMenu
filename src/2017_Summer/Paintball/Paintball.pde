//declaring ArrayList of Ball objects
ArrayList<Ball> balls;
ArrayList<Person> person;

int gameState = 0;
boolean visible = true;

int b = 300;
int vb = 0;
int a = 1000;
int va = 0;
int aaa = 20;
int aa = 400;
int count = 0;

void setup()
{
  fullScreen();
  //size(1200, 400);
  //creating new list
  balls = new ArrayList<Ball>();
  person = new ArrayList<Person>();
  
  /*
  //adding ball objects to list
  for (int i=0; i<10; i++)
  {
    Ball b = new Ball(100, 200, random (-3, 3), random(-3, 3));
    balls.add(b);
  }
  */
  
}

void draw()
{
  if (gameState ==0)
    drawStart();
  else if (gameState == 1)
    drawGame();
  else
    drawEnd();
}

void drawStart()
{
  background(0);
  fill(255);
  text("Player 1 Press the UP arrow to shoot. Player 2 press the W key to move the person up and the S key to move the player down. Press any key to start. Press the space bar to end the game. ", 100, 300);
}

void drawEnd()
{
  background(0);
  fill(255);
  text("THE FRIKIN END", 600, 600);
}

void drawGame()
{
  background(0);
  fill(#BC8937);
  
  //gun
  stroke(#BC8937);
  rect(0, 400, 100, 50);
  rect(0, 450, 25, 75);
  fill(#FFE798);
  
  fill(255);
 
  
  
 //person 
 if (visible)
 {
  stroke(#FFE798); 
  fill(#FFE798);
  ellipse(1000, b, 35, 35);
  line(a, b, a, b+50);
  line(a, b+50, a+10, b+60);
  line(a, b+50, a-10, b+60);
  line(a, b+35, a+10, b+20);
  line(a, b+35, a-10, b+20);
  stroke(0);
 }
  
  b = b+vb;
  
  if (a<25 || a>width-25)
    va = -va;
  if (b<25 || b>height-25)
    vb = -vb;
  
  //display all the balls in the list
  for (Ball b : balls)
    b.display();
    
  textAlign(CENTER);
  fill(255);
 
 for (Ball ball : balls)
 {
   if (dist(1000, b, ball.x, ball.y) < 25 + 35/2)
   {
     //visible = false;
     count++;
     b = (int)random(0, height);
   }
 }
 


  text("count: " + count, 100, 100);
  
 
 
}

void keyPressed()
{
  if (keyCode == UP)
    balls.add(new Ball(100, 425, random(9,9), random(-3,3)));
  else if (keyCode == DOWN && balls.size () > 0)
    balls.remove(0);
  
  if (key == 'w')
    vb = -2; 
  
  if (key == 's')
    vb = 2;
  
  
  if (gameState == 0)
  {
    gameState = 1;
  }
}

void keyReleased()
{
  if (key == 'w'){
    vb = 0;
  }
  
  if (key == 's'){
  vb = 0;
  }

}
    