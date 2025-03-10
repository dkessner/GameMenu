void Statechange()
{
  if (state == 0 && harry.x<100 && harry.y>500)
    {
        state = 1;
    }
  if (state == 2 && firstak.y > 550)
    {
      state = 3;
    }
  
  if (state == 3)
  {
   state = 4;
  }
  if(state == 6)
  {
    state = 7;
  }
  if(state == 7)
  {
    state = 8;
  }
  if(state == 8)
  {
    state = 9;
  }
  if(state == 9)
  {
    
    state = 10;
  }
  if(state == 10)
  {
    state = 11;
  }
  if(state == 11)
  {
    state = 12;
  }
  if(state == 12)
  {
    state = 13;
  }
  if(voldy.x == 250 && voldy.y == 350)
  {
    state = 14;
  }
  if(state == 14 && followers.x == 200 && followers.y == 300) //|| state == 16 && avad.x < 0)
  {
    state = 15;
  }
  if(state == 15)
  {
    println("VOLTRON FTW");
  }
  if (spell_collide())
  {
    state = 16;
  }
  if(state == 16 && priorinc.w > 1200 || state == 16 && priorinc.h > 1200)
  {
    state = 15;
  }
 /* if(spell_kill())
  {
    state = 17;
  }
  /*if(a.x < e.x + e.w/2 && a.x > e.x - e.w/2)
    {
      state = 16;
    }
  /*if(avad.x - avad.w/2 < voldy.y + voldy.w/2 && avad.x + avad.w/2 > voldy.y - voldy.w/2)
  {
    state = 16;
    background(0);
  }
  //sixteen declared in keyPressed
  /*if(avad.x < 0)
  {
    state = 15;
  }*/
}