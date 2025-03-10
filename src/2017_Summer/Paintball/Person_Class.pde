class Person
{
  int a;
  int b; 
  int va;
  int vb;

  Person(int aIn, int bIn, int vaIn, int vbIn)
  {
    a = aIn;
    b = bIn; 
    va = vaIn; 
    vb = vbIn;
    
    stroke(#FFE798); 
    line(a, b, a, b+50);
    line(a, b+50, a+10, b+60);
    line(a, b+50, a-10, b+60);
    line(a, b+35, a+10, b+20);
    line(a, b+35, a-10, b+20);
    stroke(0);
  }
  

  
} // class Person