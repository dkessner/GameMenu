import processing.sound.*;
import processing.video.*;

String filename_high_scores = "";

int gameState;
Coordinator c;
PFont font;
String[] scores;
int[] ss;
String[] names;
int score;
String name;
int selected;
int[] letters = {0,0,0};
char[] alphabet = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
int spaceCooldown = 10;

SoundFile jump;
SoundFile click;
SoundFile death;
SoundFile flip;
SoundFile music;

Movie one;

void setup() {

  filename_high_scores = System.getProperty("user.home") + "/VideoGameCabinetData/HighScore_eloise_flipside.txt";

  name = "aaa";
  score = 0;
  selected = -1;
  
  one = new Movie(this, "1.mp4");
  one.loop();
  one.play();
  
  jump = new SoundFile(this, "jump.wav");
  click = new SoundFile(this, "click.wav");
  death = new SoundFile(this, "death.wav");
  flip = new SoundFile(this, "flip.wav");
  music = new SoundFile(this, "music.wav");
  
  background(255);
  fullScreen();
  gameState = 0;
  c = new Coordinator();
  noStroke();
  font = createFont("font.ttf", height/20);
  textFont(font);
  
  scores = new String[11];
  ss = new int[11];
  names = new String[11];
  
  scores = loadStrings(filename_high_scores);
  
  for(int i = 0; i < 11; i++){
    String[] temp = new String[2];
    temp = scores[i].split(" ");
    ss[i] = parseInt(temp[1]);
    names[i] = temp[0];
  }
}

void draw() {
  spaceCooldown--;
  
  background(10, 0, 25);
  if (gameState == 0) {
    cursor();
    fill(255);
    textAlign(CENTER);
    text("flip SIDE", width/2, height/2);
    if(selected == 0){
      fill(255);
    }else{
      fill(150);
    }
    text("PLAY", width/3, height*3/4);
    if(selected == 1){
      fill(255);
    }else{
      fill(150);
    }
    text("TUTORIAL", width*2/3, height*3/4);
  } else if (gameState == 1) {
    music.amp(.5);
    noCursor();
    c.display();
    if (c.checkCollisions() == true){
      music.amp(0);
      death.play(1, 0.5);
      if(int(c.gameTime/20.0)>ss[10]){
        music.pause();
        gameState = 3;
        
        selected = 0;
        ss[10] = int(c.gameTime/20.0);
        reorder();
        
        
        
        score = int(c.gameTime/20.0);
      }else{
        gameState += 1;
      }
    }
    
    textAlign(LEFT);
    text("SCORE: " + int(c.gameTime/20.0), 50, 50);

  } else if (gameState == 2) {
    cursor();
    fill(255);
    textAlign(CENTER);
    text("you died", width/2, height/2);
    
    if(selected == 0){
      fill(255);
    }else{
      fill(150);
    }
    text("HOME", width/4, height*3/4);
    if(selected == 1){
      fill(255);
    }else{
      fill(150);
    }
    text("LEADERBOARD", width*5/7, height*3/4);
  } else if(gameState == 3){
    cursor();
    textAlign(CENTER);
    
    textSize(height/30);
    
    text("YOU MADE IT ONTO THE LEADERBOARD!", width/2, height/4);
    text("PLEASE TYPE YOUR INITIALS BELOW:", width/2, height/3);
    
    textSize(height/20);
    
    if(selected == 0){
      fill(255);
    }else{
      fill(150);
    }
    text(alphabet[letters[0]], width/2 - height/20, height/2);
    if(selected == 1){
      fill(255);
    }else{
      fill(150);
    }
    text(alphabet[letters[1]], width/2, height/2);
    if(selected == 2){
      fill(255);
    }else{
      fill(150);
    }
    text(alphabet[letters[2]], width/2 + height/20, height/2);
    
    fill(255);
    
    //text("USE THE ARROW KEYS", width/2, height*3/4);
    
    textSize(height/20);
  } else if(gameState == 5){
    textAlign(CENTER);
    text("HIGHSCORES", width/2, height/10);
    text("NAME:", width/4, 2*height/10);
    text("SCORE:", width*3/4, 2*height/10);
    for(int i = 1; i < 11; i++){
      text(i + ": " + scores[i].split(" ")[0], width/4, 2*height/10 + i*height/15);
      text(scores[i].split(" ")[1], width*3/4, 2*height/10 + i*height/15);
    }
  }else if(gameState == 7){
    runTutorial();
  }
}

