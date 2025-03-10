import ddf.minim.*;
Minim minim;
int gameState = 0;
Char char1;
Grid grid;
ArrayList<Ball> balls;
ArrayList<Food> food;
AudioPlayer background;
AudioPlayer ball;
AudioPlayer foods;
AudioPlayer nextmaze;

void setup()
{
  fullScreen();
  noCursor();
  
  ellipseMode(CENTER);
  textAlign(CENTER, CENTER);
  
  minim = new Minim(this);
  background = minim.loadFile("background.mp3");
  ball = minim.loadFile("ball.mp3");
  foods = minim.loadFile("food.wav");
  nextmaze = minim.loadFile("nextmaze.mp3");
  background.loop();
 
  grid = new Grid();
  char1 = new Char(grid.startx, grid.starty);
  balls = new ArrayList<Ball>();
  food = new ArrayList<Food>();
  for (int i=0; i<10; i++)
  {
    Ball b = new Ball(0, 0, random(-3, 3), random(-3, 3));
    grid.moveBallRandom(b);
    balls.add(b);
  }
  for (int i=0; i<3; i++)
  {
    Food f = new Food();
    grid.foodRandom(f);
    food.add(f);
  }
  
  text("a", 0, 0);
}

void draw()
{
  
  if (gameState==1)
    drawEnd();
  else if (gameState==0)
    drawGame();
  else if (gameState==2)
    drawWin();
  if (gameState > 2)
  {
    gameState=0;
  }
}

void drawWin()
{
  background(0);
  textSize(50);
  fill(0, 0, 255);
  text("You Win!", width/2, height/2);
  textSize(30);
  text("You made it through " + char1.mazeCount + " levels!", width/2, height/2-50);
  text("Press space to play again", width/2, height/2 + 50);
}

void drawEnd()
{
  background(0);
  textSize(50);
  fill(0, 0, 255);
  text("Game Over", width/2, height/2);
  textSize(30);
  text("You made it through " + char1.mazeCount + " levels!", width/2, height/2-50);
  text("Press space to start over", width/2, height/2 + 50);
}

void drawGame()
{
    background(0);
  
    grid.display();
    
    for (Food a: food)
      a.display();
 
    char1.display();
    
    for (Ball a: balls)
      a.display();
    
    textSize(15);
    text("Lives: " + char1.lives, 0.5*grid.gridWidth, 0.5*grid.gridHeight);
}

void keyPressed()
{ 
   if (key==' ')
  {
    grid.startOver();
  }
  if (keyCode==RIGHT)
    char1.setVelocity(5, 0);
  if (keyCode==LEFT)
    char1.setVelocity(-5, 0);
  if (keyCode==UP)
    char1.setVelocity(0, -5);
  if (keyCode==DOWN)
    char1.setVelocity(0, 5);
}

void keyReleased()
{
  char1.setVelocity(0, 0);
}
