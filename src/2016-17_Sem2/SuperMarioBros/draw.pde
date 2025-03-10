
void drawGame() {

  x += xVel;
  y += yVel;
  yVel += yAcceleration;

  y = constrain(y, 0, (height-(height/14.54)) - 31);

  background(11, 147, 209);

  fill(255);
  textFont(myFont, height/8);
  textAlign(CENTER);
  text("Super Mario Bros.", width/2, height/3.69); //TEXT

  for (Goomba b : goombas) {
    b.display();
  }

  /* for (Koopa d : koopas) {
   d.display();
   }*/

  noStroke();
  fill(255);
  noFill();
  ellipse(x, y, bR, bR); //change back to white when doing koopas
  imageMode(CENTER);
  image(mario, x, y); //mario , add squareLevel to y

  stroke(0);
   strokeWeight(2.5);
   fill(209, 120, 11);
   rect(-55+9, height - height/14.54, 55, 55);

  if (x > 903) {
    movingGround.xF -= movingGround.xFVel;
    movingGround1.xF -= movingGround1.xFVel;
    movingGround2.xF -= movingGround2.xFVel;
    movingGround3.xF -= movingGround3.xFVel;
    movingGround4.xF -= movingGround4.xFVel;
    movingGround5.xF -= movingGround5.xFVel;
    movingGround6.xF -= movingGround6.xFVel;

    x = 903;
    for (Goomba b : goombas) {
      b.a -= movingGround.xFVel;
    }
  }
  movingGround.displayGround();
  movingGround1.displayGround();
  movingGround2.displayGround();
  movingGround3.displayGround();
  movingGround4.displayGround();
  movingGround5.displayGround();
  movingGround6.displayGround();
}


void draw() {
  if (state == 0) {
    background(0);
    fill(255);
    textFont(myFont, height/8);
    textAlign(CENTER);
    text("Click to Play", width/2, height/2);
  } else if (state == 1) {
    drawGame();
  } else if (state == 3) {
    background(0);
    fill(255, 0, 0);
    textFont(myFont, height/8);
    textAlign(CENTER);
    text("Game Over", width/2, height/2);
  } 
  // ellipses in x y bR bR OR a b gR gR
  else if (state == 4) {
    state = 0;
  }

  for (Goomba g : goombas) {
    println(" x: " + x + " y: " + y + " g.a: " + g.a + " g.b: " +g.b);
    if (dist(x, y, g.a, g.b) < bR/2 + gR/2) {
      println("collision");
      state = 3;
    }
  }

  for (Ground z : grounds) {
    if (x > z.xF && x < z.squares*55+z.xF && y+36 > height-z.yF*z.squareLevel && yVel > 0 ) {
      y = height-z.yF*z.squareLevel - 30;
      yVel = 0;
      println("ground collision " +  y);
    }
  }
}