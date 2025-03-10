class Control {

  ArrayList<Missile> missiles = new ArrayList<Missile>();
  City [] cities;
  int round = 0;

  int missilesLaunched = 0;
  int missileCount = 10;
  int currentTime;
  int startTime;
  float missileSpeed = 0.05*xF;
  float interval = 2000;
  float roundInterval = 2000;
  float citySpacing = width/9;
  float [] cityPositions = {citySpacing*1.2, citySpacing*2.2, citySpacing*3.2, citySpacing*5.2, citySpacing*6.2, citySpacing*7.2};


  Control() {
    startTime = millis();
    cities = new City[6];
    createCities();
  }

  void createCities() {
    for (int i = 0; i < 6; i++) {
      cities[i] = new City(cityPositions[i], height-8*yF);
    }
  }

  void drawCities() {
    for (City c : cities) {
      if (c.destroyed==false) {
        c.drawCity();
      }
    }
  }

  void checkAirborneCollisions(Cursor c) {
    for (Rocket r : c.rockets) {
      for (int i = missiles.size()-1; i > -1; i--) {
        Missile m = missiles.get(i);
        if (r.collision(m)) {
          c.score += 10+round;
          missiles.remove(i);
        }
      }
    }
  }

  void checkGroundCollisions(Cursor cursor) {
    //collision with cities
    for (City c : cities) {
      for (int i = missiles.size()-1; i > -1; i--) {
        Missile m = missiles.get(i);
        if (m.x>c.x && m.x<c.x+5.5*xF&&m.y>height-4.4*yF&&m.y<height-3.6*yF&&c.destroyed == false) {
          mySound.explosion.play();
          c.destroyed = true;
          bgColor = 255;
          missiles.remove(i);
        }
      }
    }
    //collision with base
    for (int i = missiles.size()-1; i> - 1; i--) {
      Missile m = missiles.get(i);
      if (m.x > cursor.leftBase.x && m.x < cursor.leftBase.x+6*xF && m.y>height-4.4*yF&&m.y<height-3.6*yF&&cursor.leftBase.destroyed == false) {
        bgColor = 255;
        mySound.explosion.play();
        cursor.leftBase.destroyed = true;
        cursor.leftRockets = 0;
        missiles.remove(i);
      } else if (m.x > cursor.rightBase.x && m.x < cursor.rightBase.x+6*xF && m.y>height-4.4*yF&&m.y<height-3.6*yF&&cursor.rightBase.destroyed == false) {
        bgColor = 255;
        mySound.explosion.play();
        cursor.rightBase.destroyed = true;
        cursor.rightRockets = 0;
        missiles.remove(i);
      } else if (m.x > cursor.centerBase.x && m.x < cursor.centerBase.x+6*xF && m.y>height-4.4*yF&&m.y<height-3.6*yF&&cursor.centerBase.destroyed == false) {
        bgColor = 255;
        mySound.explosion.play();
        cursor.centerBase.destroyed = true;
        cursor.centerRockets = 0;
        missiles.remove(i);
      }
    }
    //collision with ground
    for (int i = missiles.size()-1; i> - 1; i--) {
      Missile m = missiles.get(i);
      if (m.y > height-3*yF) {
        mySound.dud.play();
        missiles.remove(i);
      }
    }
  }

  void missileAttack() {
    println(missileSpeed);
    currentTime = millis() - startTime;
    if (currentTime > interval && missilesLaunched < missileCount) {
      float num = random(1);
      if (round >4 && num > 0.9) {
        missiles.add(new Missile(missileSpeed, Type.SMARTBOMB, new PVector(random(300, 700), -10), new PVector(random(0, width), height-3.5*yF)));
      } else if (round>2 && num < 0.2) {

        PVector splitterStart = new PVector(random(0, width), -10);
        PVector splitterTarget = new PVector(random(0, width), height-3.5*yF);
        missiles.add(new Missile(missileSpeed, Type.MISSILE, splitterStart, splitterTarget));
        missiles.add(new Missile(missileSpeed, Type.SPLITTER, splitterStart, splitterTarget));
        missilesLaunched++;
      } else {
        missiles.add(new Missile(missileSpeed, Type.MISSILE, new PVector(random(0, width), -10), new PVector(random(0, width), height-3.5*yF)));
      }
      missilesLaunched++;
      startTime = millis();
      interval = random(500, roundInterval);
    }  
    //println("missilesLaunched: " + missilesLaunched + "  missiles.size: " + missiles.size());
    for (Missile m : missiles) {
      m.updateMissile();
      m.drawMissile();
    }
  }

  void removeAllMissiles() {
    for (int i = missiles.size()-1; i > -1; i--) {
      missiles.remove(i);
    }
  }

  void resetControlVariables() {
    round = 0;
    missilesLaunched = 0;
    missileCount = 10;
    missileSpeed = 0.05*xF;
    startTime = millis();
    interval = 2000;
    createCities();
  }

  void resetRound(Cursor c) {
    round++;
    missilesLaunched = 0;
    missileCount = 10+round*2;
    missileSpeed = (0.05*xF)+(round*(0.01*xF));
    startTime = millis();
    interval = 2000;
    roundInterval = 2000-round*40;
    c.leftBase.destroyed = false;
    c.rightBase.destroyed = false;
    c.centerBase.destroyed = false;


    c.leftRockets = 10;
    c.centerRockets = 10;
    c.rightRockets = 10;

    c.xSpeed = 0;
    c.ySpeed = 0;

    c.left = false;
    c.center = false;
    c.right = false;
  }

  boolean roundEnd() {
    //check missiles
    if (missileCount <= missilesLaunched && missiles.size() < 1) {
      return true;
    } else {
      return false;
    }
  }

  boolean citiesRemain() {
    //check cities
    for (City c : cities) {
      if ( c.destroyed == false) {
        return true;
      }
    }
    return false;
  }
}