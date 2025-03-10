class Bullet {

  float x, y, w, speed;

  Bullet(Player m) {
    w = 3*xF;
    x = xF;
    y = m.y+2*yF;
    speed = yF/2;
  }

  void updateBullet() {
    x += speed;
  }

  void drawBullet() {
    fill(125);
    ellipse(x+xF/5,y-yF/5, w+xF/5,w+yF/5);
    fill(255, 0, 0);
    ellipse(x, y, w, w);
  
    
    
   
  }
}