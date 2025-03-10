
class Bullet {
  PVector startingPos = new PVector(0,0);
  PVector offset = new PVector(0,0);
  boolean isDisplayed = false;
  boolean goingLeft = false; // two plus two is for, minus one thats 3 quICK mAFS
  boolean canDestroy = false;
  
  PVector currentPos;
  
  Bullet() { 
    
  }
  
  void setStartingPos(PVector start) {
    startingPos = start;
  }
  
  void setDisplayStatus(boolean dis) {
    isDisplayed = dis;
  }
  
  void setDirection(String dir) {
    if (dir == "Left")
      goingLeft = true;
    if (dir == "Right")
      goingLeft = false;
  }
  
  void display() {
    if (isDisplayed) {
      fill(0);
      currentPos = new PVector((startingPos.x+offset.x),(startingPos.y));
      ellipse(startingPos.x+offset.x,startingPos.y, 10, 10); // mamaaaaaa, uuuuuwuuuuuu c:
      if (goingLeft) 
        offset.x -= 5;
      if (!goingLeft) 
        offset.x += 5;
        
      if (isDisplayed && startingPos.x+offset.x >= coinpos.x-coinRad && startingPos.x+offset.x <= coinpos.x+coinRad && startingPos.y >= coinpos.y-coinRad && startingPos.y <= coinpos.y+coinRad){
        isDisplayed = false;
        if (p2life > 0) {
           coinpos = new PVector(random(50,width-100),random(50,height-100));
           p1isShooting = false;
           p2life -= 1;
           image(explosion, p2pos.x-30, p2pos.y-30);
           playPunch();
        }
      } 
      if (currentPos.x < 0 || currentPos.x > width) {
          isDisplayed = false;
          canDestroy = true;
          currentPos = new PVector(0,0);
      }  
    }  
  }
}
