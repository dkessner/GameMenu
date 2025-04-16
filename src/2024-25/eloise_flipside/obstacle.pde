class Obstacle {
  float OSize;
  float OHeight;
  int widthFactor;
  int heightFactor;
  float pos;
  int timer;
  int side;
  Glow g;

  Obstacle(int w, int h, float o, int t, int s) {
    OSize = height/50;
    widthFactor = w;
    heightFactor = h;
    OHeight = o;
    timer = t;
    side = s;
    
    g = new Glow();
  }

  void initialize() {
    pos = width + width/5;
  }

  void display(float vel, float f) {
    if (timer > 0) {
      timer --;
    } else {
      pos -= vel;

      //drawing
      rectMode(CORNER);
      fill(255, 0, 0);
      g.rectangle(pos - OSize*widthFactor/2 , height/2-(OSize/2 + OSize*heightFactor + OHeight)*f*side, OSize*widthFactor, OSize*heightFactor*f*side, color(#E72696), "r");
    }
  }

    //collision detection
    boolean touchingPlayer(PVector PP, float PS, float vel, float f) {
      //DOES NOT WORK - jk maybe it does???
      if (f*side*OSize < OSize) {
        return false;
      }

      if (pos + OSize*widthFactor/2 > PP.x - PS/2 && pos - OSize*widthFactor/2 < PP.x + PS/2 || pos - OSize*widthFactor/2 - vel <= PP.x + PS/2 && pos - OSize*widthFactor/2 - vel >= PP.x - PS/2) {
        if (PP.y + PS/2 <= OSize*heightFactor) {
          return true;
        }
        return false;
      } else {
        return false;
      }
    }
}
