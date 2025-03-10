void draw()
{
 if (gameState == 0) 
   {
     drawStart();
   }
   else if (gameState == 1)
   {
     drawGame();
   }
   else if (gameState == 2)
   {
     drawEnd();
   }
   else if (gameState == 3)
   {
     drawFinal();
   }
} 