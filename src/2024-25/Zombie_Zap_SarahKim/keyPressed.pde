void keyPressed() {
  if(gameState == "START"){
    if (keyPressed) {
      gameState = "WAVE";
    } else if (gameState == "END") {
      if (keyPressed) {
        gameState = "START";
      }
    }
  } else if (gameState == "WAVE") {
    manny.mankeyPressed();
    if (keyCode == ESC) {
      gameState = "START";
    }
  }
  if (keyCode == UP || keyCode == DOWN) {
    if (!charmove.isPlaying()) {
      charmove.play();
    }
  }
  if (key == ' ') {
    if (!shot.isPlaying()) {
      shot.play();
    }//MEGA SHOT TO KILL ALL??
  }
  if(gameState == "DEFEAT"){
    if(keyPressed){
      gameState = "START";
      zombiesDead = 0;
      //zoom.x = width/1.1;
    }
  }
}
