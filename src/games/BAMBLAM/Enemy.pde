class Enemy{

  float x,y,w,h,xSpeed;
  
  Enemy(float tempSpeed){
    x = width+2*xF;
    y = random(5*yF,height-8*yF);
    w = 4*xF;
    h = 4*yF;
    xSpeed = tempSpeed;
    
  
  }
  
  void updateEnemy(){
    x -= xSpeed;
  }
  
  void drawEnemy(){
    fill(enemyColor);
    rectMode(CENTER);
    rect(x,y,w,h);
    fill(140);
    quad((x-w/2),(y-h/2),(x-0.25*w), (y-h*0.625),(x+0.75*w),(y-h*0.625),(x+w/2),(y-h/2));
    fill(125);
    quad((x+w/2),(y-h/2),(x+0.75*w), (y-h*0.625),(x+w*0.75),(y+h*0.375),(x+w/2),(y+h/2));
    fill(#E41FFF);
    rect(x+0.25*w, y-0.2*h,w/8,h/4);
    rect(x-0.25*w, y-0.2*h,w/8,h/4);
    rect(x, y+0.25*h,w/1.5,h/8);
  }
  
}