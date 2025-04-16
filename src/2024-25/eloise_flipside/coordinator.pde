class Coordinator{
  ArrayList<Obstacle> os;
  ArrayList<Platform> ps;
  ArrayList<Boost> bs;
  Glow g;
  float vel;
  boolean flippingUp;
  boolean flippingDown;
  float flippiness;
  Obstacle o;
  Platform p;
  float globalVel;
  Player player = new Player();
  int gameTime;
  int releaseTimer;
  int jumpTimer;
  int speedTime;
  boolean boosting;
  int boostTimer;
  
  Coordinator(){
    os = new ArrayList<Obstacle>();
    ps = new ArrayList<Platform>();
    bs = new ArrayList<Boost>();
    g = new Glow();
    
    //flipping vars
    flippingUp = false;
    flippingDown = false;
    flippiness = 1;
    
    //set global speed
    globalVel = height*.005;
    
    //set timers
    gameTime = 0;
    releaseTimer = 0;
    speedTime = 0;
    boostTimer = 0;
    
    boosting = false;
  }
  
  //flipping
  void flip(){
    if(flippiness == 1){
      flippingDown = true;
    }else if (flippiness == -1){
      flippingUp = true;
    }
  }
  
  void display(){    
    releaseTimer += 1;
    
    if(releaseTimer == 200){
      releaseTimer = 0;
      float random = random(0, gameTime);
      if(random<1400){
        releaseEasy();
      }else if(random < 2800){
        releaseMedium();
      }else{
        releaseDifficult();
      }
    }
    
    
    if(boostTimer == 0){
      boosting = false;
      globalVel = height*0.005;
    }
    if(boosting){
      globalVel = height*0.005*(boostTimer/20);
      boostTimer -= 1;
    }
    
    //timers
    gameTime += 1;
    speedTime += 1;
    
    if (speedTime == 1200){
      speedTime = 0;
      frameRate(frameRate*1.1);
    }
    
    //get rid of dead objects
    for(int i = 0; i < os.size(); i++){
      if(os.get(i).pos < 0 - os.get(i).OSize*os.get(i).widthFactor){
        os.remove(i);
        i --;
      }
    }
    
    for(int i = 0; i < ps.size(); i++){
      if(ps.get(i).pos < 0 - ps.get(i).PSize*5){
        ps.remove(i);
        i --;
      }
    }
    
    for(int i = 0; i < bs.size(); i++){
      if(bs.get(i).pos < 0 - bs.get(i).BSize*3){
        bs.remove(i);
        i --;
      }
    }
    
    /*
    //background
    fill(31, 0, 48);
    rectMode(CORNER);
    rect(0,height/2,width,-height/2*flippiness);
    fill(0, 48, 34);
    //rect(0,height/2,width,height/2*flippiness);
    */
    
    //display and update objects
    for(Obstacle o: os){
      o.display(globalVel, flippiness);
    }
    for(Platform p: ps){
      p.display(globalVel, flippiness);
    }
    for(Boost b: bs){
      b.display(globalVel, flippiness);
      noStroke();
    }
    player.display(ps);
    
    //boosts
    for(Boost b: bs){
      if(player.onBoost(b)){
        boosting = true;
        boostTimer = 60;
      }
    }
    
    //draw ground
    g.rectangle(width/2, height/2, width, abs(height/50*flippiness), 255, "c");
    //flipping mechanics
    if(flippingUp == true){
      flippiness += 0.25;
      if(flippiness >= 1){
        flippiness = 1;
        flippingUp = false;
      }
    }else if (flippingDown == true){
      flippiness -= 0.25;
      if(flippiness <= -1){
        flippiness = -1;
        flippingDown = false;
      }
    }
  }
  
  //platform collision detection
  boolean checkCollisions(){
    for(Obstacle o: os){
      if(o.touchingPlayer(new PVector(width/5, player.pos), player.playerSize, globalVel, flippiness) == true){
        return true;
      }
    }
    return false;
  }
  
  //easy obstacles
  void releaseEasy(){
    float random = random(1);
    int flip;
    if(random(1)<0.5){
      flip = 1;
    }else{
      flip = -1;
    }
    if(random < 0.333){
      Obstacle o1 = new Obstacle(1,1,0,0,1*flip);
      os.add(o1);
      o1.initialize();
      Obstacle o2 = new Obstacle(1,1,0,20,1*flip);
      os.add(o2);
      o2.initialize();
      Obstacle o3 = new Obstacle(1,1,0,40,1*flip);
      os.add(o3);
      o3.initialize();
      
      releaseTimer = -40;
    }else if (random < 0.666){
      Obstacle o1 = new Obstacle (1,8,0,0,1*flip);
      os.add(o1);
      o1.initialize();
    }else{
      Obstacle o1 = new Obstacle(8,1,0,0,1*flip);
      os.add(o1);
      o1.initialize();
      Obstacle o2 = new Obstacle(8,1,0,0,-1*flip);
      os.add(o2);
      o2.initialize();
      Platform p1 = new Platform(4,0,1*flip);
      ps.add(p1);
    }
  }
  
  //medium obstacles
  void releaseMedium(){
    float random = random(1);
    int flip;
    if(random(1)<0.5){
      flip = 1;
    }else{
      flip = -1;
    }
    
    //two staggered platforms
    if(random < 0.333){
      Obstacle o1 = new Obstacle(20,1,0,20,1*flip);
      os.add(o1);
      o1.initialize();
      Obstacle o2 = new Obstacle(20,1,0,20,-1*flip);
      os.add(o2);
      o2.initialize();
      Platform p1 = new Platform(4,0,1*flip);
      ps.add(p1);
      Platform p2 = new Platform(8,40,1*flip);
      ps.add(p2);
      
      releaseTimer = -50;
    }else if (random < 0.666){
      //up down up
      Obstacle o1 = new Obstacle(8,1,0,0,1*flip);
      os.add(o1);
      o1.initialize();
      Obstacle o2 = new Obstacle(8,1,0,60,-1*flip);
      os.add(o2);
      o2.initialize();
      Obstacle o3 = new Obstacle(8,1,0,120,1*flip);
      os.add(o3);
      o3.initialize();
      releaseTimer = -120;
    }else{
      //boost one
      Obstacle o1 = new Obstacle(10,1,0,0,1*flip);
      os.add(o1);
      o1.initialize();
      Obstacle o2 = new Obstacle(1,8,0,18,-1*flip);
      os.add(o2);
      o2.initialize();
      Boost b1 = new Boost(4,0,1*flip);
      bs.add(b1);
      releaseTimer = -18;
    }
  }
  
  //difficult obstacles
  void releaseDifficult(){
    float random = random(1);
    int flip;
    if(random(1)<0.5){
      flip = 1;
    }else{
      flip = -1;
    }   
    
    if(random < 0.333){
      //flip jump up
      Platform p1 = new Platform(4,0,1*flip);
      ps.add(p1);
      Platform p2 = new Platform(8,40,-1*flip);
      ps.add(p2);
      Platform p3 = new Platform(12,80,1*flip);
      ps.add(p3);
      Obstacle o1 = new Obstacle(1,8,0,100,1*flip);
      os.add(o1);
      o1.initialize();
      Obstacle o2 = new Obstacle(1,8,0,100,-1*flip);
      os.add(o2);
      o2.initialize();
      releaseTimer = -100;
    }else if (random < 0.666){
      //boost two
      Obstacle o1 = new Obstacle(10,1,0,12,1*flip);
      os.add(o1);
      o1.initialize();
      Obstacle o2 = new Obstacle(1,8,0,30,-1*flip);
      os.add(o2);
      o2.initialize();
      Boost b1 = new Boost(4,0,-1*flip);
      bs.add(b1);
      releaseTimer = -24;
    }else{
      //fake flip jump up
      Platform p1 = new Platform(4,0,1*flip);
      ps.add(p1);
      Platform p2 = new Platform(8,40,-1*flip);
      ps.add(p2);
      Platform p3 = new Platform(2,70,1*flip);
      ps.add(p3);
      Obstacle o1 = new Obstacle(30,1,0,40,1*flip);
      os.add(o1);
      o1.initialize();
      Obstacle o2 = new Obstacle(30,1,0,40,-1*flip);
      os.add(o2);
      o2.initialize();
      releaseTimer = -70;
    }
  }
  
  void reset(){
    for (int i = 0; i < os.size();){
      os.remove(i);
    }
    
    for (int i = 0; i < ps.size();){
      ps.remove(i);
    }
    
    for (int i = 0; i < bs.size();){
      bs.remove(i);
    }
    
    frameRate(60);
    gameTime = 0;
    releaseTimer = 0;
  }
}
