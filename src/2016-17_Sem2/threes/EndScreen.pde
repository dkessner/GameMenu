void restart()
{
fill(0);
textSize(20);
strokeWeight(180);
text("press first red button to restart",300 +upperleftx, 600 + upperlefty); 
}

void reset()
{
 for (int i=0; i<4; i++)
  for (int j=0; j<4; j++)
   tiles[i][j] = null;
   
 tiles[2][0] = new Tile(3);
 tiles[2][0].n = (int)random(1, 4);
}