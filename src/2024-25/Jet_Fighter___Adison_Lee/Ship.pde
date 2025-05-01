//This tab will define our 'Ship' class...a reusable, modifiable Ship object
//Declare Class!
class Ship {

  ArrayList<Bullet> bullets;

  //Declare PVectors for position, velocity, acceleration
  PVector position, velocity, acceleration, thrust;

  // boolean trust
  boolean isThrust = false;

  //Declare floats for size, topspeed?
  float radius, topSpeed, mass;

  // add variable for angular motion
  // angular velocity/acceleration
  float angle, av, aa;

  int health = 10;
  // draw rect, width = health
  // grid*health;

  color c;
  
  boolean canShoot = true;
  




  //Declare a constructor function with parameters for position and velocity
  Ship(PVector posIn, PVector velIn, PVector thrustIn, color cIn) {
    //assign values to variables
    position = posIn;
    velocity = velIn;
    thrust = thrustIn;
    c = cIn;
    
    angle = 3*PI/2;


    //give acceleration an initial values
    acceleration = new PVector(0.0, 0.0);
    radius = grid*2.3;
    topSpeed = grid/1.3;
    mass = 5;
    bullets = new ArrayList<Bullet>();
  }

  //update function
  void update() {
    //println(isThrust);
    // set angular acceleration to some factor of x acceleration
    //aa = acceleration.x/10;
    //increment angular velocity by angular acceleration
    //av += aa;
    //limit angular velocity with constrain
    av = constrain(av, -0.1, 0.1);
    // increment angle by angular velocity
    angle += av;

    thrust = new PVector (grid*0.05, 0);

    thrust.rotate(angle);

    if (isThrust == true) {
      applyForce(thrust);
    }

    if (isThrust == false) {
    }

    //give the Ship a new random acceleration
    //acceleration = PVector.random2D();
    //increment velocity by acceleration
    velocity.add(acceleration);
    //limit the velocity by topSpeed
    velocity.limit(topSpeed);
    //println(velocity.mag());
    //increment position by velocity
    position.add(velocity);
    //clear any acceleration from forces previously
    acceleration.mult(0);
  }

  //this function will apply a force vector and accelerate our Ship!
  void applyForce(PVector force) {
    //divide the force by mass and save a copy
    PVector f = PVector.div(force, mass);
    //add the force to the Ship's acceleration
    acceleration.add(f);
  }

  //this function will apply the force due to gravity
  //all objects should have same acceleration due to gravity...
  //because the force of gravity (weight) is proportional to mass
  void applyGravity(PVector gravity) {
    //add the gravity vector to the acceleration
    acceleration.add(gravity);
  }


  void handleThrust() {
    isThrust = true;
  }
  void handleRight() {
    av = 0.07;
  }
  void handleLeft() {
    av = -0.07;
  }

  void handleShoot() {
    PVector bulletVelocity = new PVector(grid, 0);
    bulletVelocity.rotate(angle);
    Bullet b = new Bullet(bulletVelocity, position, c);
    bullets.add(b);
 
  }



  void releaseThrust() {
    //4) set wind force to 0
    isThrust = false;
  }
  void releaseTurn() {
    av = 0;
  }


  //this function will calculate drag force and apply it to a Ship

  //this function will create an acceleration towards the mouse
  void accelerateTowardsMouse() {
    //create a vector for mouse location
    PVector mouse = new PVector(mouseX, mouseY);
    //subtract position from mouse location and assign to new direction vector (use static func.)
    PVector direction = PVector.sub(mouse, position);
    //normalize direction vector to make its magnitude 1
    direction.normalize();
    //scale direction by multiplying by desired acceleration value
    direction.mult(0.5);
    //set acceleration equal to direction vector
    acceleration = direction;
  }

  //this function will generate a random acceleration
  void accelerateRandomly() {
    //use the STATIC function that belongs to the PVector class
    acceleration = PVector.random2D();
  }


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
    } else if (position.y + radius < 0) {
      position.y = height+radius;
    }
  }

  //add a function to bounce the Ship off the edges
  void checkEdgesBounce() {
    //check right edge of the Ship with right edge of the screen
    if (position.x + radius > width) {
      //reverse the x velocity
      velocity.x *= -1;
      //snap the Ship back to the right edge of the screen
      position.x = width-radius;
    } else if (position.x - radius < 0) {
      velocity.x *= -1;
      position.x = 0 + radius;
    }

    if (position.y + radius > height) {
      velocity.y *= -1;
      position.y = height - radius;
    } else if (position.y - radius < 0) {
      velocity.y *= -1;
      position.y = 0 + radius;
    }
  }



  //display function
  void display() {
    for (Bullet b : bullets) {
      b.update();
    }
    for (int i = bullets.size()-1; i >= 0; i --) {
      //retrieve the particle at the index i
      Bullet chB = bullets.get(i);
      if (chB.position.x > width ||
        chB.position.x < 0 ||
        chB.position.y > height ||
        chB.position.y < 0) {
        bullets.remove(chB);
      }
      if (chB.isDead)
      {
        bullets.remove(chB);
      }
    }
    //println(bullets.size());
    // reverse for loop
    // isolate transformations
    pushMatrix();
    //translate to the Ship position
    translate(position.x, position.y);
    //rotate by Ship's angle
    rotate(angle);
    //draw an ellipse at Ship's position
    fill(c);
    //ellipse(0, 0, radius*2, radius*2);
    rectMode(CENTER);
    if (isThrust == true) {
      rect(-radius, 0, radius/2, radius/2);
    }
    triangle(radius, 0, -radius, radius, -radius, -radius);

    popMatrix();
  }
  void checkBulletCollide(Bullet chB) {
    // check bullet colliso
    if(chB.position.x > position.x - radius && chB.position.x < position.x + radius &&
    chB.position.y > position.y - radius && chB.position.y < position.y + radius){
      chB.isDead = true;
      health --;
    }
    // decrement health
    // set bullet boolean
  }
}
