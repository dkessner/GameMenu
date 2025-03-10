
/* @pjs preload="data/catcher.jpg"; */
/* @pjs preload="data/gatsby.jpg"; */
/* @pjs preload="data/jane.jpg"; */
/* @pjs preload="data/macbeth.jpg"; */
/* @pjs preload="data/room.jpg"; */
/* @pjs preload="data/scarletletter.jpg"; */
/* @pjs preload="data/streetcar.jpg"; */
/* @pjs preload="data/theireyes.jpg"; */
/* @pjs preload="data/mockingbird.jpg"; */
/* @pjs preload="data/twelve.jpg"; */

Book midsummer;
Book mockingbird;
Book mango;
Book diary;
Book jane;
Book catcher;
Book joyluck;
Book theireyes;
Book gatsby;
Book outsiders;

Author shakespeare;
Author lee;
Author cisneros;
Author alexie;
Author bronte;
Author salinger;
Author tan;
Author hurston;
Author fitzgerald;
Author hinton;


void initializePairs()
{
  midsummer = new Book("midsummer", 0, "A Midsummer Night's Dream");
  mockingbird = new Book("mockingbird", 1, "To Kill a Mockingbird");
  mango = new Book("mango", 2, "House on Mango Street");
  diary = new Book("diary", 3, "The Absolute True Diary of a Part-time Indian");
  jane = new Book("jane", 4, "Jane Eyre");
  catcher = new Book("catcher", 5, "The Catcher in the Rye");
  joyluck = new Book("joyluck", 6, "The Joy Luck Club");
  theireyes = new Book("theireyes", 7, "Their Eyes Were Watching God");
  gatsby = new Book("gatsby", 8, "The Great Gatsby");
  outsiders = new Book("outsiders", 9, "The Outsiders");
  
  books.add(midsummer);      //0
  books.add(mockingbird);      //1
  books.add(mango);      //2
  books.add(diary);      //3
  books.add(jane);      //4
  books.add(catcher);      //5
  books.add(joyluck);      //6
  books.add(theireyes);      //7
  books.add(gatsby);      //8
  books.add(outsiders);      //9
  
  shakespeare = new Author("William Shakespeare", 0);
  lee = new Author("Harper Lee", 1);
  cisneros = new Author("Sandra Cisneros", 2);
  alexie = new Author("Sherman Alexie", 3);
  bronte = new Author("Charlotte Bronte", 4);
  salinger = new Author("J.D. Salinger", 5);
  tan = new Author("Amy Tan", 6);
  hurston = new Author("Zora Neale Hurston", 7);
  fitzgerald = new Author("F. Scott Fitzgerald", 8);
  hinton = new Author("S. E. Hinton", 9);
  
  authors.add(shakespeare);
  authors.add(lee);
  authors.add(cisneros);
  authors.add(alexie);
  authors.add(bronte);
  authors.add(salinger);
  authors.add(tan);
  authors.add(hurston);
  authors.add(fitzgerald);
  authors.add(hinton);
}
