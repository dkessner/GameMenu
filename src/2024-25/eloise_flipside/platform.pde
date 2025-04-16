class Platform{
  float PSize;
  float pos;
  float posy;
  float PLength;
  float pHeight;
  boolean active;
  int timer;
  int side;
  Glow g;
  
  Platform(float p, int t, int s){
    g = new Glow();
    
    pos = width + width/5;
    posy = p;
    PSize = height/50;
    
    if(p*s > 0){
      active = true;
    }else{
      active = false;
    }
    
    timer = t;
    side = s;
  }
  
  void display(float vel, float f){
    if (timer > 0){
      timer --;
    }else{    
      pos -= vel;
    
      //active/inactive
      pHeight = (posy*height/50+PSize/2)*f*side;
      if(pHeight > 0){
        active = true;
      }else{
        active = false;
      }
    
      //drawing
      rectMode(CENTER);
      fill(0,255,0);
      g.rectangle(pos, height/2-pHeight, PSize*5, abs(PSize*f), color(#FACF31), "c");
    }
  }
}
