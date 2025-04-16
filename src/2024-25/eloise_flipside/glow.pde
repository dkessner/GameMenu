class Glow{
  Glow(){
  }
  
  void rectangle(float xPos, float yPos, float w, float h, color c, String m){
    if(m.equals("c")){
      rectMode(CENTER);
      for(int i = 1; i <= 15; i++){
        fill(c, i/10.0*30);
        rect(xPos, yPos, w + (10-i)/10.0*width/50, h + (10-i)/10.0*width/50);
      }
      fill(c);
      rect(xPos, yPos, w, h);
    }else{
      rectMode(CORNER);
      if(h <= 0){
        for(int i = 1; i <= 15; i++){
          fill(c, i/10.0*30);
          rect(xPos - (10-i)/10.0*width/100, yPos + (10-i)/10.0*width/100, w + (10-i)/10.0*width/50, h - (10-i)/10.0*width/50);
        }
      }else{
        for(int i = 1; i <= 15; i++){
          fill(c, i/10.0*30);
          rect(xPos - (10-i)/10.0*width/100, yPos - (10-i)/10.0*width/100, w + (10-i)/10.0*width/50, h + (10-i)/10.0*width/50);
        }
      }
      fill(c);
      rect(xPos, yPos, w, h);
    }
  }
  
  void text(float xPos, float yPos, float s, String t){
  }
}
