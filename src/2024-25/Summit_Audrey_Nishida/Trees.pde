
class Tree {
  PImage tree;
  float x, y, vx;
  
  Tree(float xIn, float yIn, float vxIn, PImage treeIn) {
    x = xIn;
    y = yIn;
    vx = vxIn;
    tree = treeIn;
  }
  
  void update() {
    y += vx;
  }
  
  void display() {
    //draw tree
    imageMode(CENTER);
    image(tree, x, y);
  }
}
