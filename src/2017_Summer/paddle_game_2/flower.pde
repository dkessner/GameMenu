
void drawFlower ()

{
 fill(164,26,234);
stroke(247,245,247);
strokeWeight(5);
ellipse(drawFlowerX+40,drawFlowerY-55,50,50);


ellipse(drawFlowerX-40,drawFlowerY-55,50,50);


ellipse(drawFlowerX+40,drawFlowerY+35,50,50);


ellipse(drawFlowerX-40,drawFlowerY+35,50,50);



fill(242,5,219);
stroke(247,245,247);
strokeWeight(5);
ellipse(drawFlowerX,drawFlowerY-60,50,90);

ellipse(drawFlowerX,drawFlowerY+40,50,90);

ellipse(drawFlowerX+50,drawFlowerY-10,90,50);

// petal
ellipse(drawFlowerX-50,drawFlowerY-10,90,50);


fill(255,234,0);
ellipse(drawFlowerX,drawFlowerY-10,100,100);

fill(234,190,26);
ellipse(drawFlowerX,drawFlowerY-10,50,50);

//flower

if(drawFlowerX<ballX && ballX<drawFlowerX+150 && drawFlowerY<ballY && ballY<drawFlowerY+150)

//if(dist(drawFlowerX,drawFlowerY,ballX,ballY)>150);
{
  
  score+=2;
  drawFlowerX = (int)random(125,width);
  drawFlowerY = (int)random(0,height-40);
  ballVX=-ballVX;
  ballVY=-ballVY;
  
}
}