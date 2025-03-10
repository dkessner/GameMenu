
class Ground {
  float xF, yF;  
  int squares;
  int squareLevel;
  float xFVel;

  Ground(float tempxF, int tempsquareLevel, int tempsquares) {
    xF = tempxF;
    yF = height/14.54;
    squares = tempsquares;
    squareLevel = tempsquareLevel;
    xFVel = 6;
  }
  
  void displayGround() {
    for (int i = 0; i < squares; i++) {
      stroke(0);
      strokeWeight(2.5);
      fill(209, 120, 11);

      rect(xF+i*55, height - yF*squareLevel, 55, 55); // moving the ground
    }
  }
}