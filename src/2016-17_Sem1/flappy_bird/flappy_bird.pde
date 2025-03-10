Pipe myPipe;
Pipe myPipe2;

int x;
int y;
int go;
float mY;
float xSpeed;
float ySpeed;
float xF,yF;
int score;
boolean canScore = true;

void setup () {
  //size (1000, 500);
  fullScreen();
  noCursor();
  xF = width/150;
  yF = height/70;
  x= width/2;
  y= height/2;
  mY= y;
  xSpeed= 0;
  ySpeed=yF/10;
  go=0;

  myPipe= new Pipe();
  myPipe2= new Pipe();
  
  myPipe.x=x;
  myPipe.y=y;
  myPipe.xVel= -0.4*xF;

  myPipe2.x=width;
  myPipe2.y=random(10*xF, 60*yF);
  myPipe2.xVel= -0.4*xF;
}

void drawStart() {
  background(252, 252, 5);

  fill(255, 157, 239);
  textSize(4*xF);
  text( "PRESS ENTER TO PLAY FLAPPY BIRD", 50*xF, 30*yF);
  text("Press Space to Jump", 50*xF, 35*yF);
}


void gameReset() {
  x= width/2;
  y= height/2;
  mY= y;
  xSpeed= 0;
  ySpeed=yF/10;
  go=0;

  myPipe= new Pipe();
  myPipe2= new Pipe();
 
  myPipe.x=x;
  myPipe.y=y;
  myPipe.xVel= -0.4*xF;

  myPipe2.x=x+75*xF;
  myPipe2.y=random(10*xF, 60*yF);
  myPipe2.xVel= -0.4*xF;
}  

void gameDraw() {

  if (go==1) {
    background(15);
    updateMan ();
    drawMan (width/2, mY);
    myPipe.displayPipe();
    myPipe2.displayPipe();
    textSize(4*xF);
    text("score: " + score, xF, 3*yF);
  } else if (go==2) {
    drawEnd();
  }
}

void drawEnd() {  
  background(255);
  textSize(3*xF);
  textMode(CENTER);
  text ("Game Over", x-80, y);
  text("PRESS ENTER TO PLAY AGAIN", x-80,y+50);
}

void draw () {

  println (go);
  if (go==0) {
    drawStart();
  } else if (go==1) {
    gameDraw();
  } else if (go==2) {
    drawEnd();
    score=0;
  

  }
}

void drawMan (float x, float y) {
  fill (255, 185, 230);
  ellipse (x-50*xF, y, 3*xF, 3*xF);
}

//void mouseReleased () {
  //if (go == 0) {
   
  //} else if (go == 2) {
   
  //}


void keyPressed() {
  if (go==0) {
    if (keyCode == ENTER){
    go = 1;
    }
  } else if (go==1) {
    if (key==' ') {
      ySpeed=-.3*yF;
    }
  } else if (go==2) {
    if (keyCode == ENTER){
      gameReset();
    }
  }
}

void updateMan () {
  mY=mY+ ySpeed;
  ySpeed= ySpeed+ 0.01*yF;
  mY = constrain(mY, 0, height);
}