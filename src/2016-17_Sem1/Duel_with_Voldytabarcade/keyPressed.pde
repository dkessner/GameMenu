void keyPressed()
{
  if(state == 15)
  {
    if(keyCode == RIGHT)
    {
      harry.vx = 5;
      //voldy.x = voldy.x + 10;
    }
    if(keyCode == LEFT)
    {
      harry.vx = - 5;
      //voldy.x = voldy.x - 10;
    }
    if(keyCode == UP)
    {
      harry.vy = - 5;
     // voldy.y = voldy.y - 10;
    }
    if(keyCode == DOWN)
    {
      harry.vy = 5;
      //voldy.y = voldy.y + 10;
    }
    
    if(key == 'd')
    {
      voldy.vx = 5;
     // harry.x = harry.x + 10;//harry.vx;
    }
    if(key == 'a')
    {
      voldy.vx = -5;
      //harry.x = harry.x - 10;// harry.x;
    }
    if(key == 'w')
    {
      voldy.vy = -5;
      //harry.y = harry.y - 10; //harry.vy;
    }
    if(key == 's')
    {
      voldy.vy = 5;
     // harry.y = harry.y + 10; //harry.vy;
    }
    
    
    
    if(key == '1')
   {
     avads.add(new Avad(voldy.x - 100, voldy.y+ 40));
   }
   
   if(key == ' ')
   {
     expels.add(new Expel(harry.x, harry.y+30));
   }
    
   // if(key == 'k')
   // {
      //avad.x = voldy.x;
     // avad.vx = -10;
    //}
     /* avads.add(new Avad());
      for (int i = avads.size();i>2;i = 1)
      {
    //Avad current  = avads.get(i);//store the current drawing
   // Avad previous = avads.get(i-1);//store the previous drawing
    //current  = previous;//point the current to the previous
      }
      /*if(state == 16 && avads.size == 1)
      {
        avads.size = 1;
      }*/
    /*if(key == 'k' && avad.x < -30)
    {
      avad.x = voldy.x;
      avad.y = voldy.y + 50;
      state = 15;
    }*/
    
  }
  if(state == 17)
  {
    if(keyCode == ENTER)
   {
     
     for(Avad a: avads)
    {
      //for(Expel e: expels)
       
        //if(a.x < e.x + e.w/2 && a.x > e.x - e.w/2 && a.y > e.y - e.h/2 && a.y < e.y + e.h/2)
            a.x = -100;
            //e.x = 900;
            
          
      }
       for(Expel e: expels)
      {
        e.x = 900;
      }
       state = 14;
       harry.x = 45;
      harry.y = 300;
      voldy.x = 450;
      voldy.y = 350;
       noStroke();
    }
    //state = 14;
   
 }
    /*if(key == 'r')
    {
      {
      for(Avad a: avads)
    {
      for(Expel e: expels)
      {
        /*if(a.x < e.x + e.w/2 && a.x > e.x - e.w/2 && a.y > e.y - e.h/2 && a.y < e.y + e.h/2)
          {
            return true;
          }*/
         /* a.x = -100;
          e.x = 900;
      }
    }
    }
    }
  }*/
  /*if(state == 18)
  {
    if(key == 'r')
    {
      for(Avad a: avads)
    {
      for(Expel e: expels)
      {
        /*if(a.x < e.x + e.w/2 && a.x > e.x - e.w/2 && a.y > e.y - e.h/2 && a.y < e.y + e.h/2)
          {
            return true;
          }
          a.x = -100;
          e.x = 900;
      }
    }
    }
  }*/
  if(state == 18)
  {
    if(key == '3')
    {
      state = 19;
    }
  }
 if(state == 19)
 {
   if(keyCode == ENTER)
   {
     
     for(Avad a: avads)
    {
      //for(Expel e: expels)
       
        //if(a.x < e.x + e.w/2 && a.x > e.x - e.w/2 && a.y > e.y - e.h/2 && a.y < e.y + e.h/2)
            a.x = -100;
            //e.x = 900;
            
          
      }
      for(Expel e: expels)
      {
        e.x = 900;
      }
       state = 14;
       noStroke();
       harry.x = 45;
      harry.y = 300; 
      voldy.x = 450;
      voldy.y = 350;
    }
    //state = 14;
   
 }
}

void keyReleased()
{
  harry.vx = 0;
  harry.vy = 0;
  voldy.vx = 0;
  voldy.vy = 0;
}