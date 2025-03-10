PImage background;
PFont font;
int upperleftx;
int upperlefty;

Tile[][] tiles = new Tile[4][4]; 
int[] coord = {35, 175, 315, 455};

import processing.sound.*;
SoundFile file;

void setup()
{
  upperleftx = width/2 - 300;
  upperlefty = height/2 - 300;
  noCursor(); 
  fullScreen();
  background = loadImage("threesGameBoard.png");
  background.resize(600, 600);
  background(#FAFAFA);

  tiles[2][0] = new Tile(3);
  tiles[2][0].n = (int)random(1, 4);
  
  font = loadFont("PTSans-NarrowBold-80.vlw");
  textFont(font, 90);
  
  /*file = new SoundFile(this, "threesSoundtrack.mp3");
  file.play();*/
}

void draw()
{
  image(background, upperleftx, upperlefty);
  restart();
  score();
  
  for (int i=0; i<4; i++)
  {
    for (int j=0; j<4; j++)
    {
      if (tiles[i][j] != null)
       { 
        pushMatrix();
        translate(coord[j] +upperleftx, coord[i] +upperlefty);
        tiles[i][j].display();
        popMatrix();
       }
    }
  }
}