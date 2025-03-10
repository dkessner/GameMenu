
void playSectionI() {
  
  textSize(25);
  stroke(0);
  strokeWeight(1);
  image(buildingOne,0,0);
  
  scienceDoor.display();
  scienceDoor.open();
  
  trackDoor.display();
  trackDoor.open();
  
  player.display();
  if (player.position.x <= 0)
    player.position.x = 0;
  if (player.position.x >= width) {
     gameState = 10;
     player.position.x = 1;
  }
}
