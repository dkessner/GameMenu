void draw_game()
{
  background(210, 250, 110); 
  player1.display(); 
  player2.display(); 
  
  for(Block b : blocks)
  {
    b.display(); 
  }
  
  collision(); 
  
  //call livesUpDown
  player1.livesUpDown(player2.getBalls());
  player2.livesUpDown(player1.getBalls()); 
  
  
  //display lives
  fill(255, 0, 0); 
  text(player1.getLives(), 100, 100); 
  
  fill(0, 0, 255); 
  text(player2.getLives(), width - 100, 100); 
  
  if(player1.getLives() < 1)
    state = 3;
    
  if(player2.getLives() < 1)
    state = 4; 
  
  
}

void collision()
{
  if(dist(player1.position.x, player1.position.y, player2.position.x, player2.position.y) < 30)
  {
    player1.velocity.x = 0;
    player1.velocity.y = 0; 
    player1.position.x -= 5;
    player2.velocity.x = 0;
    player2.velocity.y = 0; 
    player2.position.x +=5; 
    
  }
  
  
  
  
} 