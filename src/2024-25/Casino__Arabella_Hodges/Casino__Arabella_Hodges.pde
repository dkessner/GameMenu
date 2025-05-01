import processing.sound.*;
int gameState = 1; //start screen
// Images & gifs
PImage[] gif;
PImage[] gif2;
PImage introBackground;
PImage gameBackground;
PImage alleyBackground;
PImage casinoBackground;
PImage gold;
// Sounds effects & background music
SoundFile introMusic;
SoundFile gameMusic;
SoundFile wheelSpin;
// Fonts
PFont font;
// Other variables
int f; //the page number
int f2;
int frames;
int frames2;
int minBet = 10; //the minimum bet for each level //<>//
int playerBet = minBet; //the bet the player inputs into the game
int tokens = 50;
int firstNumber;
int secondNumber;
int thirdNumber;
int currentTime;
boolean randomize = false;
int interval = 100;
String [] scoreList = new String[3]; //contains the top three scores
String highScore ;
int countFrame = 0;

String filename_high_scores = System.getProperty("user.home") + "/VideoGameCabinetData/HighScore_Casino.txt";

void setup() {
  fullScreen();
  background(105, 20, 33);
  //size(400, 400);
  introMusic = new SoundFile(this, "CasinoNightZone8-Bit.mp3");
  introMusic.amp(0.8);
  introMusic.play();
  gameMusic = new SoundFile(this, "gameMusic.mp3");
  
  print(width+"  ");
  print(height);
  scoreList = loadStrings(filename_high_scores);
  //println("ScoreList:" + scoreList[0]);

  font = loadFont("newVideoGameFont.vlw");
  textFont(font);

  frames = 2;
  gif = new PImage [frames]; //number of images go in the square brackets
  introBackground = loadImage("introBackground.png");
  gameBackground = loadImage("gameBackground.png");
  alleyBackground = loadImage("alleyBackground.png");
  casinoBackground = loadImage("casinoBackground.png");
  gold = loadImage("goldPlate.png");
  

  frames2 = 15;
  gif2 = new PImage [frames2];

  int i = 0;
  while (i < frames) {
    gif[i] = loadImage("casinoFrame_"+i+".png");
    i++;
  }

  int i2 = 0;
  while (i2 < frames2) {
    gif2[i2] = loadImage(i2+".png");
    i2 = i2+1;
  }
}

