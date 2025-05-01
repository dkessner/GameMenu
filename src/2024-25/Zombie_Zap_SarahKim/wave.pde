void wave() {
  background(0);
  if(!bg.isPlaying()){
    bg.rewind();
    bg.play();
  }if(!zombienoise.isPlaying()){
    zombienoise.setGain(-5);
    zombienoise.rewind();
    zombienoise.play();
  }

  //GRASSYARD
  noTint();
  imageMode(CENTER);
  image(grass, width/2.05, height/2);
  grass.resize(int(width/1.52), int(height/1.24));
  
  //erase frame
  fill(0);
  rect(width/2, height/12, width/1.4, height/12);
  rect(width/1.1, height/2, width/4.5, height/1.25);

  //lines
  float z = width/12.5;
  stroke(0);
  strokeWeight(3);

  //lines
  for (int y = 0; y < height; y+=z) {
    line(0, y, width, y);
  } for (int x = 0; x < width; x+=z) {
    line(x, 0, x, height);
  }

  //BARS
  //wave/level
  //power uses

  //BUTTONS
  //shoot
  //unlimited uses

  //freeze
  //3 uses

  //ultimate
  //2 uses

  //ZZ LOGO
  noStroke();
  fill(215);
  circle(width/1.07, height/1.2, 150);
  fill(175);
  circle(width/1.07, height/1.2, 125);

  tint(#C64040);
  blood.resize(int(width/14.4), height/10);
  image(blood, width/1.07, height/1.2);

  textFont(title);
  textSize(35);
  fill(#11340C);
  text("Zombie", width/1.07, height/1.197);
  text("Zap", width/1.07, height/1.148);
  fill(#387C2D);
  text("Zombie", width/1.068, height/1.2);
  text("Zap", width/1.068, height/1.15);
}
