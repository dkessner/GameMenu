

class Book
{
  PImage cover;
  int num;
  String title;
  boolean displayed = false;
  
  Book(String coverIn, int numIn, String titleIn)
  {
    cover = loadImage("data/" + coverIn + ".png");
    num = numIn;
    title = titleIn;
    this.resize();
  }
  
  void display()
  {
    if (!displayed)
    {
        this.resize();
        displayed = true;
    }

    image(cover, 2*width/3, height/2);
  }
  
  int getNum() {return num;}
  
  
  void resize() 
  {
    cover.resize((int)(1.7*width/5), 0);
  }
}
