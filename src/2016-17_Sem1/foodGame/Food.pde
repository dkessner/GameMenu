class Food 
{ 
 
  float x;
  float y;
  float vx;
  float vy;
  int foodtype=0;
  PImage img;
  PImage img1;
  PImage img2;
  PImage img3;
  PImage img4;
  PImage img5;
  boolean caught; 

  Food() { 
    img=loadImage("hamburger-cartoon.png");
    img1=loadImage("pink-icecream.png");
    img2=loadImage("pizza-slice.png");
    img3=loadImage("beverage.png");
    img4=loadImage("hot-dog.png"); 
    img5=loadImage("cake.png");

    caught = false;
  } 

  void display() {

    if (!caught) {

      if (foodtype==0) { 
        image(img, x, y, 50, 50);
      } else if (foodtype==1) {
        image(img1, x, y, 35, 60);
      } else if (foodtype==2) { 
        image(img2, x, y, 60, 60);
      } else if (foodtype==3) {
        image(img3, x, y, 35, 60);
      } else if (foodtype==4) {
        image(img4, x, y, 55, 45);
      } else if (foodtype==5) {
        image(img5, x, y, 45, 60);
      }
    }

    x+=vx;
    y +=vy;

    if (x<0 || x>width)
      vx = -vx;

    if (y>height) {
      y= -20;
      x= random(0, 600); 
      foodtype = int(random(0,5));
      if (caught == false) {
        textAlign(CENTER);
        text("GAME OVER", width/2, height/2);
        println("lost");
        gameState = 2; 
      }caught = false;
    } 

    // collision detection for food + man
  }

  void checkCollision() {
    if (x< fx+140 && x>fx && y>370 && y<570) {
      println ("caught hamburger");
      caught = true;
    }
  }
}