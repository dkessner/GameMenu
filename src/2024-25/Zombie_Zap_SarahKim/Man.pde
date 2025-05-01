class Man {
  PImage man;
  float x, h, hc;
  ArrayList<Bullet> bullet;

  Man(float xIn, float hIn) {
    man = loadImage("man.png");
    noTint();
    man.resize(int(width/14.4), height/9);
    hc = height/7.75;
    x = xIn;
    h = hIn;
    bullet = new ArrayList<Bullet>();
  }

  void mankeyPressed() {
    if (keyCode == UP) {
      //set condition around increment to limit 
      h -= hc;
    } else if (keyCode == DOWN) {
      h += hc;
    }
    if (key == ' ') {
      bullet.add(new Bullet(x, h));
    }
  }

  boolean bulletCollide(Zombie zomboo) {
    
    for (Bullet b: bullet) {
      if (b.x+b.r > zomboo.x && b.x-b.r < zomboo.x + zomboo.zombie.width && b.y-b.r < zomboo.y + zomboo.zombie.height && b.y+b.r > zomboo.y) {
        bullet.remove(b);
        return true;
      }
    }
    return false;
  }

  void update() {
    for (Bullet b : bullet) {
      b.update();
    }
  }

  void display() {
    noTint();
    image(man, x, h);
    //for each b of type bullet in the bullet array list
    for (Bullet b : bullet) {
      b.display();
    }
  }
}
