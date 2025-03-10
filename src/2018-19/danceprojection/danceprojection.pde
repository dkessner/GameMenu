//to do:
//  figure out what dimensions the "box" should be
//  figure threshold that works best ~1000
//  figure out if kinect should be front / back -> back
//
// have mouse act as a back up plan
// change color of the ball
// adjust magnitude of the push
// slices

//import org.openkinect.freenect.*;
//import org.openkinect.processing.*;

//KinectTracker tracker;
//Kinect kinect;

 
int nparticles = 9222;
ArrayList<Particle> particles = new ArrayList<Particle>();
 
Particle createParticle()
{
  int r = (int)random(1, 3);
  //PVector position = new PVector(random(r + 250, width-r-250), random(r, height-r-620));
  PVector position = new PVector(random(r, width-r), random(r, height-r));
  PVector velocity = PVector.random2D();
  velocity.setMag(1);
  int c = color(random(50, 255), random(50, 255), random(50, 255));
  noStroke();
  
  Particle p = new Particle(r, position, velocity, c, position.x, position.y);
  return p;
}

void setup() 
{
    //size (1600,800);
    fullScreen();
    
    background(0);
    
    for (int i = 0; i < nparticles; i++)
    {
      Particle p = createParticle();
      particles.add(p);
    }
    
    background(0);
    noCursor(); 
    /*
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  */

    myCursor = new Particle(10, new PVector(width/2, height/2),
        new PVector(), color(128), width/2, height/2);
}

/*
PVector prev = new PVector(0,0);
PVector current = new PVector(0,0);
*/


Particle myCursor;


void draw() 
{
 background(2);//take this out for cool line drawing effect (might also need to remove bounces off walls)
 
 for (Particle p : particles)
    {
      p.display();
      p.velocity.mult(.995);
    }
 fill(100);
 //ellipse(mouseX, mouseY, 10, 10);

 myCursor.display();
 
 //current = new PVector(tracker.getLerpedPos().x, tracker.getLerpedPos().y);
 
 for (Particle p: particles)
  {
    /*
    PVector v = tracker.getLerpedPos().copy();  //need to have a copy in order to avoid messing with the actual vector.
    v.x *= ((width-500.0f)/kinect.width);
    v.y *= (height-620.0f)/kinect.height;
    */
    
    //PVector push = new PVector(v.x-p.position.x, v.y-p.position.y); //subbed in tracker pos for mouse
    //PVector push = new PVector(mouseX-p.position.x, mouseY-p.position.y); //subbed in tracker pos for mouse

    PVector pull = new PVector(p.startXPos - p.position.x, p.startYPos - p.position.y);
    /*
    float pushMag = push.mag();
    push.mult(.85/(sq(pushMag)));
    push.mult(sqrt(sq(current.x-prev.x)+sq(current.y-prev.y))); //is there a previous position// how to find
    */
    
    //p.push(push);
    p.pull(pull);
    
    //if (mouseX > 250 && mouseX < width-250 && mouseY < height-600)
    {
      //PVector push2 = new PVector(mouseX-p.position.x, mouseY-p.position.y); //subbed in tracker pos for mouse

      PVector push2 = new PVector(myCursor.position.x-p.position.x, 
                                  myCursor.position.y-p.position.y);

      float s = sq(myCursor.position.x - myCursor.previousPosition.x) + 
          sq(myCursor.position.y - myCursor.previousPosition.y);

      push2.mult(.5 * sqrt(s) / push2.magSq());

      p.push(push2);
      p.pull(pull);
    }
  
  }
  
    //tracker.track();
 /* 
   // Let's draw the raw location
    PVector v1 = tracker.getPos();
    fill(10);
    noStroke();
    ellipse(v1.x *((width-250.0f)/kinect.width), v1.y * ((height-620.0f)/kinect.height), 20, 20);
  
    // Let's draw the "lerped" location
    PVector v2 = tracker.getLerpedPos();
    fill(5);
    noStroke();
    ellipse(v2.x *((width-250.0f)/kinect.width), v2.y * ((height-620.0f)/kinect.height), 20, 20); 

    prev = current;
    */
}

void mousePressed() {
 for (Particle p: particles){
   p.position.x = random(0,width);
   p.startXPos = p.position.x;
   p.position.y = random(0,height);
   p.startYPos = p.position.y;
   p.velocity = PVector.random2D();
   p.velocity.setMag(1);
  }

  myCursor.position = new PVector(width/2, height/2);
}


void keyPressed()
{
    if (keyCode == RIGHT)
        myCursor.push(new PVector(-10, 0));
    else if (keyCode == LEFT)
        myCursor.push(new PVector(10, 0));
    else if (keyCode == UP)
        myCursor.push(new PVector(0, 10));
    else if (keyCode == DOWN)
        myCursor.push(new PVector(0, -10));
    else if (key == ' ')
        mousePressed();
}

void keyReleased()
{
    if (keyCode == RIGHT || keyCode == LEFT)
        myCursor.velocity.x = 0;
    else if (keyCode == UP || keyCode == DOWN)
        myCursor.velocity.y = 0;
}




