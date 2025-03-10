class Control {

  ArrayList<Ammo> ammo = new ArrayList<Ammo>();
  ArrayList<Enemy> enemies = new ArrayList<Enemy>();

  int ammoInterval = 1000;
  int enemyInterval = 2000;
  int incrementInterval = 10000; 
  int ammoTime;
  int enemyTime;
  int incrementTime;

  float enemySpeed = xF/5;
  float ammoSpeed = yF/2;


  Control() {
    ammoTime = millis();
    enemyTime = millis();
    incrementTime = millis();
  }

  void ammoDrop() {
    if (millis() > ammoTime + ammoInterval) {
      ammo.add(new Ammo(ammoSpeed));
      ammoTime = millis();
    }
  }

  void spawnEnemy() {
    if (millis() > enemyTime + enemyInterval) {
      enemies.add(new Enemy(enemySpeed));
      enemyTime = millis();
    }
  }

  void incrementDifficulty() {
    if (millis() > incrementTime+incrementInterval) {
      //ammo interval
      if (ammoInterval > 500) {
        ammoInterval -= 50;
      }
      //enemy interval
      if (enemyInterval > 1000) {
        enemyInterval -= 200;
      }
      //enemy speed
      if (enemySpeed < 0.4*xF) {
        enemySpeed += xF/50;
      }
      //ammo speed
      //ammoSpeed += yF/20;
      //increment interval
      //println("interval: " + incrementInterval + " enemyInterval: " + enemyInterval + " enemySpeed: " + enemySpeed);
      //println("ammoInterval: " + ammoInterval);
      incrementInterval += 1000;
      //reset increment Time
      incrementTime = millis();
    }
  }

  void clearGame(Player p) {
    for (int i = ammo.size() - 1; i> -1; i--) {
      ammo.remove(i);
    }
    for (int i = enemies.size() - 1; i> -1; i--) {
      enemies.remove(i);
    }
    for (int i = p.bullets.size() - 1; i> -1; i--) {
      p.bullets.remove(i);
    }
    score = 0;
    ammoCount = 0;
    ammoInterval = 1000;
    enemyInterval = 3000;
    incrementInterval = 10000;
    ammoTime = millis();
    enemyTime = millis();
    incrementTime = millis();

    enemySpeed = xF/10;
    ammoSpeed = yF/2;
  }

  void ammoCollisionCheck(Player p) {
    for (int i = ammo.size() - 1; i > -1; i--) {
      Ammo a = ammo.get(i);
      if (a.x > p.x && a.x < p.x+p.w && a.y > height-5*yF && a.y < height - 2*yF) {
        ammo.remove(i);
        ammoCount++;
        mySound.caught.play();
      } else if (a.y > height * yF) {
        ammo.remove(i);
      }
    }
  }

  void bulletCollisionCheck(Player p) {
    for (Bullet b : p.bullets) {
      for (int i = enemies.size() - 1; i > -1; i--) {
        Enemy e = enemies.get(i);
        if (dist(e.x, e.y, b.x, b.y) < (b.w/2 + e.w/2)) {
          score++;
          enemies.remove(i);
          mySound.enemyHit.play();
        }
      }
    }
  }

  void gameOverCheck() {
    for (Enemy e : enemies) {
      if (e.x < 0) {
        myScene = Scene.END;
        mySound.gameMusic.stop();
        if (mySound.endMusic != null)  // hack: null pointer check for crash on cabinet machine
          mySound.endMusic.play();
        if (myHISCORE.checkScore(score)) {
          myHISCORE.newScore = true;
          myHISCORE.findRank(score);
          myHISCORE.shiftScores(myHISCORE.rank);
        }
      }
    }
  }

  void updateControl() {
    for (Ammo a : ammo) {
      a.updateAmmo();
      a.drawAmmo();
    }
    for (Enemy e : enemies) {
      e.updateEnemy();
      e.drawEnemy();
    }
  }

  void masterControl() {
    ammoDrop();
    spawnEnemy();
    incrementDifficulty();
    ammoCollisionCheck(myPlayer);
    bulletCollisionCheck(myPlayer);
    gameOverCheck();
    updateControl();
  }

  void startScene() {
    noStroke();
    ammoDrop();
    spawnEnemy();
    incrementDifficulty();
    updateControl();
  }
}