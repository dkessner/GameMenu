
int state = 0; 
Player player1; 
Player player2; 


ArrayList <Block> blocks; 
PImage keyboard1; 
PImage keyboard2; 
PImage tank1;
PImage tank2; 
PImage dirt; 

Ball createBall(int c) 
{
  PVector position = new PVector(width/2- 100, height/2);
  PVector velocity = new PVector(1, 2); 
  Ball b = new Ball(position, velocity, 10, c); 
    return b; 
}

void setup()
{
  fullScreen(); 
  
  keyboard1 = loadImage("keyboard1.jpg");
  keyboard2 = loadImage("keyboard2.jpg"); 
  tank1 = loadImage("tank1.png"); 
  tank2 = loadImage("tank2.png"); 
  dirt = loadImage("dirt.jpg"); 
  
  initialize();
}

void initialize()
{

  player1 = new Player(new PVector(width/2 - 600, height/2), new PVector(0, 0), color(255, 0, 0)); 
  player2 = new Player(new PVector(width/2 + 600, height/2), new PVector(0, 0), color(0, 0, 255)); 
  
  
  blocks = new ArrayList<Block>(); 
 
  
  //mid point center block left side
  blocks.add(new Block(new PVector(width/4, height/2 - 100), 80, 200, 7)); 
  //mid point center block right side
  blocks.add(new Block(new PVector(3 * width/4 - 80, height/2 - 100), 80, 200, 7)); 
  //top left block 
  blocks.add(new Block(new PVector(width/4 - 125, height/5 - 100), 250, 80, 7)); 
  //top right block
  blocks.add(new Block(new PVector(3 * width/4 - 125, height/5 - 100), 250, 80, 7)); 
  //small top left block
  blocks.add(new Block(new PVector(width/5- 25, height/4), 50, 50, 7)); 
  //small top right block
  blocks.add(new Block(new PVector(4 * width/5- 25, height/4), 50, 50, 7)); 
  //small bottom left block
  blocks.add(new Block(new PVector(width/5- 25, 3 * height/4 - 50), 50, 50, 7)); 
  //small bottom right block
  blocks.add(new Block(new PVector(4 * width/5- 25, 3 * height/4 - 50), 50, 50, 7)); 
  //bottom left block 
  blocks.add(new Block(new PVector(width/4 - 125, height - 125), 250, 80, 7)); 
  //bottom right block
  blocks.add(new Block(new PVector(3 * width/4 - 125, height - 125), 250, 80, 7)); 
  //center blocks
  blocks.add(new Block(new PVector(width/2 - 50, height/2 - 250), 100, 100, 7)); 
  blocks.add(new Block(new PVector(width/2 - 50, height/2), 100, 100, 7)); 
  blocks.add(new Block(new PVector(width/2 - 50, height/2 + 250), 100, 100, 7)); 
  
}

void draw()
{
  if(state == 0)
  draw_title();
  if(state == 1)
  draw_instructions();
  if(state == 2)
  draw_game(); 
  if(state == 3)
  draw_end1(); 
  if(state == 4)
  draw_end2(); 

} 


void draw_title()
{
  background(90, 255, 210);
  draw_dirt(0, 0); 
  fill(255); 
  textSize(50); 
  text("The Tank Game", width/2 - 250, height/2); 
  textSize(40); 
  text("By Carlee Launsbach", width/2 - 250, height/2 + 100); 
  textSize(20); 
  text("Press the SPACEBAR to continue", width/2 - 210, height/2 + 200); 
  draw_tank1(width/2 - 540, height/2 - 150); 
  draw_tank2(width/2 + 140, height/2);
  
}

void draw_instructions()
{
  background(250, 145, 255);
  draw_keyboard1(width/5 - 250, height/4 + 250); 
  fill(255, 0, 0); 
  textSize(40); 
  text("Player One:",  width/4 - 300, height/4);
  textSize(20); 
  text("Use the AWSD", width/4 - 300, height/4 + 50);
  text("Use W to Move Forward; S to Move Backward", width/4 - 300, height/4 + 100); 
  text("Use A to Rotate Left; D to Rotate Right", width/4 - 300, height/4 + 150); 
  text("Press 'Q' to Shoot", width/4 - 300, height/4 + 200); 
  draw_keyboard2(4 *width/5 - 400, height/4 + 250); 
  fill(0 , 0, 255); 
  textSize(40); 
  text("Player Two:", 3 * width/4 - 300, height/4);
  textSize(20); 
  text("Use the Arrow Keys", 3 * width/4 - 300, height/4 + 50);
  text("Use Up to Move Forward; Down to Move Backward", 3 * width/4 - 300, height/4 + 100); 
  text("Use Left to Rotate Left; Right to Rotate Right", 3 * width/4 - 300, height/4 + 150); 
  text("Press '/' to Shoot", 3 * width/4 - 300, height/4 + 200); 
  textSize(50); 
}

void draw_end1()
{
  background(0); 
  fill(255, 0, 0); 
  text("Player 2 Wins", 100, 100); 
  
}
void draw_end2()
{
  background(0); 
  fill(255, 0, 0); 
  text("Player 1 Wins", 100, 100); 
  
}


void draw_keyboard1(int key1 , int key2)
{
  image(keyboard1, key1, key2, 400, 300); 
}

void draw_keyboard2(int key1, int key2)
{
  image(keyboard2, key1, key2, 400, 300); 
}

void draw_tank1(int t1, int t2)
{
  image(tank1, t1, t2, 300, 200);
}
void draw_tank2(int t1, int t2)
{
  image(tank2, t1, t2, 300, 200); 
}
void draw_dirt(int d1, int d2)
{
  image(dirt, d1, d2, width, height); 
}
void keyPressed()
{
  if(keyCode == ' ' && state < 2)
  state ++; 
  
  if(keyCode == 'G' && state == 3 || state == 4)
  {
  state = 0; 
  initialize();
  }
  
  if(keyCode == LEFT)
  {
    player1.moveLeft(); 
  }
  
  if(keyCode == RIGHT)
  {
    player1.moveRight(); 
  }
  
   if(keyCode == UP)
  {
    player1.moveForward();
  }
  
  if(keyCode == DOWN) 
  {
    player1.moveBackward(); 
  }
  
   if(key == 'a')
  {
    player2.moveLeft(); 
  }
  
  if(key == 'd')
  {
    player2.moveRight(); 
  }
  
   if(key == 'w')
  {
    player2.moveForward(); 
  }
  
  if(key == 's')
  {
    player2.moveBackward(); 
  }
  
  if(key == ' ')
  {
    player1.shoot(0, 255); 
  }
  if(key == '1')
  {
    player2.shoot(255, 0); 
  }
  
}

void keyReleased()
{
  if (keyCode == LEFT || keyCode == RIGHT)
  {
    player1.stopTurn(); 
  }
  else if (keyCode == UP || keyCode == DOWN)
  {
    player1.stopMove();
  }
  
  if (key == 'a' || key == 'd')
  {
    player2.stopTurn(); 
  }
  else if (key == 'w' || key == 's')
  {
    player2.stopMove(); 
  }
}
