int[] sequence = {0, 1}; //sets array for the squares in state 1
int[] player = {};  //sets array for the squares in state 2

int arrayPos; 
float timer;
float interval; 
boolean display;
int state;
int alpha;
int matchedValues;
PFont font;
import processing.sound.*;
SoundFile click;
SoundFile lowTone;
SoundFile highTone;
SoundFile risingTone;

void setup() {
  noCursor();
  fullScreen();
  background(0);
  arrayPos = 0;

  timer = millis();
  interval = 1000;
  display = true;

  state = 1; //change state
  matchedValues = 0;
  alpha = 255; 

  font = loadFont("AppleSDGothicNeo-Heavy-48.vlw");

  click = new SoundFile(this, "click.wav");
  lowTone = new SoundFile(this, "lowTone.wav");
  highTone = new SoundFile(this, "highTone.wav");
  risingTone = new SoundFile (this, "risingTone.wav");
}

void draw() {
  translate(width/2, height/2);
  rotate(PI/4.0);
  //translate(width/5.5, height/25);
  //println("state " + state + " sequence length: " + sequence.length + " player length: " + player.length);
  if (state==0) { //opening screen
  } else if (state == 1) { //display sequence.array (squares)
    displaySequence();
  } else if (state == 2) { //player input
    background(0);
    fill(255, 0, 0);
    rect(-418, 15, 400, 400);
    fill(0, 0, 240);
    rect(18, -415, 400, 400);
    fill(246, 255, 0);
    rect(18, 15, 400, 400);
    fill(0, 255, 0);
    rect(-418, -415, 400, 400);
  } else if (state == 3) { //comparing sequence array to player array 
    println("player: "); 
    println(player);
    println("sequence: ");
    println(sequence);
    for (int i=0; i < sequence.length; i++) {
      if (sequence[i] != player[i]) {
        state = 5;
        println("Game over");
        break;
      } else {
        state = 4;
      }
    }
  } else if ( state == 4) { //reset player array, randomize sequence array, and set state back to 1
    for (int i = 0; i < sequence.length; i++) {
      sequence[i] = int(random(0, 4));
    }
    state = 1;
    arrayPos = 0;
    alpha = 255;

    while (player.length > 0) {
      player = shorten(player);
    }
    sequence = append(sequence, int(random(0, 4)));
    timer = millis();
  } else if (state == 5) {
    background(0);
    fill(255, 0, 0);
    textFont(font, 75);
    textAlign(CENTER);
    rotate(-PI/4);
    text("GAME OVER", 0, 0);
  }
}


void displaySequence() {
  background(0);
  println("arraypos: " + arrayPos + "sequence[arrayPos]: " + sequence[arrayPos]);
  if (state == 1) {
    if (sequence[arrayPos] == 0) {
      fill(255, 0, 0, alpha);
      rect(-418, 15, 400, 400);
      if (alpha > 249) {
        click.play();
      }
    } //RED

    else if (sequence[arrayPos] == 1) {
      fill(0, 0, 240, alpha);
      rect(18, -415, 400, 400);
      if (alpha > 250) {
        lowTone.play();
      }
    } //BLUE

    else if (sequence[arrayPos] == 2) {
      fill(246, 255, 0, alpha);
      rect(18, 15, 400, 400);
      if (alpha > 250) {
        highTone.play();
      }
    } //YELLOW

    else if (sequence[arrayPos] == 3) {
      fill(0, 255, 0, alpha);
      rect(-418, -415, 400, 400);
      if (alpha > 250) {
        risingTone.play();
      }
    }
    //GREEN

    if (millis() > timer + interval) {
      timer = millis();
      alpha = 255;
      if (arrayPos < sequence.length-1) {
        arrayPos++;
      } else {
        state = 2;
      }
    }
    alpha = alpha - 3;
  }
}

/*
void mousePressed () {
 if (state == 2) {
 state = 1;
 arrayPos = 0;
 alpha = 0;
 timer = millis();
 } else if (state == 2) {
 for (int i = 0; i < sequence.length; i++) {
 sequence[i] = int(random(0, 4));
 }
 state = 1;
 arrayPos = 0;
 timer = millis();
 sequence = append(sequence, int(random(0, 4)));
 }
 }
 */

void keyReleased() { // state 4 THEN reset 
  if (state == 2 && player.length < sequence.length) {
    if (keyCode == LEFT) {
      player = append(player, 0);
      //red 0
    } 
    if (keyCode == RIGHT) {
      player = append(player, 1);
      //blue 1
    } 
    if (keyCode == DOWN) {
      player = append(player, 2);
      //yellow 2
    } 
    if (keyCode == UP) {
      player = append(player, 3);
      //green 3
    }
  }
  if (state == 2 && sequence.length == player.length) {
    state = 3;
  }
} 