void keyPressed() {
  if(spaceCooldown < 0){
    spaceCooldown = 5;
    //home screen
    if(gameState == 0){   
      if(keyCode == LEFT){
        selected = 0;
      }else if(keyCode == RIGHT){
        selected = 1;
      }
      
      if(key == ' '){
        if(selected == 0){
          music.play(1, 0.1);
          gameState += 1;
          click.play();
          c.reset();
          selected = -1;
        }else if (selected == 1){
          gameState = 7;
          selected = -1;
        }
      }
    }
  
    //loss
    else if(gameState == 2){
      if(keyCode == LEFT){
        selected = 0;
      }else if(keyCode == RIGHT){
        selected = 1;
      }
    
      if(key == ' '){
        if(selected == 0){
          gameState = 0;
          click.play();
          selected = -1;
        }else if (selected == 1){
          gameState = 5;
          click.play();
          selected = -1;
        }
      }
    }
  
    //gameplay
    else if (gameState == 1) {
      if (key == ' ') {
        c.flip();
        flip.play();
      } else if (key == 'q' || key == 'p') {
      } else if(keyCode == UP){
        c.player.jump();
      }
    }
  
    //entering highscores
    else if(gameState == 3){
      name = "" + alphabet[letters[0]] + alphabet[letters[1]] + alphabet[letters[2]];
    
      if(key == ' ' && !(name.equals("aaa"))){
        name = name + " " + score;
        reorder();
      
        name = "";
        score = 0;
      
        gameState = 5;
      
        selected = -1;
      }
    
      if(keyCode == RIGHT && selected < 2){
        selected++;
      }else if(keyCode == LEFT && selected > 0){
        selected--;
      }
    
      if(keyCode == UP){
        if(letters[selected] > 0){
          letters[selected]--;
        }else{
          letters[selected] = 25;
        }
      }else if (keyCode == DOWN){
        if(letters[selected] < 25){
          letters[selected]++;
        }else{
          letters[selected] = 0;
        }
      }
    }
  
    //highscores
    else if(gameState == 5){
      if(key == ' '){
        gameState = 0;
        click.play();
      }
    }
  
    //tutorial
    else if(gameState == 7){
      if(key == ' '){
        gameState = 0;
        click.play();
      }
    }
  }
}


void reorder(){
  ss[10] = score;
  scores[10] = name;
  for(int i = 10; ss[i] > ss[i-1]; i--){
    int temp = ss[i-1];
    ss[i-1] = ss[i];
    ss[i] = temp;
    
    String t = scores[i-1];
    scores[i-1] = scores[i];
    scores[i] = t;
    
    saveStrings(filename_high_scores, scores);
  }
}

void runTutorial(){
  textAlign(CENTER);
  fill(255);
  text("WELCOME TO FLIP SIDE!", width/2, height/10);
  
  imageMode(CENTER);
  image(one, width/2,height/2,width/3, width/3);
  
  textSize(height/30);
  
  text("PRESS SPACE TO FLIP AND THE UP ARROW TO JUMP", width/2, height/4);
  text("AVOID OBSTACLES BY FLIPPING, JUMPING,", width/2, height*3/4);
  text("AND USING PLATFORMS AND BOOSTS", width/2, height*3/4+height/20);
  
  if(mouseX > width/2 - height/20*3 && mouseX < width/2 + height/20*3 && mouseY > height-height/10-height/20 && mouseY < height-height/10 + height/20){
    fill(255);
  }else{
    fill(150);
  }
  
  textSize(height/20);
  
  text("RETURN HOME", width/2, height - height/10);
}

void movieEvent(Movie m) {
  m.read();
}