void drawStart() {
  image(introBackground, width/2, height/2, width, height);


  textAlign(CENTER);
  textSize(width/40);
  fill(#FFF6E8);
  text("PRESS LEFT BUTTON TO START", width/2, height/1.7);

  imageMode(CENTER);
  image(gif[f], width/2, height/4.21, width/2.2, height/2);
  //println(frameCount);
  text("HIGH SCORES:", width/2, height/1.45);
  text(scoreList[0], width/2, height/1.31);
  text(scoreList[1], width/2, height/1.2);
  text(scoreList[2], width/2, height/1.1);

  //modulus
  //if the remainder of the frame count divided by two equals zero, go to the next frame
  if (frameCount % 6 == 0) {
    f = f + 1;
  }

  if (f == frames) {
    f = 0; //loop
  }
}


void drawGame() {
  background(105, 20, 33);
  image(gameBackground, width/2, height/2, width, height*1.01);
  image(gold, width/1.45, height/1.6, width/2, height/2);
  image(gold, width/1.45, height/2.5, width/2, height/2);
  introMusic.stop();
  //gameMusic.play();
  
  if (countFrame > 15 * 2) {
    image(gif2[0], width/4.4, height/2.1, width/2, height);
  } else {
    machine();
  }

  textAlign(CENTER);
  textSize(width/40);
  fill(163, 36, 38);
  
  text("MINIMUM BET: "+minBet, width/1.45, height/2.32);
  text("YOUR BET: "+playerBet, width/1.45, height/1.6);
  text("YOUR TOKENS: "+tokens, width/1.45, height/1.46);

  if (randomize) {
    slots();
  }
  //Slots
  text(firstNumber, width/5.5, height/2.2);
  text(secondNumber, width/4.35, height/2.2);
  text(thirdNumber, width/3.6, height/2.2);

  if (tokens == 0) {
    gameState = 3;
}
}

void drawEnd() {
  if (tokens > 0) {
    image(casinoBackground, width/2, height/2, width, height);
    fill(#FFF6E8);
    text("YOU CASHED OUT "+tokens+" TOKENS!", width/2, height/1.8);
  } else {
    image(alleyBackground, width/2, height/2, width, height);
    fill(#FFF6E8);
    text("YOU LOST ALL OF YOUR MONEY", width/2, height/2.1);
    text("AND GOT THROWN OUT OF THE CASINO", width/2, height/1.9);
  }
  
  
  
}

void keyPressed() {
  if (gameState == 1) {
    if (key == ' ') {
      gameState = 2;
      gameMusic.amp(0.8);
      gameMusic.play();
    }
  }

  if (gameState == 2) {
    if (key == 'w' && playerBet < tokens) {
      playerBet += 5;
    }
    
    if (key == 's' && playerBet > minBet) {
      playerBet -= 5;
    }
  }

  if (gameState == 2) {
    if (keyCode == ENTER) { //updates the score list
      if (tokens >  int (scoreList[0])) {
        print("newhighscore");
        print(tokens);
        scoreList[2] = scoreList[1];
        scoreList[1] = scoreList[0];
        scoreList[0] = str(tokens);
      } else if (tokens > int (scoreList[1])) {
        scoreList[2] = scoreList[1];
        scoreList[1] = str(tokens);
      } else if (tokens > int (scoreList[2])) {
        scoreList[2] = str(tokens);
      }
      saveStrings(filename_high_scores, scoreList); //saves the scores in a text file
      println("scoreSaved");
      gameState = 3;
  }
  }



  //Start the turning of the slots (run a certain gif)
  //After a certain amount of time, the explosion gif plays
  //Certain results of the randomization equal a certain image
  //Whichever result gets chosen, the certain image shows
  //loop it

  if (gameState == 2) {
    if (keyCode == DOWN) {
      wheelSpin = new SoundFile(this, "wheelSpin.mp3");
      wheelSpin.amp(1.5);
      wheelSpin.play();
      countFrame = 0;
      f2 = 0;
      currentTime= millis();
      randomize = true;
      interval = 100;
    }
  }
}

void machine() {
  imageMode(CENTER); //second GIF
  image(gif2[f2], width/4.4, height/2.1, width/2, height);
  countFrame++;

  if (frameCount % 2 == 0) {
    f2 = f2 + 1;
  }

  if (f2 == frames2) {
    f2 = 0;
  }
}



void slots() {
  if (millis()<currentTime+4100) {
    //println(millis() + "   " +  currentTime+2000);
    if ( millis() > currentTime +interval) {
      //println("RANDOMIZE");
      //if (time % 20 == 0) {
      firstNumber = int (random(1, 4));
      secondNumber = int (random(1, 4));
      thirdNumber = int (random(1, 4));
      //}
      text(firstNumber, width/5.5, height/2.2);
      text(secondNumber, width/4.35, height/2.2);
      text(thirdNumber, width/3.6, height/2.2);
      interval +=50;
    }
  } else {
    randomize = false;

    firstNumber = int (random(1, 4));
    secondNumber = int (random(1, 4));
    thirdNumber = int (random(1, 4));

    if (firstNumber == secondNumber && firstNumber == thirdNumber) {
      tokens = tokens + playerBet * 2;
    } else if (firstNumber == secondNumber || secondNumber == thirdNumber || firstNumber == thirdNumber) {
      tokens = tokens + 10;
    } else {
      tokens = tokens - playerBet;
    }
    if (playerBet > tokens) {
      playerBet = tokens;
    }
    
  }
}





void draw() {
  //println(gameState);
  if (gameState == 1) {
    drawStart();
  } else if (gameState == 2) {
    drawGame();
  } else if (gameState == 3) {
    drawEnd();
  }
}
