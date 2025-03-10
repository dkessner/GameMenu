//
// Gallery
//

//
// preload directives for processing.js
//

/* @pjs preload="data/Kyrapipe.jpg"; */
/* @pjs preload="data/kyraponytail.jpg"; */
/* @pjs preload="data/gabi.png"; */
/* @pjs preload="data/sidney.png"; */
/* @pjs preload="data/Gallery.png"; */


PImage pipe;
PImage ponytail;
PImage landscape;
PImage patterns;
PImage galBack;

String kyra = "By Kyra '19";
String sid = "By Sidney '21";
String gab = "By Gabi '20";

void setupGallery() {
   pipe = loadImage("data/Kyrapipe.jpg");
   ponytail = loadImage("data/kyraponytail.jpg");
   landscape = loadImage("data/gabi.png");
   patterns = loadImage("data/sidney.png");
   galBack = loadImage("data/Gallery.png");

   resizeGalleryImages();
}

void resizeGalleryImages() {
   pipe.resize(245,185);
   ponytail.resize(165,245);
   landscape.resize(345,185);  
   patterns.resize(245,245);
   galBack.resize(width,height);
}

void playGallery() {
  if (galBack.width != width)
    resizeGalleryImages();

  stroke(0);
  strokeWeight(1);
  image(galBack,0,0);
  
  image(pipe, (width/20)-20,height/2);
  image(ponytail, (5*width/17),(height/2)-50);
  image(landscape,(width/2)-20,(height/2));
  image(patterns,(4*width/5)-20,(height/2)-50);
  
  text(kyra,(width/20)-20,(height/2)+pipe.height+2);
  text(kyra,(5*width/17),(height/2)-50+ponytail.height+2);
  text(gab,(width/2)-20,(height/2)+landscape.height+2);
  text(sid,(4*width/5)-20,(height/2)-50+patterns.height+2);
  
  fill(0);
  
  //galleryExit.display();
  //galleryExit.open();
  
  player.display();
  if (player.position.x <= 0)
    player.position.x = 0;
  else if (player.position.x >= width) {
     player.position.x = 1;
  }
  escButton.display();
}
