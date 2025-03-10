
class Pipe {
 float x, y, xVel;
  boolean canScore = true;
  
  void displayPipe() {

    x = x + xVel;
  

    if (x<0) {
      xVel = xVel - 0.02*xF;
      x = x+150*xF;
      y = random(10*xF, 60*yF);
      canScore = true;
    }

    if (x<25*xF && canScore) {
      println(canScore);
      score++;
      canScore = false;
    }
    if (x<0)
      x=50*xF;

    //check if pipe is within bird x range
    if (x-3.0*xF < 30*xF && x+3.0*xF > 30*xF) {
      //println("hit by pipe");
      //check if pipe is within bird y range
      if (y+7.5*yF < mY || y-7.5*yF > mY) {
        println("why isnt this working?");
        go=2;
      }
    }

    rectMode (CENTER);     
    rect (x, y-42.5*yF, 5*xF, 70*yF);
    rect (x, y+42.5*yF, 5*xF, 70*yF);
  }
}