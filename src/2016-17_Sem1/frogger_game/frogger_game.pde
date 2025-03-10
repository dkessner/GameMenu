  int gameState = 0;
  int w = 10;
  int z = 50;
  
PImage title;


ArrayList<Car> cars = new ArrayList<Car>();

ArrayList<Log> logs = new ArrayList<Log>();

ArrayList<Turtle> turtles = new ArrayList<Turtle>();

ArrayList<Lilypad> lilypads = new ArrayList<Lilypad>();

ArrayList<Player> players;


void setup()
{
  
  title = loadImage("frogger-marquee.png");
  size(800, 650);
  
  cars.add(new Car(212, 427, 2, 0));
  cars.add(new Car(212, 477, -2, 0));
  cars.add(new Car(212, 527, 2, 0));
  cars.add(new Car(212, 577, -2, 0));
  cars.add(new Car(412, 427, 2, 0));
  cars.add(new Car(412, 477, -2, 0));
  cars.add(new Car(412, 527, 2, 0));
  cars.add(new Car(412, 577, -2, 0));
  cars.add(new Car(612, 427, 2, 0));
  cars.add(new Car(612, 477, -2, 0));
  cars.add(new Car(612, 527, 2, 0));
  cars.add(new Car(612, 577, -2, 0));
 
  
  logs.add(new Log(265, 125, 1, 0));
  logs.add(new Log(465, 125, 1, 0));
  logs.add(new Log(665, 125, 1, 0));
  logs.add(new Log(265, 225, 2, 0));
  logs.add(new Log(465, 225, 2, 0));
  logs.add(new Log(665, 225, 2, 0));
  logs.add(new Log(265, 275, -1, 0));
  logs.add(new Log(465, 275, -1, 0));
  logs.add(new Log(665, 275, -1, 0));
  
  turtles.add(new Turtle(200, 175, -2, 0));
  turtles.add(new Turtle(450, 175, -2, 0));
  turtles.add(new Turtle(700, 175, -2, 0));
  turtles.add(new Turtle(200, 325, 1, 0));
  turtles.add(new Turtle(450, 325, 1, 0));
  turtles.add(new Turtle(700, 325, 1, 0));
 
  lilypads.add(new Lilypad(100, 75));
  lilypads.add(new Lilypad(200, 75));
  lilypads.add(new Lilypad(300, 75));
  lilypads.add(new Lilypad(400, 75));
  lilypads.add(new Lilypad(500, 75));
  lilypads.add(new Lilypad(600, 75));
  lilypads.add(new Lilypad(700, 75));
  
  initializePlayers();
}


void initializePlayers()
{
  players = new ArrayList<Player>();
  
  if(gameState==1)
  {
    players.add(new Player(400, 625, 0));
  }
  if(gameState==2)
  {
    players.add(new Player(500, 625, 0));
    players.add(new Player(300, 625, 0));
  }  
}

void draw()
{
  background(0);
  if (gameState == 0)
  {
    drawStart();
  }
  else if (gameState == 1)
  {
    drawGame1();

  }
  else if (gameState == 2)
  {
    drawGame2();
   
  }
  else if (gameState ==3)
  {
    drawLose();
  }
  else if (gameState ==4)
  {
    drawWin();
  }
  else if (gameState ==5)
  {
    draw1Win();
  }
  else if (gameState ==6)
  {
    draw2Win();
  }
  
  
}

void mousePressed()
{
  if(gameState==0 && mouseX < 350 && mouseX > 100 && mouseY < 350 && mouseY > 250)
  {
    gameState = 1;
    initializePlayers();
  }
  if(gameState==0 && mouseX < 730 && mouseX > 480 && mouseY < 350 && mouseY > 250)
  {
    gameState = 2;
    initializePlayers();
  }
  if((gameState==3 || gameState==4 || gameState==5 || gameState==6) && mouseX > 350 && mouseX < 500 && mouseY > 300 && mouseY < 400)
  {
    gameState=0;
  }
}

void keyPressed()
{
  
    if(gameState==0)
    {
      if(keyCode == LEFT)
      {
        gameState=1;
        initializePlayers();
      }
      if(keyCode == RIGHT)
      {
        gameState=2;
        initializePlayers();
      }
    }
     
    else if (gameState==1 || gameState==2)
    {
      if (keyCode == UP && players.get(0).b > 75)
      {
        players.get(0).b = players.get(0).b - z;
      }
      else if(keyCode == DOWN && players.get(0).b < 600)
      {
        players.get(0).b = players.get(0).b + z;
      }
      if (keyCode == LEFT && players.get(0).a > 50 && players.get(0).b > 125)
      {  
        players.get(0).a = players.get(0).a - w;
      }
      if (keyCode == RIGHT && players.get(0).a < width-50 && players.get(0).b > 125)
      {
        players.get(0).a = players.get(0).a + w;
      }
      if(gameState==2)
      {
      if (key == 'w' && players.get(1).b > 75)
      {
        players.get(1).b = players.get(1).b - z;
      }
      else if(key == 's' && players.get(1).b < 600)
      {
        players.get(1).b = players.get(1).b + z;
      }
      if (key == 'a' && players.get(1).a > 50 && players.get(1).b > 125)
      {
        players.get(1).a = players.get(1).a - w;
      }
      if (key == 'd' && players.get(1).a < width-50 && players.get(1).b > 125)
      {
        players.get(1).a = players.get(1).a + w;
      }
    }
  }
  
  else if(gameState==3 || gameState==4 || gameState==5 || gameState==6)
  {
    gameState=0;
  }
  }
  