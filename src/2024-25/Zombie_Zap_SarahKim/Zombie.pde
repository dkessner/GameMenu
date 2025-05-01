class Zombie {
  PImage zombie;
  float x, y, f;
  float inc;
  int framesPassed;
  int lastUpdate = 0;

  Zombie(float incIn, float yIn, float fIn) {
    zombie = loadImage("zombie.png");
    zombie.resize(int(width/20.57), int(height/8.18));
    inc = incIn;
    x = width/1.1;
    y = yIn;
    f = fIn;
    framesPassed = 0;
  }

void display() {
    noTint();
    image(zombie, x, y);
  }

  void update() {
    if (framesPassed % f == 0) {
      x -= inc;
    }
    framesPassed++;
    if(x <= width/9){
      gameState = "DEFEAT";
    }
  }

  //normal zombie, fast zombie, slow zombie (1 bullet)
  //armored zombie (2 bullets)
  //big zombie, slow (3 bullets)
  //boss zombie, kinda slow (5 bullets)


  //IF RADIUS OF BULLET DISTANCE IS 0 FROM RADIUS OF IMAGE, REMOVE IMAGE
}
