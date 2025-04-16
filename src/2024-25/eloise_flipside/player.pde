class Player{
  float acc;
  float vel;
  float pos;
  boolean jumping;
  boolean goingDown;
  boolean onp;
  float playerSize;
  Glow glow;
  
  Player(){
    acc = 0;
    vel = 0;
    pos = 0;
    
    onp = false;
    playerSize = g.height/50;
    goingDown = false;
    
    glow = new Glow();
  }
  
  void display(ArrayList<Platform> platforms){
    int temp = 0;
    //checking if on platform
    for (Platform p: platforms){
      if(onPlatform(p) == true){
        pos = p.pHeight;
        temp += 1;
        jumping = false;
        break;
      }
    } 

    onp = temp > 0;
    
    
    if (onp == true){
      vel = 0;
      acc = 0;
      jumping = false;
    }
    
    if(onp == false && pos > 0){
      jumping = true;
    }   
    
    //sets if going down
    if(vel < 0){
      goingDown = true;
    }else{
      goingDown = false;
    }
    
    //gravity
    if (jumping == true){
      onp = false;
      acc = -playerSize*0.04;
    }
    
    //updates
    vel += acc;
    pos += vel;
    
    //drawing
    rectMode(CENTER);
    fill(255);
    glow.rectangle(width/5, height/2-height/50 - pos, height/50, height/50, 255, "c");
    
    //stop at ground
    if (pos == 0 || pos + acc <= 0){
      jumping = false;
      pos = 0;
      acc = 0;
      vel = 0;
    }
  }
  
  //jumping
  void jump(){
    if(jumping != true){
      jumping = true;
      vel = playerSize*3/4; 
      onp = false;
      jump.play();
    }
  }
  
  //collision detection for platforms
  boolean onPlatform(Platform p){
    if(goingDown == true && p.active == true){
      if(p.pos - p.PSize*2.5 <= width/5 && p.pos + p.PSize*2.5 >= width/5){
        if(pos >= p.pHeight && pos <= p.pHeight + p.PSize){
          return true;
        }else if(pos + vel >= p.pHeight && pos + vel <= p.pHeight + p.PSize){
          return true;
        }
      }
    }else if(p.pos - p.PSize*2.5 <= width/5 && p.pos + p.PSize*2.5 >= width/5 && onp == true && pos == p.pHeight && p.active == true){
      return true;
    }
    return false;
  }
  
  
  //collision detection for boosts
  boolean onBoost(Boost b){
    if(b.active){
      if(b.pos - b.BSize*2.5 <= width/5 && b.pos + b.BSize*2.5 >= width/5){
        if(pos >= b.bHeight && pos <= b.bHeight + b.BSize){
          return true;
        }
      }
    }
    return false;
  }
}
