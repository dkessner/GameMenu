int state;

float xG, yF; // G is for global
float a, b; // use only for goomba a is like x 

float x, y;  //only use for mario
float xVel, yVel, yAcceleration; // use only for mario
float bR, gR; // radii for mario's circle, goomba's cirlce
float c, d, cVel; //use only for koopa

boolean canJump; // use to make mario jump once in a row 

PImage mario;

ArrayList<Goomba> goombas;
Goomba myGoomba;

ArrayList<Ground> grounds;

//ArrayList<MG> mgs;

// ArrayList<Koopa> koopas;
//Koopa myKoopa;

Ground movingGround;
Ground movingGround1; 
Ground movingGround2;
Ground movingGround3;
Ground movingGround4;
Ground movingGround5;
Ground movingGround6;



PFont myFont;

void setup() {
  size(1200, 828); // 1200,828
  xG = width/120;
  //yF = height/80;

  state = 0; 

  bR = 51.5; // bR + gR = 93.5
  gR = 42;

  x = width/120;
  y = height - height/14.54;

  a = width; // coordinates for goomba
  b = height/10; // coordinates for goomba


  myFont = loadFont("Krungthep-48.vlw");

  mario = loadImage("mario.png");
  xVel = 0;
  yVel = 0;
  yAcceleration = 0.45;

  /*boolean canJump = false;
   if (!canJump) {
   }
   canJump = true;
   if (canJump) {
   } //set boolean */

  goombas = new ArrayList<Goomba> ();
  for (int i = 0; i<5; i ++) {
    Goomba b = new Goomba(random(width, width+1000), random(height - (height/10.75), height-(height/10.75))); //xF*i*5
    goombas.add(b);
  }
  /* koopas = new ArrayList<Koopa> ();
   for (int i = 0; i<5; i ++) {
   Koopa b = new Koopa(width, height-(height/10)); //xF*i*5
   koopas.add(b);
   } */

 /* mgs = new ArrayList<MG> ();
  if (x > 903) {
    movingGround.xF -= movingGround.xFVel;
    movingGround1.xF -= movingGround1.xFVel;
    movingGround2.xF -= movingGround2.xFVel;
    movingGround3.xF -= movingGround3.xFVel;
    movingGround4.xF -= movingGround4.xFVel;
    movingGround5.xF -= movingGround5.xFVel;
    movingGround6.xF -= movingGround6.xFVel;

    x = 903;
    for (Goomba b : goombas) {
      b.a -= movingGround.xFVel;
    }
  }*/


  grounds = new ArrayList<Ground> ();
  movingGround =  new Ground(xG-1, 1, 12000);
  movingGround1 = new Ground(xG+825, 2, 5);
  movingGround2 = new Ground(xG+880, 3, 4); 
  movingGround3 = new Ground(xG+935, 4, 3); 
  movingGround4 = new Ground((xG*350)-10, 2, 10);
  movingGround5 = new Ground((xG*350)+60, 3, 8);
  movingGround6 = new Ground((xG*350)+120, 4, 6);
  grounds.add(movingGround);
  grounds.add(movingGround1);
  grounds.add(movingGround2);
  grounds.add(movingGround3);
  grounds.add(movingGround4);
  grounds.add(movingGround5);
  grounds.add(movingGround6);
}

void keyPressed() {

  if (state == 0)
    state = 1;

  if (keyCode == UP) {
    yVel = -12.25;
  }

  if (keyCode == RIGHT) {
    xVel = 5;
  }
  if (keyCode ==LEFT) {
    xVel = -5;
    x--;
  }
}

void keyReleased() {
  if (keyCode == RIGHT) {
    xVel = 0;
  }
  if (keyCode == LEFT) {
    xVel = 0;
  }
}

void mousePressed() {
  if (mousePressed) {
    state++;
  }
}
