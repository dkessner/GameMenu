//This tab will define our 'mover' class...a reusable, modifiable mover object
//Declare Class!
class Rock {
  //Declare PVectors for position, velocity, acceleration
  PVector position, velocity, acceleration;

  //add variables for angular motion
  float angle, angularVelocity, angularAcceleration;

  //Declare floats for size, topspeed?
  float radius, topSpeed, mass;
  int s = second();
  boolean dead = false;


  //constructor if you want random values
  Rock() {
    //assign values to variables
    position = new PVector(random(0, width), random(-5,-1));
    velocity = new PVector(0,random(0,7));
    //give acceleration an initial value
    acceleration = new PVector(0, 0);
    radius = (20);
    topSpeed = 20;
    mass = (10);
  }
  void resetGame() {
    position.y=-3;
  }
 

  //update function
  void update() {
    //set angular acceleration to some factor of x acceleration
    //angularAcceleration = acceleration.x/10;
    //increment angular v by angular a
    //angularVelocity += angularAcceleration;
    //limit angular v w constrain
    //angularVelocity = constrain(angularVelocity, -0.1, 0.1);
    //increment angle by angular v
    //angle += angularVelocity;
    //give the mover a new random acceleration
    //acceleration = PVector.random2D();
    //increment velocity by acceleration
   velocity.add(acceleration);
    //limit the velocity by topSpeed
   velocity.limit(topSpeed);
    //println(velocity.mag());
    //increment position by velocity
    position.add(velocity);
    //clear any acceleration from forces previously
    //acceleration.mult(0);
  }

  //this function will apply the force due to gravity
  //all objects should have same acceleration due to gravity...
  //because the force of gravity (weight) is proportional to mass
  //void applyGravity(PVector gravity) {
  //add the gravity vector to the acceleration
  //acceleration.add(gravity);
  // }

  //this function will generate a random acceleration



  //checkEdges function (wrap version instead of bounce)
  void checkEdgesWrap() {
    //if x position reaches right side of screen...
    if (position.x-radius > width) {
      //reset x position to left side of screen
      position.x = 0-radius;
    } else if (position.x+radius < 0) {
      //if x position reaches left side of screen....
      position.x = width+radius;
    }
    if (position.y - radius > height) {
      position.y = 0-radius;
      velocity.mult(1.2);
    } else if (position.y + radius < 0) {
      position.y = height+radius;

    }
  }

  //display function
  void display() {
    //isolate transformations with push and pop
    pushMatrix();
    //translate to movers position
    translate(position.x, position.y);
    //rotate by the mover's position
    rotate(angle);
    //draw an ellipse at origin
    ellipse(0, 0, radius*2, radius*2);
    //rectMode(CENTER);
    // rect(0, 0, radius*2, radius*2);
    popMatrix();
  }
}
