PFont testFont;

float wf; 
float x;
float y; 
float vx; 
float vy;
float ay; 

float playerX;
float playerY;  
float playerVX; 
float playerVY; 

float basketX = 500; 
float basketY = 300;  
float basketVX = 3; 

boolean visible = false; 
boolean scored = false; 

PImage basketball;  // image variables
PImage basket; 
PImage arena; 

int score = 0; 
int gameState = 0; 

int startTime = 0; 
int timeElapsed; 
int timeLimit = 25000; 

void setup()
{
  //size(600, 600);  
  fullScreen();   // screen size
  noCursor();

  wf = width/60;

  x = 15*wf;  //variables 
  y = 20*wf;
  vx = 0.2*wf;
  vy = 0.5*wf;
  ay = 0.03*wf;

  playerX = width/2;    // player sizes
  playerY = height/2;
  
  arena = loadImage("rupp_new_logo.jpg"); 
  arena.resize(width, height); 

  basketball = loadImage("basketball.png");   //basketball player
  basketball.resize(50, 50);   

  basket = loadImage("basket.png");     // basket target
  basket.resize(200, 200);
}

void drawStart()
{
  testFont = createFont("Edge Racer Halftone", 60); 
  textFont(testFont); 
  background(0); 
  textSize(50); 
  fill(#1CE531); 
  text("Welcome to my game! Hint, the ball shoots at an angle!", 100, 300); 
  text("Use the arrow keys to move the ball around.", 100, 350); 
  text("Press the space bar to shoot the ball.", 100, 400); 
  text("Press any key to begin.", 100, 450);
}

void drawEnd()
{
  background(0); 
  
  if (score < 10)
  {
  textSize(50); 
  text("The timer has run out, you lose!", 400, 600); 
  text("Press any key to play again.", 400, 650);
  }
  else
  {
  textSize(50); 
  text("You reached 10 points. YOU ARE A WINNER!", 170, 500); 
  text("Press any key to play again.", 500, 550);
  }
}

void draw()
{
  if (gameState == 0)
    drawStart(); 
  else if (gameState == 1)
    drawGame();  
  else if (gameState == 2)
    drawEnd();

}

void drawGame()
{
  background(#B7B5B5); //background color
  
  imageMode(CORNER); 
  image(arena, 0,0); 
  
  timeElapsed = millis() - startTime; 
  textSize(50); 
  fill(255);
  text("score: " + score, 50, 450);
  //score += 1;
  text("timer: " + ((timeLimit - timeElapsed)/1000), 50, 500); 

  if (score >= 10)
    gameState =2; 
    
    
  if (timeLimit - timeElapsed <0)
  {
    gameState = 2; 
  }

  x += vx; 
  y += vy; 
  
  
  // ball  
  fill(255); // ball color

  //target
  imageMode(CENTER); 
  image(basket, basketX, basketY); 

  if (visible)
  {
    //ellipse(x, y, 50, 50);
    imageMode(CENTER);           // basketball image covering player
    image(basketball, x, y);
  }

  // player
  fill(0, 255, 0); 
  //ellipse(playerX, playerY, 50, 50); 
  imageMode(CENTER);                    //image over the shooting of the target
  image(basketball, playerX, playerY);

  x += vx;
  y += vy;
  vy += ay; 

  playerX += playerVX;   
  playerY += playerVY; 

  basketX += basketVX; 

  noFill();
  strokeWeight(0); 
  ellipse(basketX, basketY, 50, 50);

  if (dist(basketX, basketY, x, y)<20 && vy>0 && scored == false)
  {
    score++;
    scored = true;
  }
  if (x<25 || x>width-25)
  {
    vx = -vx;
  }

  if (y<25 || y>height-25)
  {
    vy = -vy;
  }

  if (y > height-100)
  {
    visible = false;
  }

  if (basketX<90 || basketX>width-90)
  {
    basketVX = -basketVX;
  }
}

void keyPressed()
{
  if (gameState == 0)
  {
    gameState = 1;
    startTime = millis(); 
  } else if (gameState == 1)
  {    
    if (key == ' ')
    {
      x = playerX;
      y = playerY;
      vy = -15;  

      if (x > width/2)
        vx = -3;
      else
        vx = 3;

      visible = true;
      scored = false;
    } else if (keyCode == RIGHT)
    {
      playerVX = 7;
    } else if (keyCode == LEFT)
    {
      playerVX = -7;
    } else if (keyCode == UP)
    { 
      playerVY = -7;
    } else if (keyCode == DOWN)
    {
      playerVY = 7;
    }
  } else if (gameState == 2)
  {
    gameState = 0; 
    score = 0; 
    playerX = width/2; 
    playerY = height/2;
  }
}

void keyReleased()
{
  playerVX = 0; 
  playerVY = 0;
}

