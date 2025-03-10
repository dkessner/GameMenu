



void drawRectangleTarget()
{
  fill(203, 31, 206);
  rectMode(CENTER);
  rect(rectX, rectY, 100, 100);

  if (rectX<ballX && ballX<rectX+75 && rectY<ballY && ballY<rectY+75)
  {
    score+=3;
    rectX = (int)random(0, width);
    rectY = (int)random(0, height-20);
  }

  if (dist(rectX, rectY, ballX, ballY)<75)
  {
    ballVX=-ballVX;
    ballVY=-ballVY;
  }
}


void drawFaceTarget()
{
  noStroke();
  fill(239, 255, 26);
  ellipse(faceX, faceY, 100, 100);

  fill(0);
  ellipse(faceX-15, faceY-20, 20, 30);
  ellipse(faceX+15, faceY-20, 20, 30);
  ellipse(faceX, faceY+25, 40, 20);

  if (dist(ballX, ballY, faceX, faceY)<75)
  {
    ballVX=-ballVX;
    ballVY=-ballVY;
    score+=5;
    faceX = (int)random(0, width);
    faceY = (int)random(0, height-20);
  }

  /* if(faceX<ballX && ballX<faceX+75 && faceY<ballY && ballY<faceY+75)
   {
   score+=5;
   faceX = (int)random(0,width);
   faceY = (int)random(0,height-20); 
   }
   */
}

void drawUnicorn()
{
  imageMode(CENTER);
  image(flying, flyingX, 300);

  if (score>0)
  {
    flyingX=flyingX -2;
  }
  if (dist(flyingY, flyingX, ballY, ballX)<60)
  {
    ballVX=-ballVX;
    ballVY=-ballVY;
    score+=6;
    flyingX= -75;
  }

  if (score % 5 == 0)
  {
    flyingX=width+75;
  }
}






void drawGame ()
{
  background(0);
  fill(255, 255, 255);
  textSize(25);
  text("Score: "+ score, 80, 10);
  noStroke(); 

  drawRectangleTarget();

  // bricks

  for (int i=0; i<30; i++)
  { 
    fill(255, 0, 0);
    rect(i*50, 50, 50, 50);
  }

  // ball

  fill(10, 235, 245);
  ellipse(ballX, ballY, 50, 50);

  // red line

  fill(255, 0, 0);
  rectMode(CORNER);
  //rect(0,580,600,20);
  rect(0, height-20, width, 20);

  // paddle

  fill(0, 255, 0);
  rectMode(CENTER);
  rect(paddleX, paddleY, 110, 25);

  paddleX+=paddleVX;

  if (paddleX<25 || paddleX>width-25)
  {
    paddleVX=-paddleVX;
  }


  // update positions

  ballX+=ballVX;
  ballY+=ballVY; 
  paddleX+=paddleVX;

  if (ballX<25 || ballX>width-25)
  { 
    ballVX = -ballVX;
  }

  if (ballY<125 || ballY>height-20)
  {
    ballVY = -ballVY;
  }

  // paddle collision
  if (ballX>paddleX-100/2 && ballX<paddleX+100/2 && ballY+25>paddleY)  
  {
    ballVY=-ballVY;
    bounce.play();
  }

  if (ballY+25>height) // game over
  {
    gameState=2;
  }

  //vortex
  fill(142, 137, 137);
  stroke(255);
  ellipse(ellipseX, ellipseY, 100, 100);
  if (ellipseX<ballX && ballX<ellipseX+75 && ellipseY<ballY && ballY<ellipseY+75)

    //if(dist(ellipseX,ellipseY,ballX,ballY)<75);
  {
    ballX = (int)random(0, width);
    ballY = (int)random(0, height-125);
    ellipseX = (int)random(0, width);
    ellipseY = (int)random(0, height-125);
  }


  
  if (score>20)
  {
    if (dist(xTreasurechest, yTreasurechest, ballX, ballY)<100)
    {    
      open = true;
      score+=20;
      ballVX=-ballVX;
      ballVY=-ballVY;
    }
    else
    {
      //draw treasurechest11.png
      xTreasurechest=200;
      yTreasurechest=200;
      image(treasurechestI,xTreasurechest,yTreasurechest);
    }
  }
  

  drawTreasurechest();
  
  drawUnicorn();
  drawFaceTarget();
  drawFlower();
}

void drawTreasurechest ()

{
  imageMode(CENTER);
  if (open == true)
  {
    if (treasurechestIndex < treasurechest.length)
      image(treasurechest[treasurechestIndex], xTreasurechest, yTreasurechest);

    if (frameCount%5 == 00)
      treasurechestIndex++;

    if (treasurechestIndex >= treasurechest.length)
    {
      open = false;
      treasurechestIndex = 0;
      yTreasurechest=200;
      xTreasurechest=-400;
    }
  }
}





// drawGame()