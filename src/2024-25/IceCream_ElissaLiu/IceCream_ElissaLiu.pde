import gifAnimation.*;

//THIS GAME will be a COMBINATION of COOKING FEVER, PAPAS FREEZERIA, AND MY VERY OWN SPECIAL IDEAS
//THIS WILL BE THE: CHERRY ON TOP!
//I import the sound library so that I can incorporate sound into this game
import processing.sound.*;

//Here I will declare all of my variables, sounds, images, etc...
//First, my gameState
String gameState = "START";
//This String will allow for a transition
String next = "NO";
//This int will allow for a count of days
int days = 1;
//This int will count the score
int score;
//This String will be for the text
String name = "CHERRY ON TOP";
String instruction = "RED BUTTON TO START!";
String day = "DAY: " + days + "!";
//These Strings will be for the order
String flavor = "Vanilla";
String scoops = "One";
String toppings = "Cherry";
String order = "Press a blue button to complete order";
String scoree = "Score = " + score;
String gameOver = "GAME OVER!";
String replay = "Press a red button to play again!";
//My sounds
SoundFile intro;
SoundFile music;
//Images
PImage background;
PImage cherry;
PImage gameBackground;
PImage counter;
PImage customer;
//The v after flavor stands for vanilla
PImage flavorv;
PImage cone;
PImage splatter;
PImage flavorc;
PImage splatc;
PImage toppingc;
PImage toppingco;
PImage flavors;
//Variables
float cx, cy, sx, sy;
//Font
PFont title;
//GIF
Gif gif;

//Now I make sure to make my processing into Active Mode

void setup() {
  //Here I set my screen size
  fullScreen();
  score = 0;
  //Then I load all of my images
  background = loadImage("bg.jpg");
  background.resize(width, height);
  cherry = loadImage("cherry.png");
  cherry.resize(width/10, height/8);
  gameBackground = loadImage("gamebg.jpg");
  gameBackground.resize(width, height);
  counter = loadImage("counter.png");
  counter.resize(width+width/5, height/2+height/3);
  customer = loadImage("moana.png");
  customer.resize(width/5, height/4);
  flavorv = loadImage("vanilla.png");
  flavorv.resize(width/9, height/8);
  cone = loadImage("cone.png");
  cone.resize(width/8, height/6);
  splatter = loadImage("splatter.png");
  splatter.resize(width/4, height/5);
  flavorc = loadImage("flavorc.png");
  flavorc.resize(width/9, height/8);
  splatc = loadImage("splatc.png");
  splatc.resize(width/4, height/5);
  toppingc = loadImage("toppingc.png");
  toppingc.resize(width/10, height/8);
  toppingco = loadImage("toppingco.png");
  toppingco.resize(width/8, height/8);
  flavors = loadImage("flavors.png");
  flavors.resize(width/9, height/9);
  //Here I load my gif
  gif = new Gif(this, "sign.gif");
  gif.loop();
  //I set the x and y of my cherry image
  cx = width/3 + width/12;
  cy = 0;
  //I set the x and y of my open sign
  sx = width/2 + width/5.55;
  sy = height/3 + height/13;
  //Here I load my sound
  intro = new SoundFile(this, "icecreamTruck.mp3");
  intro.play();
  music = new SoundFile(this, "gameMusic.mp3");
  //This is the font
  title = loadFont("BMJUAOTF-48.vlw");
  textFont(title);
  //gameState = Start
  gameState = "START";
  //Here I'm setting the scoop y's
  vanillay = 0 - flavorv.height;
  chocolatey = 0 - flavorc.height;
  strawberryy = 0 - flavors.height;
}

void draw() {
  //This is where the gameState will be changed
  if (gameState == "START") {
    drawStart();
  } else if (gameState == "ORDER") {
    drawOrder();
  } else if (gameState == "GAME") {
    drawGame();
  } else if (gameState == "END") {
    drawEnd();
  }
}

void drawStart() {
  //This is where I will code my start screen
  //First, I'll load the background
  imageMode(CORNER);
  image(background, 0, 0);
  imageMode(CENTER);
  image(cherry, cx, cy);
  //Now I'll animate the cherry falling
  if (cy < width/9) {
    cy+=2.5;
  } else if (cy >= width/9) {
    //After the cherry falls, the name of the game will display
    textAlign(CENTER);
    fill(#8B1138);
    textSize(80);
    text(name, width/2, height/3);
    next = "YES";
    //This adds the open sign
    //I draw the sign not onto the screen but do this so that the picture is in a layer above the words
    //imageMode(CENTER);
    //image(sign, sx, sy);
  }
  if (next == "YES") {
    image(gif, sx, sy);
    textSize(45);
    text(instruction, width/2 + width/5, height/2 + height/3);
    next = "NO";
    //This will count the days
    days = 1;
    //Here I'm setting the starting score
    score = 0;
    //This resets the velocity
    vy = 3.5;
  }
}

void keyPressed() {
  //All of these will allow for the transition from the start screen to the end screen
  if (gameState == "START") {
    if (keyCode == ENTER) {
      gameState = "ORDER";
    }
  }
  if (gameState == "ORDER") {
    if (keyCode == ' ') {
      gameState = "GAME";
    } else if (keyCode == '.') {
      gameState = "GAME";
    } else if (keyCode == ',') {
      gameState = "GAME";
    }
  }
  //This allows the player to move the basket
  if (gameState == "GAME") {
    if (keyCode == RIGHT) {
      //The vx variable adds to the x so that it moves
      vx = 6;
    } else if (keyCode == LEFT) {
      vx = -6;
    } else if (key == 'a') {
      vx = -6;
    } else if (key == 'd') {
      vx = 6;
    }
  }
  if (gameState == "END") {
    if (key == '1') {
      gameState = "START";
    } else if (key == '2') {
      gameState = "START";
    } else if (key == '3') {
      gameState = "START";
    }
  }
}

void keyReleased() {
  //keyReleased makes sure that the cone doesn't move forever in the direction of the key that was pressed
  if (gameState == "GAME") {
    if (keyCode == LEFT || keyCode == RIGHT || key == 'a' || key == 'd') {
      vx = 0;
    }
  }
}


void drawOrder() {
  //First, I'll load the background
  imageMode(CORNER);
  image(gameBackground, 0, 0);
  //This displays the number of days
  textSize(20);
  fill(#FFFFFF);
  text("DAY: " + days, width/11, height/11);
  //This displays the score
  text("SCORE: " + score, width/12, height/8);
  //Now I will show a customer
  imageMode(CENTER);
  image(customer, width/2, height/2 + height/10);
  //This displays the countertop
  imageMode(CENTER);
  image(counter, width/2, height/2 + height/2.5);
  //This will display the order
  textAlign(CENTER);
  text("Flavor: " + flavor, width/2, height/2 + height/4);
  text("Scoops: " + scoops, width/2, height/2 + height/3);
  text("Toppings: " + toppings, width/2, height/2 + height/2.5);
  text(order, width/2 + width/5, height/2 + height/10);
  vanillay = 0 - flavorv.height;
  chocolatey = 0 - flavorc.height;
  strawberryy = 0 - flavors.height;
}

void drawGame() {
  imageMode(CORNER);
  image(gameBackground, 0, 0);
  iceCream();
}

void drawEnd() {
  textSize(60);
  textAlign(CENTER);
  text(gameOver, width/2, height/2);
  textSize(30);
  text(replay, width/2, height/2 + height/10);
  vanillay = 0 - flavorv.height;
  chocolatey = 0 - flavorc.height;
  strawberryy = 0 - flavors.height;
}
