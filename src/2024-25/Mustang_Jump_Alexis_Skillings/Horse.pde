class Horse {
  //declare horse images
  PImage mustang;

  //and assign variables
  float x, y, vy, ay;
  
  boolean endFall = false;

  Horse() {
    x= width/2.4;
    y= height/1.3;
    vy= 0;
    ay=0.15;
    mustang = loadImage("jumpingmustang.png");
  }

  void run() {
    if(gameState == "GAME"){
    vy+=ay;
    y+=vy;
    }
  }

  void display() {
    if (gameState == "GAME") {
      imageMode(CORNER);
      image(mustang, x, y);
    }
    if (gameState == "END") {
      //imageMode(CORNER);
      //image(mustang, x,y);
      //y+=vy;
      if(!endFall){
      y = -mustang.height;
      vy = 0;
      endFall = true;
    }
   if (y + mustang.height < height) {
      vy += ay;
      y += vy;
    } else {
      vy = 0;
      //stop exactly at bottom
      y = height - mustang.height; 
    }
    imageMode(CORNER);
    image(mustang,x,y);
    }
  }
  
  void move(){
    if(keyPressed){
      if(keyCode == LEFT){
        x-=5;
      }else if(keyCode == RIGHT){
        x+=5;
      }
    }
  }
  //make horse only able to jump when on a block
    //do a boolean

  //void checkBlock(){
  //this function checks when the horse lands on the block, but the horse can jump in front of blocks when veloccity is negative, but when velocity is positive than the horse cant go through the block

}

 
