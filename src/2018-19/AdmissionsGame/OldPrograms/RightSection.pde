
void playSectionIII() {
  
  int playerGate = int(player.r/2);
  
  textSize(25);
  stroke(0);
  strokeWeight(1);

  if (buildingThree.width != width)
      resizeImages();

  image(buildingThree,0,0);

  galleryDoor.display();
  galleryDoor.open();
  ceiDoor.display();
  ceiDoor.open();
  player.display();

  if (player.position.x >= ((width*gateScale)-playerGate))
    player.position.x = ((width*gateScale)-playerGate);
  if (player.position.x <= 0) {
    gameState = 10;
    player.position.x = width-1;
  }
  
}
