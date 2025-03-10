class Control {

  ArrayList<Block> blocks = new ArrayList<Block>();

  int blockNumber;

  float blockW = width/10;
  float blockH = height/20;
  float blockX = 0;
  float blockY = blockW;

  boolean stageClear = false;

  Control() {
  }

  void createBlocks(int blockCount) {
    blockX = 0;
    blockY = blockW;
    blockR = 255;
    blockG = 0;
    blockB = 0;
    while (blocks.size() < blockCount) {
      blocks.add(new Block(blockX, blockY, blockW, blockH, color(blockR, blockG, blockB)));
      blockG += 5;
      blockB += 5;
      if (blockX < (width - blockW)) {
        blockX += blockW;
      } else {
        blockX = 0;
        blockY += blockH;
      }
    }
  }

  void removeBlocks(Ball myBall) {
    for (int i = 0; i < blocks.size(); i++) {
      Block block = blocks.get(i);
      myBall.checkBlockCollision(block);
      if (block.hit == true) {
        score += 1;
        blocks.remove(i);
      }
    }
  }

  void removeAllBlocks() {
    for (int i = blocks.size()-1; i > -1; i--) {
      Block block = blocks.get(i);
      blocks.remove(i);
    }
  }


  void drawBlocks() {
    for (int i = 0; i < blocks.size(); i++) {
      Block block = blocks.get(i);
      block.drawBlock();
    }
  }

  void resetCheck(Paddle paddle) {

    if (blocks.size() < 1) {
      startGame.play();
      stageClear = true;
      blockNumber += width/blockW;
      paddle.start = false;
      createBlocks(blockNumber);
    }
  }
}