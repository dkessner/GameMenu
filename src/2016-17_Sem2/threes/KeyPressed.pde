boolean somethingMoved;

void moveRight()
{
    somethingMoved = false;
    
    for (int i=0; i<4; i++)
    {
       for (int j=3; j>=0; j--)
       {
          if (tiles[i][j] != null && 
              j+1<4 && 
              tiles[i][j+1]==null)
          {
               tiles[i][j+1] = tiles[i][j];
               tiles[i][j] = null;   
               somethingMoved = true;
          }
          
          if (tiles[i][j] != null &&
              j+1<4 && 
              tiles[i][j+1]!=null &&
              ( (tiles[i][j].n == tiles[i][j+1].n && tiles[i][j].n != 1 && tiles[i][j].n != 2) ||
                (tiles[i][j].n != tiles[i][j+1].n && tiles[i][j].n + tiles[i][j+1].n == 3))
              )
               {
                 tiles[i][j+1].n += tiles[i][j].n;
                 tiles[i][j] = null;
               }
       }
    }
    
    // add new
    if (somethingMoved)
    {
      for (int i=0; i<4; i++)
        {
          if (tiles[i][0] == null)
           {
             tiles[i][0] = new Tile((int)random(1, 4));
             break;
           }
        }
    }
}

void moveLeft()
{
    somethingMoved = false;
    
    for (int i=0; i<4; i++)
    {
       for (int j=0; j<4; j++)
       {
          if (tiles[i][j] != null &&
              j-1 >=0 && 
              tiles[i][j-1] == null)
              {
                 tiles[i][j-1] = tiles[i][j];
                 tiles[i][j] = null;
                 somethingMoved = true;
              }
            if (tiles[i][j] != null &&
              j-1>=0 && 
              tiles[i][j-1]!=null &&
              ( (tiles[i][j].n == tiles[i][j-1].n && tiles[i][j].n != 1 && tiles[i][j].n != 2) ||
                (tiles[i][j].n != tiles[i][j-1].n && tiles[i][j].n + tiles[i][j-1].n == 3))
              )
               {
                 tiles[i][j-1].n += tiles[i][j].n;
                 tiles[i][j] = null;
               }
          }
       }
       
       // add new
    if (somethingMoved)
    {
      for (int i=0; i<4; i++)
        {
          if (tiles[i][3] == null)
           {
             tiles[i][3] = new Tile((int)random(1, 4));
             break;
           }
        }
    }
}
void moveUp()
{    
    somethingMoved = false;
    
    for (int i=0; i<4; i++)
    {
       for (int j=0; j<4; j++)
       {
          if (tiles[i][j] != null &&
              i-1 >=0 && 
              tiles[i-1][j] == null)
              {
                 tiles[i-1][j] = tiles[i][j];
                 tiles[i][j] = null;
                 somethingMoved = true;
              }
            if (tiles[i][j] != null &&
              i+1<4 && 
              tiles[i+1][j]!=null &&
              ( (tiles[i+1][j].n == tiles[i][j].n && tiles[i][j].n != 1 && tiles[i][j].n != 2) ||
                (tiles[i][j].n != tiles[i+1][j].n && tiles[i][j].n + tiles[i+1][j].n == 3))
              )
               {
                 tiles[i+1][j].n += tiles[i][j].n;
                 tiles[i][j] = null;
               }
          }
       }
       
       // add new
    if (somethingMoved)
    {
      for (int j=0; j<4; j++)
        {
          if (tiles[3][j] == null)
           {
             tiles[3][j] = new Tile((int)random(1, 4));
             break;
           }
        }
    }
}

void moveDown()
{
  somethingMoved = false;
  
  for (int i=3; i>=0; i--)
    {
       for (int j=0; j<4; j++)
       {
          if (tiles[i][j] != null &&
              i+1 <4 && 
              tiles[i+1][j] == null)
              {
                 tiles[i+1][j] = tiles[i][j];
                 tiles[i][j] = null;
                 somethingMoved = true;
              }
              if (tiles[i][j] != null &&
              i-1>=0 && 
              tiles[i-1][j] != null &&
              ( (tiles[i][j].n == tiles[i-1][j].n && tiles[i][j].n != 1 && tiles[i][j].n != 2) ||
                (tiles[i][j].n != tiles[i-1][j].n && tiles[i][j].n + tiles[i-1][j].n == 3))
              )
               {
                 tiles[i-1][j].n += tiles[i][j].n;
                 tiles[i][j] = null;
               }
       }
    
    // add new
    if (somethingMoved)
    {
      for (int j=0; j<4; j++)
        {
          if (tiles[0][j] == null)
           {
             tiles[0][j] = new Tile((int)random(1, 4));
             break;
           }
        }
    }
}

}

void keyPressed()
{
  
  if (keyCode == RIGHT)
    moveRight();
  
  if (keyCode == LEFT)
    moveLeft();
     
  if (keyCode == UP)
    moveUp(); 
    
  if (keyCode == DOWN)
    moveDown();
    
  if (keyCode == ENTER)
    reset();
    
}