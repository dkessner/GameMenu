class Smoke{
  
  float x,y,w,fill,alpha;
  
  Smoke(float planeX, float planeY, float planeHealth){
    x = planeX;
    y = planeY;
    alpha = 50;
    w = xF/5;
    fill = map(planeHealth,0,100,0,255);
  }

  void drawSmoke(){
    pushMatrix();
    translate(x,y,-xF);
    noStroke();
    fill(fill,fill,fill,alpha);
    ellipse(0,0,w,w);
    w+=0.01*xF;
    alpha-=0.3;
    popMatrix();
  }

}