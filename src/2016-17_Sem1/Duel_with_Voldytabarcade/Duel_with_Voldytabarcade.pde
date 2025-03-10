PImage img;
PImage i;
PImage igy;
PImage imcg;
PImage imcd;
PImage imdcd;
PImage impvg;    
PImage imfakg;
PImage imcaul1g;
PImage impg;
PImage imcaul2g;
PImage imcaul3g;
PImage imcaul4g;
PImage imcaul5g;
PImage imcaul6g;
PImage imcaul7g;
PImage imcaul8g;
PImage imcaul9g;
PImage imvoldg;
PImage imfollg;
PImage imdyg;

float timer;
float interval;
/*float timer;
 float interval;
 boolean noharry;*/

int state = 0;

ArrayList<Avad> avads;
ArrayList<Expel> expels;

Harry harry;
Cedric cedric;
Cup cup;
Peter peter;

Firstak firstak;
Cauldron cauldron;
Voldy voldy;
Followers followers;

Avad avad;
Expel expel;
Priorinc priorinc;
//Pwand pwand;



void setup()
{
  size(600, 600);
  img = loadImage("Harry.png");
  i = loadImage("Voldemort.png");
  igy = loadImage("Graveyard.png");
  imcg = loadImage("Cup.png");
  imcd = loadImage("Cedric.png");
  imdcd = loadImage("Deadced.png");
  impvg = loadImage("Petervoldy.png");
  imfakg = loadImage("Firstak.png");
  imcaul1g = loadImage("Cauldron1.png");
  impg = loadImage("Peter.png");
  imcaul2g = loadImage("Cauldron2.png");
  imcaul3g = loadImage("Cauldron3.png");
  imcaul4g = loadImage("Cauldron4.png");
  imcaul5g = loadImage("Cauldron5.png");
  imcaul6g = loadImage("Cauldron6.png");
  imcaul7g = loadImage("Cauldron7.png");
  imcaul8g = loadImage("Cauldron8.png");
  imcaul9g = loadImage("Cauldron9.png");
  imvoldg = loadImage("Voldemort.png");
  imfollg = loadImage("Followers.png");
  imdyg = loadImage("Duelyard.png");
  
  avads = new ArrayList<Avad>();
  
  expels = new ArrayList<Expel>();

  harry = new Harry();
  cedric = new Cedric();
  cup = new Cup();
  peter = new Peter();
  firstak = new Firstak();
  cauldron = new Cauldron();
  voldy = new Voldy();
  followers = new Followers();
  priorinc = new Priorinc();
  //avad =  new Avad();
  //pwand = new Pwand();

  /*timer = millis();
   interval = 3000;
   noharry = true;*/
}

void draw()
{
  Statechange();
  
  if (state == 0)
  {
    draw_arrival();
  }
  if (state == 1)
  {
    draw_parrival();
  }
  if (state == 2)
  {
    draw_murder();
  }
  if (state==3)
  {
    draw_death();
  }
  if (state==4)
  {
    draw_papproach();
  }
  if (state == 5)
  {
    draw_ptoss();
  }
  if(state==6)
  {
    draw_1voldy();
  }
  if(state == 7)
  {
    draw_2voldy();
  }
  if(state == 8)
  {
    draw_3voldy();
  }
  if(state == 9)
  {
    draw_4voldy();
  }
  if(state == 10)
  {
    draw_5voldy();
  }
  if(state == 11)
  {
    draw_6voldy();
  }
  if(state == 12)
  {
    draw_7voldy();
  }
  if(state == 13)
  {
    draw_voldemerge();
  }
  if(state == 14)
  {
    draw_voldsummon();
  }
  if(state == 15)
  {
    draw_duelstart();
  }
  if(state == 16)
  {
    draw_priorinc();
  }
  if(state == 17)
  {
    draw_failh();
  }
  if(state == 18)
  {
    draw_failv();
  }
  if(state == 19)
  {
    draw_home();
  }
}


void draw_arrival()
{
  image(igy, 0, 0, 620, 620);
  /*if(millis() > timer + interval)
   {
   timer = millis();
   noharry = !noharry;
   }*/
  harry.display();
  cedric.display();
  cup.display();
  cauldron.display();
  //pwand.display();
}

void draw_parrival()
{
  image(igy, 0, 0, 620, 620);
  harry.display();
  cedric.display();
  cup.display();
  peter.display();
  cauldron.display();
  //firstak.display();
}

void draw_murder()
{
  image(igy, 0, 0, 620, 620);
  harry.display();
  cedric.display();
  cup.display();
  firstak.display();
  peter.display();
  cauldron.display();
}


void draw_death()
{
  image(igy, 0, 0, 620, 620);
  harry.display();
  cedric.display();
  cup.display();
  peter.display();
  firstak.display();
  cauldron.display();
}

void draw_papproach()
{
  image(igy, 0, 0, 620, 620);
  harry.display();
  cedric.display();
  cup.display();
  peter.display();
  firstak.display();
  cauldron.display();
}

void draw_ptoss()
{
   harry.display();
  cedric.display();
  cup.display();
  firstak.display();
  cauldron.display();
  //peter.display();
}

void draw_1voldy()
{
  image(igy, 0, 0, 620, 620);
  harry.display();
  cedric.display();
  cup.display();
  firstak.display();
  cauldron.display();
  peter.display();
}

