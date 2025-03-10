boolean isCollision(Player p, Car c)
{
  if(dist(p.a, p.b, c.x, c.y) < 20)
  {
    return true;
  }
  else
  {
    return false;
  }
}

boolean win(Player p, Lilypad l)
{
  if(dist(p.a, p.b, l.x, l.y) < 25)
  {
    return true;
  }
  else
  {
    return false;
  }
}

boolean onTurtle(Player p, Turtle t)
{
   if((p.b==t.y) && dist(p.a, p.b, t.x, t.y) < 83)
   {
    return true;
   }
   else
   {
    return false;
   }
}

boolean onSomeTurtle(Player p, ArrayList<Turtle> turtles)
{
   for (Turtle t : turtles)
   {
      if (onTurtle(p, t))
      {
          println("turtle: " + t.x + " " + t.y);
          return true;
      }
   }
   
   return false;
}

boolean onLog(Player p, Log l)
{
   if(/*(p.b==l.y) && */dist(p.a, p.b, l.x, l.y) < 65)
   {
    return true;
   }
   else
   {
    return false;
   }
}

boolean onSomeLog(Player p, ArrayList<Log> logs)
{
   for (Log l : logs)
   {
      if (onLog(p, l))
          return true;
   }
   
   return false;
}

boolean allDead()
{
  for(Player p : players)
  {
    if(p.alive)
      return false;
  }
  return true;
}
    

/*boolean alive(Player p)
{
  if((onSomeTurtle(p, turtles)== true || onSomeLog(p, logs) == true) && isCollision(p, cars) == false)
  {
    return true;
  }
  else
  {
    return false;
  }
}*/