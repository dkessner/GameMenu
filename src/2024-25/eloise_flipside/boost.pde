class Boost{
  float BSize;
  float pos;
  float posy;
  float BLength;
  float bHeight;
  boolean active;
  int timer;
  int side;
  
  Boost(float p, int t, int s){
    pos = width + width/5;
    posy = p;
    BSize = height*3/50;
    
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
      bHeight = (posy*height/50+BSize/2)*f*side;
      if(bHeight > 0){
        active = true;
      }else{
        active = false;
      }
    
      //drawing
      rectMode(CENTER);
      fill(0,0,255);
      //rect(pos, height/2-(bHeight+BSize/2*f*side), BSize*3, BSize*f);
      
      color c = color(#5EDBA5);
      
      strokeWeight(4);
      stroke(#5EDBA5);
      for(int i = 1; i <= 15; i++){
        strokeWeight(i/15*10 + 10);
        stroke(c, i/10.0*30);
        line(pos - BSize*1.5, height/2-(bHeight), pos - BSize*.5, height/2-(bHeight+BSize/2*f*side));
        line(pos - BSize*1.5, height/2-(bHeight+BSize*f*side), pos - BSize*.5, height/2-(bHeight+BSize/2*f*side));
        line(pos - BSize*0.5, height/2-(bHeight), pos + BSize*.5, height/2-(bHeight+BSize/2*f*side));
        line(pos - BSize*0.5, height/2-(bHeight+BSize*f*side), pos + BSize*.5, height/2-(bHeight+BSize/2*f*side));
        line(pos + BSize*0.5, height/2-(bHeight), pos + BSize*1.5, height/2-(bHeight+BSize/2*f*side));
        line(pos + BSize*0.5, height/2-(bHeight+BSize*f*side), pos + BSize*1.5, height/2-(bHeight+BSize/2*f*side));
      }
      strokeWeight(10);
      stroke(#5EDBA5);
      line(pos - BSize*1.5, height/2-(bHeight), pos - BSize*.5, height/2-(bHeight+BSize/2*f*side));
      line(pos - BSize*1.5, height/2-(bHeight+BSize*f*side), pos - BSize*.5, height/2-(bHeight+BSize/2*f*side));
      line(pos - BSize*0.5, height/2-(bHeight), pos + BSize*.5, height/2-(bHeight+BSize/2*f*side));
      line(pos - BSize*0.5, height/2-(bHeight+BSize*f*side), pos + BSize*.5, height/2-(bHeight+BSize/2*f*side));
      line(pos + BSize*0.5, height/2-(bHeight), pos + BSize*1.5, height/2-(bHeight+BSize/2*f*side));
      line(pos + BSize*0.5, height/2-(bHeight+BSize*f*side), pos + BSize*1.5, height/2-(bHeight+BSize/2*f*side));
    }
  }
}
