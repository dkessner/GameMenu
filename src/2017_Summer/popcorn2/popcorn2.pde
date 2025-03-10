import processing.sound.*;
import ddf.minim.*;


ArrayList<Popcorn> kernels;
PImage unpoppedpopcorn;
PImage poppedpopcorn;
PImage fire;
//SoundFile pop;

Minim minim;
AudioPlayer pop;

float firex;
float firey;
void setup()
{
  fullScreen();
  noCursor();
   firex =  width/2;
  firey = width/2;
  
  //pop = new SoundFile(this, "Blop-Mark_DiAngelo-79054334 (1).mp3");
  //pop = new SoundFile(this, "blop.mp3");
  
  minim = new Minim(this);
  pop = minim.loadFile("blop.mp3");
  
  kernels = new ArrayList<Popcorn>();
  unpoppedpopcorn = loadImage("images copy.png");
  unpoppedpopcorn.resize(50,50);
  poppedpopcorn = loadImage ("download-1.png");
  poppedpopcorn.resize(50,50);
  fire = loadImage("images.png");
  fire.resize(100,100);
 
}

void draw()
{
  background (255);
  for (Popcorn kernel : kernels)
    kernel.display();
  fill(#9D9C9C);
  rect(0, width/2, width, 10);
  image(fire, firex, firey);
}

void keyPressed()
{
 
  if (keyCode == UP)
  {
    kernels.add(new Popcorn(random(0, width),0,0,0));
  }
  else if (keyCode == DOWN && kernels.size() > 0)
    kernels.remove(0);
    
  if (keyCode == LEFT)
  {
    firex = firex-30;
  }
  
  if (keyCode == RIGHT)
  {
    firex = firex+30;
  }
}

class Popcorn
{
  boolean jump = false;

  
  float x;
  float y;
  float vx;
  float vy;
  float ax;
  float ay;
  
  Popcorn(float xIn, float yIn, float vxIn, float vyIn)
  {
    x = xIn;
    y = yIn;
    vx = vxIn;
    vy = vyIn;
    ay = .5;
    
  }
  
  void jump()
  {
    pop.play();
    pop.rewind();
    vy = random(-20);
    //ay = 0;
    ax = 0;
    vx = -1;
  }
  
  void display()
  {
    if (jump == false)
    {
    image(unpoppedpopcorn, x, y);
    }
    
    if (jump == true)
    {
      image (poppedpopcorn, x, y);
    }
    //x += vx;
     y += vy;
     vx += ax;
     vy += ay;
    
   
    
    if (y >= width/2.17)
    {
      vy = 0;
    }
    
    if (dist(firex, firey, x, y) <= width/10 && y >= width/2.17)
    {
      jump();
      jump = true;
    }
    
  }
}
  
