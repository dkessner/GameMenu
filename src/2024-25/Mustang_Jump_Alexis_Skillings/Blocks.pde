class Block {
  //declare variables
  float x, y, mass, velocity, lifespan, acceleration;
  boolean startBlockVisible = true;

//make constructor function
  Block() {
    x=random(0, width-width/6);
    y=random(-height, 0);
    mass = random(1, 5);
    velocity = map(mass, 1, 5, 0.03, 0.7);
    lifespan = map(velocity, 0.02, 0.7, 700, 5); //i hate the lifespan on this for the slowest ones
    //acceleration = 0.00002;
  }
//DITCH BLOCK ACCELERATION

//make only able to jump when on block??
//change horse gravity for that
//change block spacing




//overload constructor for the single block
  Block(float xIn, float yIn) {
    x = xIn;
    y = yIn;
  }

  void update() {
    //incrementing the block falling speed
    y=y+velocity;
    //velocity = velocity+gameAcceleration;
    //decrement the lifespan
    lifespan--;
  }

//draw the block
  void display() {
    rectMode(CORNER);
    fill(#462D7C);
    rect(x, y, width/6, height/20, 28);
  }
  
  //check collision detection for the system of blocks
  void checkCollision(Horse horse) {
  float horseW = horse.mustang.width;
  float horseH = horse.mustang.height;

  float blockW = width/6;
  float blockH = height/20;

  //only check collision when the horse is falling
  if (horse.vy > 0 &&
      horse.y + horseH > y &&            // bottom of horse is below top of block
      horse.y + horseH < y + blockH &&   // bottom of horse is above bottom of block
      horse.x + horseW > x &&            // right side of horse is right of block's left
      horse.x < x + blockW) {            // left side of horse is left of block's right

    //snap horse to the top of the block
    horse.y = y - horseH;
    //match the horses falling velocity to the blocks velocity
    horse.vy = velocity; 
    
    //make boolean that tracks if it on block
  }
}
  
//draw block on bottom of screen
  void displayLandingBlock() {
    if (startBlockVisible) {
      fill(0);
      rect(x, y, width/10, height/2, 28);
    }
  }


  //make block for horse to land on at first
  void blockstart(Horse horse) {
    //collision detection for the start block
    if (startBlockVisible) {
      float horseW = horse.mustang.width;
      float horseH = horse.mustang.height;

      float blockW = width/10; 
      float blockH = height/10;

      if (horse.vy > 0 &&
        horse.y + horseH > y && horse.y + horseH < y + blockH &&
        horse.x + horseW > x && horse.x < x + blockW) {
    
    //snap horse to top of block
        horse.y = y - horseH;
    //make velocity 0
        horse.vy = 0;
      }
    }
  }

  

  boolean isDead() {
    if (y > height) {
      return true;
    } else {
      return false;
    }
  }
  
  //boolean true if colliding and false if not

}
