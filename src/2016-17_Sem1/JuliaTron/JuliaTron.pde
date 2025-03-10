int psize = 10;
int p1score, p2score;
float timer = 3600;
String endCommand = "";
boolean startScreen = true;

Player p1, p2;

void setup()
{
  fullScreen();
  noCursor();
  p1 = new Player(#FA9DFF, 100, 100, DOWN);
  p2 = new Player(#99F5E8, width-100, height-100, UP);
}

void draw()
{
  if (startScreen) startScreen();
  else
  {
    background(0);
    
    p1.update();
    p2.update();
    
    if (lost(p1, p2) && lost(p2, p1)) end(p1, true);
    else if (suicide(p1) || lost(p1, p2) || edge(p1)) 
    {
      p2score++;
      end(p1, false);
    }
    else if (suicide(p2) || lost(p2, p1) || edge(p2))
    {
      p1score++;
      end(p2, false);
    }
    
    display();
  }
}

void startScreen()
{
  background(0);
  textAlign(CENTER);
  fill(255);
  textSize(200);
  text("TRON", width/2, height/2);
  textSize(30);
  text("BY: JULIA HINDLE", width/2, height/2+40);
  text("PRESS ANYTHING TO BEGIN", width/2, height-50);
  textAlign(LEFT);
  noLoop();
  //text
}

void display()
{
  timer -= 1;
  fill(255, 150);
  if (timer < 300) fill(255, 0, 0, 200);
  textSize(40);
  text(timer/60, 10, 60);
  
  if (timer <= 0) end(p1, true);
}

boolean suicide(Player p)
{
  for (Trail trail : p.trails)
  {
    if ((p.px+10 > trail.x1 && p.px < trail.x2 && p.py+10 > trail.y1 && p.py < trail.y2 && (trail.dir == DOWN || trail.dir == RIGHT)
    || p.px+10 > trail.x1 && p.px < trail.x2 && p.py+10 < trail.y1 && p.py > trail.y2 && trail.dir == UP
    || p.px < trail.x1 && p.px+10 > trail.x2 && p.py+10 > trail.y1 && p.py < trail.y2 && trail.dir == LEFT) && trail.stall > 14 && trail.close)
    {
      endCommand += "YOU RAN INTO YOUR OWN TRAIL";
      return true;
    }
  }
  return false;
}

boolean lost(Player p, Player win)
{
  for (Trail trail1 : win.trails)
  {
    if (p.px+10 > trail1.x1 && p.px < trail1.x2 && p.py+10 > trail1.y1 && p.py < trail1.y2 && (trail1.dir == DOWN || trail1.dir == RIGHT)
    || p.px+10 > trail1.x1 && p.px < trail1.x2 && p.py+10 < trail1.y1 && p.py > trail1.y2 && trail1.dir == UP
    || p.px < trail1.x1 && p.px+10 > trail1.x2 && p.py+10 > trail1.y1 && p.py < trail1.y2 && trail1.dir == LEFT)
    {
      endCommand += "YOU RAN INTO THE OTHER PLAYER'S TRAIL";
      return true;
    }
  }
  return false;
}

boolean edge(Player p)
{
  if (p.px+psize < 0 || p.px > width || p.py+psize < 0 || p.py > height) 
  {
    endCommand += "YOU RAN OFF THE EDGE OF THE SCREEN";
    return true;
  }
  return false;
}

void end(Player p, boolean draw)
{
  fill(0, 200);
  noStroke();
  rect(0, 0, width, height);
  fill(255);
  textSize(40);
  if (draw) text("IT WAS A DRAW", 100, 100);
  else 
  {
    text("    LOSES", 100, 100);
    fill(p.pfill);
    rect(100, 100, 40, -40);
    fill(255);
    text(endCommand, 100, 150);
  }
  
  fill(p1.pfill);
  text("P1 GAME WINS: " + p1score, 100, 250);
  fill(p2.pfill);
  text("P2 GAME WINS: " + p2score, 100, 300);
  fill(255);
  text("PRESS THE FIRST RED BUTTON TO RESTART", 100, height-50);
  noLoop();
}

class Player
{
  color pfill;
  float px, py;
  int pdir;
  int speed = 2;
  ArrayList<Trail> trails = new ArrayList<Trail>();
  
  Player(color pfill_, float px_, float py_, int pdir_)
  {
    pfill = pfill_;
    px = px_;
    py = py_;
    pdir = pdir_;
    trails.add(new Trail(pfill, px, py, pdir));
  }
  
  void update()
  {
    
    if (pdir == LEFT) px-=speed;
    if (pdir == RIGHT) px+=speed;
    if (pdir == UP) py-=speed;
    if (pdir == DOWN) py+=speed;
    
    for (Trail trail : trails)
    {
      if (!trail.close)
      {
        if (trail.dir == LEFT)
        {
          trail.x2 = px;
          trail.y2 = py+10;
        }
        if (trail.dir == RIGHT)
        {
          trail.x2 = px+10;
          trail.y2 = py+10;
        }
        if (trail.dir == UP)
        {
          trail.x2 = px+10;
          trail.y2 = py;
        }
        if (trail.dir == DOWN)
        {
          trail.x2 = px+10;
          trail.y2 = py+10;
        }
      }
      trail.update();
    }
    
    strokeWeight(2);
    stroke(255);
    noFill();
    rect(px, py, psize, psize);
  }
  
  void left()
  {
    pdir = LEFT;
    for (Trail trail : trails) trail.close = true;
    trails.add(new Trail(pfill, px, py, pdir));
  }
  
  void right()
  {
    pdir = RIGHT;
    for (Trail trail : trails) trail.close = true;
    trails.add(new Trail(pfill, px, py, pdir));
  }
  
  void up()
  {
    pdir = UP;
    for (Trail trail : trails) trail.close = true;
    trails.add(new Trail(pfill, px, py, pdir));
  }
  
  void down()
  {
    pdir = DOWN;
    for (Trail trail : trails) trail.close = true;
    trails.add(new Trail(pfill, px, py, pdir));
  }
}

class Trail
{
  float x, y, x1, y1, x2, y2;
  boolean close = false;
  color fill;
  int dir, stall;
  
  Trail(color fill_, float x1_, float y1_, int dir_)
  {
    x1 = x1_;
    y1 = y1_;
    dir = dir_;
    fill = fill_;
  }
  
  void update()
  {
    if (close && stall < 15) stall += 1;
    noStroke();
    fill(fill);
    rectMode(CORNERS);
    rect(x1, y1, x2, y2);
    rectMode(CORNER);
  }
}

void keyPressed()
{
  if (startScreen)
  {
    loop();
    startScreen = false;
  }
  
  if (keyCode == LEFT && p1.pdir != RIGHT) p1.left();        //////////////////
  if (keyCode == RIGHT && p1.pdir != LEFT) p1.right();
  if (keyCode == UP && p1.pdir != DOWN) p1.up();
  if (keyCode == DOWN && p1.pdir != UP) p1.down();
  
  if (key == 'a' && p2.pdir != RIGHT) p2.left();
  if (key == 'd' && p2.pdir != LEFT) p2.right();
  if (key == 'w' && p2.pdir != DOWN) p2.up();
  if (key == 's' && p2.pdir != UP) p2.down();
  
  if (keyCode == ENTER)
  {
    timer = 3600;
    p1 = new Player(#FA9DFF, 100, 100, DOWN);
    p2 = new Player(#99F5E8, width-100, height-100, UP);
    endCommand = "";
    loop();
  }
}