import processing.sound.*;

//Looks great! -Mr. W
//declare objects
Ship shipLeft;
Ship shipRight;
int grid;
PFont title, starting;
String state = "start";
SoundFile spaceSound;
SoundFile laser;

float blinking = 30;
float blinkVel = 2.5;

float titleY;
float titleVel;

ArrayList<Star> stars;

//Let's make a force to apply to our ships
//PVector gravity = new PVector(0, 0.1);
//PVector wind = new PVector(0, 0);

void setup() {
  fullScreen();
  grid = height/100;
  println(width + "+" + height);
  //initialize objects with constructor
  //fluid = new Fluid(0, width/1.5, width, height, 0.1);
  //solid = new Solid(width/3, width/5,width/3, width/8);

  spaceSound = new SoundFile(this, "spaceNoise.mp3");
  laser = new SoundFile(this, "laser.mp3");

  spaceSound.amp(0.3);
  spaceSound.loop();

  shipLeft = new Ship(new PVector(width/6, height/2), new PVector(0, 0), new PVector(0.1, 0), #E52727);
  shipRight = new Ship(new PVector(width/1.2, height/2), new PVector(0, 0), new PVector(0.1, 0), #3659FF );


  titleY = grid*42;
  titleVel = 0.3;

  stars = new ArrayList<Star>();

  for (int i = 0; i<150; i++) {
    Star s = new Star();
    stars.add(s);
  }
}


void draw() {
  if (state == "start") {
    drawStart();
  } else if (state == "game") {
    drawGame();
  } else if ( state == "redWins") {
    drawRedWins();
  } else if ( state == "blueWins") {
    drawBlueWins();
  }
}

void keyPressed() {
  if (state == "start") {
    state = "game";
  }
  if (state == "game") {
    if ( keyCode == UP) {
      shipLeft.handleThrust();
    } else if ( keyCode == LEFT) {
      shipLeft.handleLeft();
    } else if (keyCode == RIGHT) {
      shipLeft.handleRight();
    } else if ( key == ' ') {
      if (shipLeft.canShoot) {
        laser.play();
        shipLeft.handleShoot();
        shipLeft.canShoot = false;
      }
    }

    if ( key == 'w') {
      shipRight.handleThrust();
    } else if ( key == 'a') {
      shipRight.handleLeft();
    } else if (key == 'd') {
      shipRight.handleRight();
    } else if ( key == '1') {
      if (shipRight.canShoot) {
        laser.play();
        shipRight.handleShoot();
        shipRight.canShoot = false;
      }
    }
  }
  if ( state == "blueWins" || state == "redWins") {
    if (keyCode == ENTER) {
      state = "start";
    }
  }
}

void keyReleased() {

  if ( state == "game") {
    if ( keyCode == UP) {
      shipLeft.releaseThrust();
    } else if ( keyCode == RIGHT || keyCode == LEFT) {
      shipLeft.releaseTurn();
    } else if (key == ' ') {
      shipLeft.canShoot = true;
    }
    if ( key == 'w') {
      shipRight.releaseThrust();
    } else if ( key == 'd' || key == 'a') {
      shipRight.releaseTurn();
    } else if ( key == '1') {
      shipRight.canShoot = true;
    }
  }
}

void drawStart() {
  background(0);
  title = createFont("1up.ttf", grid*10);
  textAlign(CENTER);
  textFont(title);


  for (Star s : stars) {
    s.display();
    s.starsWrap();
  }

  fill(255);

  titleY+=titleVel;

  if (titleY <= grid*42 || titleY >= grid*45) {
    titleVel*=-1;
  }

  text("JET FIGHTER", width/2, titleY);
  // make text blinking
  starting = createFont("Minecraft.ttf", grid*3);
  textFont(starting);

  blinking+=blinkVel;

  if (blinking <= 30 || blinking > 255) {
    blinkVel*=-1;
  }

  fill(blinking);
  text("press ANY KEY to play", width/2, height/1.8);
}
void drawGame() {
  background(0);

  for (Star s : stars) {
    s.display();
    s.starsWrap();
  }

  //ship.applyForce(wind);
  //ship.applyGravity(gravity);
  shipLeft.checkEdgesWrap();
  shipRight.checkEdgesWrap();
  for ( Bullet b : shipRight.bullets) {
    shipLeft.checkBulletCollide(b);
  }
  for ( Bullet b : shipLeft.bullets) {
    shipRight.checkBulletCollide(b);
  }

  rectMode(CORNER);
  fill(#E52727);
  rect(grid*5, height/1.2, shipLeft.health*grid*5, grid*2);
  fill(#3659FF);
  rect(width/1.52, height/1.2, shipRight.health*grid*5, grid*2);

  //ship.checkEdgesBounce();
  //ship.checkSolid(solid);
  shipLeft.update();
  shipRight.update();
  shipLeft.display();
  shipRight.display();

  if (shipLeft.health == 0) {
    state = "blueWins";
    shipLeft = new Ship(new PVector(width/6, height/2), new PVector(0, 0), new PVector(0.1, 0), #E52727);
    shipRight = new Ship(new PVector(width/1.2, height/2), new PVector(0, 0), new PVector(0.1, 0), #3659FF );
  }
  if (shipRight.health == 0) {
    state = "redWins";
    shipLeft = new Ship(new PVector(width/6, height/2), new PVector(0, 0), new PVector(0.1, 0), #E52727);
    shipRight = new Ship(new PVector(width/1.2, height/2), new PVector(0, 0), new PVector(0.1, 0), #3659FF );
  }
}

void drawRedWins() {
  background(0);
  
   for (Star s : stars) {
    s.display();
    s.starsWrap();
  }

  fill(#E52727);
  textSize(50);
  text("RED  wins", width/2, height/2.5);
  textSize(25);
  fill(255);
  text("press  ENTER  to  go  back  to  start", width/2, height/2);



  shipLeft.health = 10;
  shipRight.health = 10;
}

void drawBlueWins() {
  background(0);
  
   for (Star s : stars) {
    s.display();
    s.starsWrap();
  }

  fill(#3659FF);
  textSize(50);
  text("BLUE  wins", width/2, height/2.5);
  textSize(25);
  fill(255);
  text("press  ENTER  to  go  back  to  start", width/2, height/2);



  shipLeft.health = 10;
  shipRight.health = 10;
}

//fluid.display();
//solid.display();
//}
