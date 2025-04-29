float barWidth = 100;
float barHeight = 20;
PVector barPos = new PVector(200, 200);
PVector barVel = new PVector (0, 0);
PImage mona;
PVector mSize;
PFont font;
ball b;

void setup() {
  //size(1440, 900);
  fullScreen();
  mona = loadImage("mona_lisa.jpeg");
  mSize = new PVector(mona.width*4, mona.height*4);
  b = new ball();
  font = createFont("DoodleGum.ttf", 40);
}

void draw() {
  background(255);
  image(mona, 0, 0, mSize.x, mSize.y);

  b.run();
  fill(255);
  barPos.x += barVel.x;
  barPos.y +=barVel.y;
  if(barPos.x > mSize.x){
    barPos.x = mSize.x;
    barVel.x = 0;
  } else if (barPos.x <0){
    barPos.x = 0;
    barVel.x = 0;
  }
  rect(barPos.x, barPos.y, barWidth, barHeight);

  textFont(font);
  textSize(20);
  fill(0);
  text("Draw a mustache on \n the Mona Lisa!", width - 600, 50);
}
void keyPressed() {
  b.keyPressed();
  if (keyCode == RIGHT) {
    barVel.x = 10;
  } else if (keyCode == LEFT) {
    barVel.x = -10;
  } else if (keyCode == UP) {
    barVel.y = -10;
  } else if (keyCode == DOWN) {
    barVel.y = 10;
  } else if (key == '.') {
    b.mustaches.clear();
    b.pos.y = 0;
    b.pos.x = width/2;
  }
}
void keyReleased() {
  b.keyReleased();
  barVel.x = 0;
  barVel.y = 0;
}
