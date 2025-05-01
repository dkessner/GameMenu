//IDEA: zombie shooting game, PVZ layout, pixelated

//VARIABLES
String gameState = "START";
int curTime = 0;
int waveNum = 1;
int frame = 60;
float inc;
int ms; // time between each new zombie
int lastUpdate;
//Images
PImage grass, blood, man, drip, zombie, explosion;
//Fonts
PFont title, text;
//Sounds
import processing.sound.*;
import ddf.minim.*;
Minim minim;
AudioPlayer bg, zombienoise;
SoundFile intro, defeat, shot, charmove, zomdeath;

int zombiesDead;

float[] hnumb;
float randomNum;

ArrayList<Zombie> zoom;
Man manny;

void setup() {
  fullScreen();

  hnumb = new float[]{height/5.25, height/3.1, height/2.23, height/1.73, height/1.42, height/1.2};
  randomNum = hnumb[int(random(hnumb.length))];
  zoom = new ArrayList<Zombie>();
  zoom.add(new Zombie(width/12.5, randomNum, 60));

  manny = new Man(width/9, height/5.5);

  background(255);
  ms = 2000;
  lastUpdate = 0;
  zombiesDead = 0;
  title = createFont("title.otf", 175);
  text = createFont("text.ttf", 100);
  //IMAGES & SOUNDS
  blood = loadImage("blood.png");
  blood.resize(int(width/7.2), height/5);
  drip = loadImage("blooddrip.png");
  grass = loadImage("grass.jpg");
  man = loadImage("man.png");
  zombie = loadImage("zombie.png");
  explosion = loadImage("explosion.png");
  intro = new SoundFile(this, "intro.mp3");
  defeat = new SoundFile(this, "defeat.mp3");
  shot = new SoundFile(this, "shot.mp3");
  charmove = new SoundFile(this, "move.mp3");
  zomdeath = new SoundFile(this, "zomdeath.mp3");

  minim = new Minim(this);
  bg = minim.loadFile("bg.mp3");
  zombienoise = minim.loadFile("zombie.mp3");
}

void draw() {
  if (gameState == "START") {
    defeat.stop();
    drawStart();
  } else if (gameState == "WAVE") {
    if (millis() > lastUpdate + ms) {
      randomNum = hnumb[int(random(hnumb.length))];
      zoom.add(new Zombie(width/12.5, randomNum, frame));
      lastUpdate = millis();
    }
    intro.stop();
    base();
    manny.display();
    manny.update();

    //hi mr. witman. jazzy helped me out with this part and explained it to me
    ArrayList<Zombie> temp = new ArrayList<>();
    temp.addAll(zoom);

    for (Zombie z : zoom) {
      z.display();
      if (zombiesDead >= waveNum * 4 + 4) {
        gameState = "WIN";
        waveNum++;
        curTime = millis();
        zombiesDead = 0;
        frame -= 10;
        ms -= 350;
      }

      if (manny.bulletCollide(z)) {
        temp.remove(z);
        zombiesDead++;
      }

      if (manny.bulletCollide(z)) {
        if (!zomdeath.isPlaying()) {
          zomdeath.play();
        }
      }
      z.update();
    }
    zoom = temp;
  } else if (gameState == "DEFEAT") {
    bg.pause();
    zombienoise.pause();
    drawDefeat();
  } else if (gameState == "WIN") {
    bg.pause();
    zombienoise.pause();
    if (millis() - curTime >= 1500) {
      base();
      wave();
      gameState = "WAVE";
    } else {
      drawNext();
    }if(waveNum >= 6){
      gameState = "END";
    }if(gameState == "END"){
      drawEnd();
    }
  }
}

void drawNext() {
  background(0);
  textFont(title);
  textSize(100);
  text("WAVE " + waveNum, width/2, height/2);
}

void drawStart() {
  if (!intro.isPlaying()) {
    intro.play();
  }
  background(0);
  //BLOOD
  tint(#901717);
  image(blood, width/7.5, height/6);
  image(blood, width/1.3, height/12);
  tint(#FFB9B9);
  image(drip, width/3.5, height/4.5);
  image(drip, width/1.6, height/4.5);
  //BIG CHARACTERS
  noTint();
  zombie.resize(int(width/5.76), int(height/2.25));
  image(zombie, width/1.6, height/2);
  tint(#D69034, 200);
  explosion.resize(int(width/9.6), height/6);
  image(explosion, width/3, height/1.55);
  noTint();
  man.resize(int(width/3.84), int(height/2.4));
  image(man, width/7, height/2);
  noStroke();
  fill(200);
  circle(width/2.1, height/1.38, 30);
  //TITLE
  textFont(title);
  textAlign(CENTER);
  fill(#11340C);
  text("Zombie Zap", width/2.02, height/3.9);
  fill(#387C2D);
  text("Zombie Zap", width/2, height/4);
  //BUTTONS
  //Start
  fill(100);
  rectMode(CENTER);
  rect(width/2, height/1.135, width/5.5, height/9);
  textFont(text);
  textSize(60);
  fill(0);
  text("PLAY", width/2.015, height/1.092);
  fill(255);
  text("PLAY", width/2, height/1.1);
  textSize(20);
  text("Press ANY KEY to play!", width/2, height/1.02);
}

void drawEnd(){
background(0);
  if (!defeat.isPlaying()) {
    defeat.play();
  }
  background(0);
  //BLOOD
  tint(#901717);
  blood.resize(int(width/4.8), height/3);
  image(blood, width/7.5, height/3);
  image(blood, width/1.3, height/4);
  tint(#FFB9B9);
  image(drip, width/3, height/2.2);
  image(drip, width/1.5, height/2.2);
  //BIG CHARACTERS
  noTint();
  zombie.resize(int(width/7.2), int(height/2.77));
  image(zombie, width/2.1, height/1.5);
  //TITLE
  textFont(title);
  textAlign(CENTER);
  fill(#11340C);
  text("YOU WIN!", width/2.02, height/2.9);
  fill(#387C2D);
  text("YOU WIN!", width/2, height/3);
  //reg text
  textFont(text);
  fill(255);
  textSize(25);
  text("Press ANY KEY to return to Main Menu!", width/2, height/1.1);
}

void drawDefeat() {
  background(0);
  if (!defeat.isPlaying()) {
    defeat.play();
  }
  background(0);
  //BLOOD
  tint(#901717);
  blood.resize(int(width/4.8), height/3);
  image(blood, width/7.5, height/3);
  image(blood, width/1.3, height/4);
  tint(#FFB9B9);
  image(drip, width/3, height/2.2);
  image(drip, width/1.5, height/2.2);
  //BIG CHARACTERS
  noTint();
  zombie.resize(int(width/7.2), int(height/2.77));
  image(zombie, width/2.1, height/1.5);
  //TITLE
  textFont(title);
  textAlign(CENTER);
  fill(#11340C);
  text("You died!", width/2.02, height/2.9);
  fill(#387C2D);
  text("You died!", width/2, height/3);
  //reg text
  textFont(text);
  fill(255);
  textSize(25);
  text("Press ANY KEY to return to Main Menu!", width/2, height/1.1);
  textSize (50);
  text("Better luck next time.", width/2, height/2.2);
}
