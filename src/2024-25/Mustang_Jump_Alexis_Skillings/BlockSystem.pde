class BlockSystem {
  //declare variables
  ArrayList<Block>blocks;
  float x, y, vy, ay;

  //constructor
  BlockSystem() {
    x=random(0, width);
    y= 0;
    blocks = new ArrayList<Block>();
    vy = 0.5;
    ay = 100;
  }
  //each block made gets incremented velocity
  void run() {
    for (int i = blocks.size()-1; i >= 0; i--) {
      Block b = blocks.get(i);
      b.update();
      b.display();
      b.checkCollision(horse);
      //check if one of the blocks is colliding, set to true if not false
      if (b.isDead()) {
        blocks.remove(i);
      }
    }
    if (blocks.size() < 8) {
      Block newBlock = new Block();
      blocks.add(newBlock);
    }
  }
}


      
      
      
 
