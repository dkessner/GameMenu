
void playEnglish() {
    stroke(0);
    strokeWeight(1);
    background(180,160,20);
    player.display();
    
    escButton.display();
    
    text("Move to the right to complete the minigame!", 100, 200);
    
    if (player.position.x >= width-200 && player.position.x <= width) {
      gameState = 10;
      player.position.x = 500;
      playBells();
    }
}
