void drawStart()
{
  image(title, 120, 60, 600, 200);
  fill(255);
  text("choose a mode", 370, 300);
  
  fill(255);
  rect(100, 250, 250, 100);
  rect(480, 250, 250, 100);
  
  fill(0);
  text("single player", 190, 295);
  text("multiplayer", 570, 295);
  
  
}

void drawGame1()
{
  drawBack();
  
  for (Player p : players)
    p.display();
  
  carCollision();
  frogDrown();
  lose();
  winGame();
  
  /*if (players.get(0).alive == false)
  {
    println("dead");
    gameState = 3;
  }*/
  playAgain();
}

void drawGame2()
{
  drawBack();
  
  for (Player p : players)
      p.display();
  
  
  carCollision();
  frogDrown();
  lose();
  winGame();

 
}

void drawLose()
{
  stroke(255);
  text("you lose!", 400, 200);
   playAgain();
}

void drawWin()
{
  //stroke(255);
  text("you win!", 400, 200);
   playAgain();
}

void draw1Win()
{
  //stroke(255);
  text("player 2 wins!", 400, 200);
   playAgain();
}

void draw2Win()
{
  //stroke(255);
  text("player 1 wins!", 400, 200);
   playAgain();
}

void drawBack()
{
  fill(#2F6090);
  rect(0, 0, 800, 350);
  fill(0);
  rect(0, 400, 800, 300);
  strokeWeight(5);
  stroke(255, 255, 0);
  line(0, 450, 800, 450);
  line(0, 500, 800, 500);
  line(0, 550, 800, 550);
  strokeWeight(1);
  stroke(0);
  fill(#5B17A0);
  rect(0, 600, 800, 50);
  rect(0, 350, 800, 50);
 
  for (Car c : cars)
    c.display();
  
  for (Log l : logs)
    l.display();
    
  for (Turtle t : turtles)
    t.display();
    
  for (Lilypad l : lilypads)
    l.display();
    
  
  
}

void carCollision()
{
  
  for(Player p : players)
  {
    for(Car c : cars)
    {
      if(isCollision(p,c)==true)
      {
        p.alive=false;
      }
    }
  }
}

void winGame()
{
  if(gameState==1)
  {
    for(Player p : players)
    {
      for(Lilypad l: lilypads)
      {
        if(win(p,l)==true)
        {
          gameState=4;
        }
        else if(p.b<=75 && win(p, l)==false)
        {
          p.alive=false;
        }
      }
    }
  }
  if(gameState==2)
    {
   
      for(Lilypad l: lilypads)
      {
        for(Player p: players)
        {
         if(win(players.get(0),l)==true)
         {
           gameState=5;
         }
         if(win(players.get(1),l)==true)
         {
           gameState=6;
         }
         else if(p.b==75 && win(p, l)==false)
        {
          p.alive=false;
        }
        }
      }
    }
  }


void frogDrown()
{
  for(Player p : players)
  {
    if (p.b < 350 && p.b > 100 && onSomeTurtle(p, turtles) == false && onSomeLog(p, logs) == false)
    {
       p.alive=false;
    }
  }
}



void playAgain()
{
  if(gameState == 3 || gameState == 4 || gameState == 5 || gameState == 6)
  {
    fill(255);
    rect(350, 300, 150, 100);
    fill(0);
    text("play again", 390, 340);
    fill(255);
  }
  
  
}

void lose()
{
  if(allDead()==true)
  {
    gameState=3;
  }
}