void draw_2voldy()
{
  image(igy, 0, 0, 620, 620);
  harry.display();
  cedric.display();
  cup.display();
  firstak.display();
  cauldron.display();
  peter.display();
}


void draw_3voldy()
{
  image(igy, 0, 0, 620, 620);
  harry.display();
  cedric.display();
  cup.display();
  firstak.display();
  cauldron.display();
  peter.display();
}

void draw_4voldy()
{
  image(igy, 0, 0, 620, 620);
  harry.display();
  cedric.display();
  cup.display();
  firstak.display();
  cauldron.display();
  peter.display();
}

void draw_5voldy()
{
  image(igy, 0, 0, 620, 620);
  harry.display();
  cedric.display();
  cup.display();
  firstak.display();
  cauldron.display();
  peter.display();
}

void draw_6voldy()
{
  image(igy, 0, 0, 620, 620);
  harry.display();
  cedric.display();
  cup.display();
  firstak.display();
  cauldron.display();
  peter.display();
}


void draw_7voldy()
{
  image(igy, 0, 0, 620, 620);
  harry.display();
  cedric.display();
  cup.display();
  firstak.display();
  cauldron.display();
  peter.display();
}

void draw_8voldy()
{
  image(igy, 0, 0, 620, 620);
  harry.display();
  cedric.display();
  cup.display();
  firstak.display();
  cauldron.display();
  peter.display();
}

void draw_voldemerge()
{
  image(igy, 0, 0, 620, 620);
  harry.display();
  cedric.display();
  cup.display();
  firstak.display();
  cauldron.display();
  peter.display();
  voldy.display();
}

void draw_voldsummon()
{
  image(igy, 0, 0, 620, 620);
  followers.display();
  harry.display();
  cedric.display();
  cup.display();
  firstak.display();
  cauldron.display();
  peter.display();
  voldy.display();
}

void draw_duelstart()
{
  image(igy, 0, 0, 620, 620);
  followers.display();
  harry.display();
  cedric.display();
  cup.display();
  firstak.display();
  cauldron.display();
  peter.display();
  voldy.display();
  
  for(Avad a: avads)
    {
      a.display();
    }
  for(Expel e: expels)
    {
      e.display();
    }
  
}

void draw_priorinc()
{
  image(igy, 0, 0, 620, 620);
  followers.display();
  harry.display();
  cedric.display();
  cup.display();
  firstak.display();
  cauldron.display();
  peter.display();
  voldy.display();
  priorinc.display();
  
  for(Avad a: avads)
    {
      a.display();
    }
  for(Expel e: expels)
    {
      e.display();
    }
}

boolean spell_collide()
{
  for(Avad a: avads)
    {
      for(Expel e: expels)
      {
        if(a.x < e.x + e.w/2 && a.x > e.x - e.w/2 && a.y > e.y - e.h/2 && a.y < e.y + e.h/2)
          {
            return true;
          }
      }
    }
    return false;
}

boolean spell_kill()
{
  for(Avad a: avads)
  {
    if(a.x < harry.x + harry.w/2 && a.x > harry.x - harry.w/2 && a.y > harry.y /*- harry.h/2*/ && a.y < harry.y + harry.h/2)
    {
      return true;
    }
  }
  return false;
}

void draw_failh()
{
  background(0);
  stroke(255);
  text("You just messed up the whole series, Harry! You were supposed to win!", 100, 300);
  text("Press ENTER to play again", 100, 320);
  //text("Press 'r' multiple times to play again.", 100, 400);
}

void draw_failv()
{
  background(0);
  stroke(255);
  text("That was just luck, right? You didn't just SERIOUSLY lose to a fourteen-year-old mediocrity, right?", 0, 300);
  text("Harry, you may now click '3' to summon the cup and escape. Nice job.", 0, 315);
  //text("Press 'r' multiple times to play again.", 100, 400);
}

void draw_home()
{
  background(100, 255, 100);
  stroke(0);
  fill(0);
  text("Congratulations! You got away. Enjoy PTSD.", 0, 300);
  text("Press ENTER to play again.", 0, 320);
}
/*void draw_avad()
{
  image(igy, 0, 0, 620, 620);
  followers.display();
  harry.display();
  cedric.display();
  cup.display();
  firstak.display();
  cauldron.display();
  peter.display();
  voldy.display();
  avad.display();
  /*for(Avad a: avads)
  {
    a.display();
  }*/
class Voldy
{
  float x = 100;
  float y = 300;
  float w = 150;
  float h = 100;
  
  float vx = 0;
  float vy = 0;
  void display()
  {
    if(state == 13)
    {
    println("Hey Voldy!");
    image(imvoldg, x, y, w, h);
    x += vx;
    y += vy;
    if(x > 250)
    {
      x = 250;
    }
    if(y > 350)
    {
      y = 350;
    }
    vx = 2;
    vy = 2;
    
    }
    if(state == 14)
    {
      vx = 0;
      vy = 0;
      image(imvoldg, x, y, w, h);
      println("14 yo");
      text("Time to duel!", 300, 300);
      x = 485;
      y = 300;
    }
    if(state == 15)
    {
      image(imvoldg, x, y, w, h);
      x += vx;
      y += vy;
    }
  }
}