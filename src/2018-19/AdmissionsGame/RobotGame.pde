//
// RobotGame
//


void robotdraw_game()
{
  background(255);

  float startX = robotStartPos.x;
  float startY = robotStartPos.y + 70;

  float endX = width * .93;
  float endY = height * .05; 

  fill(yellow); 
  rectMode(CENTER);
  rect(startX, startY, blockwidth, blockheight);
  rect(endX, endY, blockwidth, blockheight); 

  fill(purple);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Start", startX, startY); 
  text("End", endX, endY);
  
  robot1.display(); 

  for(Block b : blocks)
  {
    b.display(); 
  }
 
  robot1.winCheck(endX, endY); 
}
