void score()
{
 int total = 0;
 
  for (int i=0; i<4; i++)
  {
     for (int j=0; j<4; j++)
     {
       if (tiles[i][j] != null)
         {
           total += tiles[i][j].n;
         }
     }
  }
   
 fill(0);
 strokeWeight(180);
 textSize(20);
 text("score:" + total*3, 300 + upperleftx, 20 + upperlefty); 
}