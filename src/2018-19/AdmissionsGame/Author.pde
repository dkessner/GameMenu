
class Author
{
  String name;
  int num;
  int y;
  
  Author(String nameIn, int numIn)
  {
    name = nameIn;
    num = numIn;
  }
  
  void display(int yIn)
  {
    y = yIn;
    fill(88, 23, 145);
    if (mouseOn()) {strokeWeight(3);}
    else {strokeWeight(1);}
    rect(170, y, 320, 50);
    fill(255);
    text(name, 170, y);
  }
  
  void isClicked()
  {
    if (num==books.get(currentBook).getNum() && currentBook==4)
    {
      score++;
      englishgameState=2;
    }
    else if (num==books.get(currentBook).getNum() && currentBook<4)
    {
      score++;
      currentBook++;
    }
    else if (currentBook<4)
    {
      currentBook++;
    }
  }
  
  boolean mouseOn()
  {
    if (mouseX>10 && mouseX<330 && mouseY>y-25 && mouseY<y+25)
      return true;
    else
      return false;
  }
  
  
  
  
}
