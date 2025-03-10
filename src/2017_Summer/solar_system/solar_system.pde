PFont font;
float mercuryt = 0;
float mercuryr = 200;
float venust = 0;
float venusr= 225;
float earthr = 250;
float eartht = 0;
float marsr = 275;
float marst = 0;
float jupiterr = 300;
float jupitert = 0;
float saturnr = 325;
float saturnt = 0;
float uranusr = 350;
float uranust = 0;
float neptuner = 375;
float neptunet = 0;
float mercury1 = 255;
float mercury2 = 255;
float mercury3 = 255;
float venus1 = 255;
float venus2 = 255;
float venus3 = 255;
float earth1 = 255;
float earth2 = 255;
float earth3 = 255;
float mars1 = 255;
float mars2 = 255;
float mars3 = 255;
float jupiter1 = 255;
float jupiter2 = 255;
float jupiter3 = 255;
float saturn1 = 255;
float saturn2 = 255;
float saturn3 = 255;
float uranus1 = 255;
float uranus2 = 255;
float uranus3 = 255;
float neptune1 = 255;
float neptune2 = 255;
float neptune3 = 255;
float selector = 0;
float moont = 0;
float moonr = 50;
float moon2r = 30;
float moon3r = 60;
float moon2t = 0;
float moon3t = 0;
float moon4t = 0;
float moon5t = 0;
float moon1r = 30;
float moon4r = 40;
float moon5r = 50;
float moon6r = 60;
float moon7r = 30;
float moon8r = 40;
float moon9r = 50;
float moon10r = 60;
float moon11r = 70;
float c = 255;
float c1 = 255;
float c2 = 255;
boolean showMercuryFacts;
boolean showVenusFacts;
boolean showEarthFacts;
boolean showMarsFacts;
boolean showJupiterFacts;
boolean showSaturnFacts;
boolean showUranusFacts;
boolean showNeptuneFacts;
float x = .2;
float x2 = .2;
float x3 = .2;
float x4 = .2;
float x5 = .2;
float x6 = .2;
float x7 = .2;
float x8 = .2;
void setup()
{
  //size(600, 600);
  fullScreen();
  noCursor();
  
  font = createFont("AvenirNextCondensed-UltraLight", 48);
}

void draw()
{
 

  background(#121212);
  sun();
  mercury();
  venus();
  earth();
  mars();
  jupiter();
  saturn();
  uranus();
  neptune();
  
  
  
 if (selector == 1)
 {
   x8 = 2;
  neptune1 = 255;
  neptune2 = 255;
  neptune3 = 0;
 }
 
 if (selector > 1 | selector < 1)
 {
   neptune1 = neptune2 = neptune3 = 255;
   x8 = .2;
 }
 
 if (selector == 2)
 {
   uranus1 = 255;
   uranus2 = 255;
   uranus3 = 0;
   x7 = 2;
 }
 if (selector > 2 | selector < 2)
 {
   uranus1 = uranus2 = uranus3 = 255;
   x7 = .2;
 }
 
 if (selector == 3)
 {
   saturn1 = 255;
   saturn2 = 254;
   saturn3 = 46;
   x6 = 2;
 }
 if (selector > 3 | selector < 3)
 {
   saturn1 = saturn2 = saturn3 = 255;
   x6 = .2;
 }
 
 if (selector == 4)
 {
   jupiter1 = 255;
   jupiter2 = 254;
   jupiter3 = 46;
   x5 = 2;
 }
 if (selector > 4 | selector < 4)
 {
   jupiter1 = jupiter2 = jupiter3 = 255;
   x5 = .2;
 }
 
 if (selector == 5)
 {
   mars1 = 255;
   mars2 = 254;
   mars3 = 46;
   x4 = 2;
 }
 if (selector > 5 | selector < 5)
 {
   mars1 = mars2 = mars3 = 255;
   x4 = .2;
 }
 
 if (selector == 6)
 {
   earth1 = 255;
   earth2 = 254;
   earth3 = 46;
   x3 = 2;
 }
 if (selector > 6 | selector < 6)
 {
   earth1 = earth2 = earth3 = 255;
   x3 = .2;
 }
 
 if (selector == 7)
 {
   venus1 = 255;
   venus2 = 254;
   venus3 = 46;
   x2 = 2;
 }
 if (selector > 7 | selector < 7)
 {
   venus1 = venus2 = venus3 = 255;
   x2 = .2;
 }
 
 if (selector == 8)
 {
   mercury1 = 255;
   mercury2 = 254;
   mercury3 = 46;
   x = 2;
 }
 if (selector > 8 | selector < 8)
 {
   mercury1 = mercury2 = mercury3 = 255;
   x = .2;
 }
 
 if (selector > 8 | selector < 0)
 {
   selector = 0;
 }
 
 
}

void keyPressed()
{
  if (keyCode == UP)
  {
    selector++;
  }
  if (keyCode == DOWN)
  {
    selector--;
  }
  
 
  
  if (selector == 8)
  {
    showMercuryFacts = true;
  }
  else
  {
    showMercuryFacts = false;
  }
  
  if (selector == 7)
  {
    showVenusFacts = true;
  }
  else
  {
    showVenusFacts = false;
  }
  
  if (selector == 6)
  {
    showEarthFacts = true;
  }
  else
  {
    showEarthFacts = false;
  }
  
  if(selector == 5)
  {
    showMarsFacts = true;
  }
  
  else
  {
    showMarsFacts = false;
  }
  
  if (selector == 4)
  {
    showJupiterFacts = true;
  }
  else
  {
    showJupiterFacts = false;
  }
  
  if (selector == 3)
  {
    showSaturnFacts = true;
  }
  else
  {
    showSaturnFacts = false;
  }
  
  if (selector == 2)
  {
    showUranusFacts = true;
  }
  else
  {
    showUranusFacts = false;
  }
  
  if (selector == 1)
  {
    showNeptuneFacts = true;
  }
  
  else
  {
    showNeptuneFacts = false;
  }
 }



void sun()
{
  fill(#FCE936);
  stroke(#FCE936);
  ellipse(width/2, height/2, 277, 277);
}


void mercury()
{
  
   if (showMercuryFacts == true)
  {
    mercuryFacts();
  }
  
  noFill();
  strokeWeight(x);
  stroke(mercury1, mercury2, mercury3);

 ellipse(width/2, height/2, mercuryr*2, mercuryr*2);
  float mercuryx = mercuryr * cos(mercuryt) + width/2;
  float mercuryy = mercuryr * sin(mercuryt) + height/2;
  noStroke();
  fill(#B77116);
  ellipse(mercuryx, mercuryy, 2, 2);

  {
  mercuryt-=0.02/.24109;
  }
}


void venus()
{
  if (showVenusFacts == true)
  {
    venusFacts();
  }
  noFill();
  strokeWeight(x2);
  stroke(venus1, venus2, venus3);

 ellipse(width/2, height/2, venusr*2, venusr*2);
  float venusx = venusr * cos(venust) + width/2;
  float venusy = venusr * sin(venust) + height/2;
  noStroke();
  fill(#E88502);
  ellipse(venusx, venusy, 2.41, 2.41);

  {
  venust+=0.02/.625;
  }
}

void earth()
{
  if (showEarthFacts == true)
  {
    earthFacts();
  }
  noFill();
  strokeWeight(x3);
  stroke(earth1, earth2, earth3);

  ellipse(width/2, height/2, earthr*2, earthr*2);
  float earthx = earthr * cos(eartht) + width/2;
  float earthy = earthr * sin(eartht) + height/2;
  noStroke();
  fill(#435DFF);
  ellipse(earthx, earthy, 2.54, 2.54);

  {
  eartht-=0.02;
  }
}

void mars()
{
  if (showMarsFacts == true)
  {
    marsFacts();
  }
  noFill();
  strokeWeight(x4);
  stroke(mars1, mars2, mars3);

 ellipse(width/2, height/2, marsr*2, marsr*2);
  float marsx = marsr * cos(marst) + width/2;
  float marsy = marsr * sin(marst) + height/2;
  noStroke();
  fill(#E83642);
  ellipse(marsx, marsy, 2.34, 2.34);

  {
  marst-=0.02/1.882191780821918;
  }
}

void jupiter()
{
  if (showJupiterFacts == true)
  {
    jupiterFacts();
  }
  noFill();
  strokeWeight(x5);
  stroke(jupiter1, jupiter2, jupiter3);

  ellipse(width/2, height/2, jupiterr * 2, jupiterr * 2);
  float jupiterx = jupiterr * cos(jupitert) + width/2;
  float jupitery = jupiterr * sin(jupitert) + height/2;
  noStroke();
  fill(#D6A68F);
  ellipse(jupiterx, jupitery, 28.4, 28.4);

  {
  jupitert-=0.02/12;
  }
}

void saturn()
{
  if (showSaturnFacts == true)
  {
    saturnFacts();
  }
  noFill();
  strokeWeight(x6);
  stroke(saturn1, saturn2, saturn3);

  ellipse(width/2, height/2, saturnr * 2, saturnr * 2);
  float saturnx = saturnr * cos(saturnt) + width/2;
  float saturny = saturnr * sin(saturnt) + height/2;
  noStroke();
  fill(#E0C6BA);
  ellipse(saturnx, saturny, 24, 24);
  fill(#797973);
  arc(saturnx, saturny, 30,4, 0, PI+QUARTER_PI,PIE );
 {
  saturnt-=0.02/29;
 }
}

void uranus()
{
  if (showUranusFacts == true)
  {
    uranusFacts();
  }
  noFill();
  strokeWeight(x7);
  stroke(uranus1, uranus2, uranus3);

 ellipse(width/2, height/2, uranusr * 2, uranusr * 2);
  float uranusx = uranusr * cos(uranust) + width/2;
  float uranusy = uranusr * sin(uranust) + height/2;
  noStroke();
  fill(#5A5EFF);
  ellipse(uranusx, uranusy, 10.2, 10.2);

  {
  uranust+=0.02/84;
  }

  {
    uranust+=0;
  }
}

void neptune()
{
  if (showNeptuneFacts == true)
  {
    neptuneFacts();
  }
  noFill();
  strokeWeight(x8);
  stroke(neptune1, neptune2, neptune3);

ellipse(width/2, height/2, neptuner * 2, neptuner * 2);
  float neptunex = neptuner * cos(neptunet) + width/2;
  float neptuney = neptuner * sin(neptunet) + height/2;
  noStroke();
  fill(#5A5EFF);
  ellipse(neptunex, neptuney, 9.88, 9.88);

  {
  neptunet-= 0.02/165;
  }
}

void mercuryFacts()
{
  strokeWeight(.5);
  stroke(c,c1,c2);
  noFill();
  rect(width/47.35, height/12.5, 260, 800);
  fill(255);
  textFont(font, 40);
  text("Mercury", width/13, height/12, width/5, height/15);
  stroke(#B77116);
  fill(#B77116);
  ellipse(width/9, height/5, 37, 37);
  String words ="diameter: 3,035 miles                        moons: 0                                                          distance from sun: 35.98 million miles             temperature can range from 801°F to -279°F                                                     orbital period: 88 Earth days                                                                              fun fact: because mercury orbits so quickly, it was believed by ancient civilizations to be two stars, one that appeared in the morning and one that appeared at night.";   
  textSize(20); 
  fill(255);
  text(words, width/40.35, height/3.5, 260, 800);
  
}

void venusFacts()
{
  strokeWeight(.5);
  stroke(c,c1,c2);
  noFill();
  rect(width/47.35, height/12.5, 260, 800);
  fill(255);
  textFont(font, 40);
  text("Venus", width/13, height/12, width/5, height/15);
  stroke(#E88502);
  fill(#E88502);
  ellipse(width/9, height/5, 37, 37);
  String words ="diameter: 7,520.8 miles                        moons: 0                                                          distance from sun: 67.24 million miles             temperature is around 880°F                                                    orbital period: 225 Earth days                                                                              fun fact: a day on Venus is longer than a year on Venus";   
  textSize(20); 
  fill(255);
  text(words, width/40.35, height/3.5, 260, 800);
}

void earthFacts()
{
  strokeWeight(.5);
  stroke(c,c1,c2);
  noFill();
  rect(width/47.35, height/12.5, 260, 800);
  fill(255);
  textFont(font, 40);
  noFill();
  strokeWeight(.5);
  stroke(255);
  text("Earth", width/12, height/12, width/5, height/15);
  float moonx = moonr * cos(moont) + width/9;
  float moony = moonr * sin(moont) + height/5;
  moont-=0.02;
  fill(#797973);
  stroke(#797973);
  ellipse(moonx, moony, 10, 10);
  stroke(#435DFF);
  fill(#435DFF);
  ellipse(width/9, height/5, 37, 37);
  String words ="diameter: 7,917.5 miles                       moons: 1                                                         distance from sun: 92.96 million miles             average temperature is around 61°F                                                    orbital period: 365 Earth days                                                                              fun fact: Earth is the only planet not named after a god or goddess. ";   
  textSize(20); 
  fill(255);
  text(words, width/40.35, height/3.5, 260, 800);
}

void marsFacts()
{
  strokeWeight(.5);
  stroke(c,c1,c2);
  noFill();
  rect(width/47.35, height/12.5, 260, 800);
  fill(255);
  textFont(font, 40);
  text("Mars", width/12, height/12, width/5, height/15);
  float Moon1x = moon2r * cos(moont) + width/9;
  float Moon1y = moon2r * sin(moont) + height/5;
  float Moon2x = moon3r * cos(moon2t) + width/9;
  float Moon2y = moon3r * sin(moon2t) + height/5;
  moont-=.03;
  moon2t-=.01;
  fill(#797973);
  stroke(#797973);
  ellipse(Moon1x, Moon1y, 10, 10);
  ellipse(Moon2x, Moon2y, 10, 10);
  stroke(#E83642);
  fill(#E83642);
  ellipse(width/9, height/5, 37, 37);
  String words ="diameter: 4,212 miles                      moons: 2                                                         distance from sun: 141.6 million miles             temperature ranges from -195°F to 70°F                                                    orbital period: 687 Earth days                                                                              fun fact: Mars is home to the tallest mountain in the solar system ";   
  textSize(20); 
  fill(255);
  text(words, width/40.35, height/3.5, 260, 800);
}

void jupiterFacts()
{
  strokeWeight(.5);
  stroke(c,c1,c2);
  noFill();
  rect(width/47.35, height/12.5, 260, 800);
  fill(255);
  textFont(font, 40);
  text("Jupiter", width/12, height/12, width/5, height/15);
  float Moon1x = moon1r * cos(moont) + width/9;
  float Moon1y = moon1r * sin(moont) + height/5;
  float Moon4x = moon4r * cos(moon2t) + width/9;
  float Moon4y = moon4r * sin(moon2t) + height/5;
  float Moon5x = moon5r * cos(moon3t) + width/9;
  float Moon5y = moon5r * sin(moon3t) + height/5;
  float Moon6x = moon6r * cos(moon4t) + width/9;
  float Moon6y = moon6r * sin(moon4t) + height/5;
  moont-=.03;
  moon2t-=.01;
  moon3t-=0.02;
  moon4t-=0.04;
  fill(#797973);
  stroke(#797973);
  ellipse(Moon1x, Moon1y, 10, 10);
  ellipse(Moon4x, Moon4y, 10, 10);
  ellipse(Moon5x, Moon5y, 10, 10);
  ellipse(Moon6x, Moon6y, 10, 10);
  stroke(#D6A68F);
  fill(#D6A68F);
  ellipse(width/9, height/5, 37, 37);
  String words ="diameter: 86,881.4 miles                      moons: around 67 (Io, Europa, Ganymede, and Callisto shown)                                                         distance from sun: 483.8 million miles             temperature is around -234°F on the outside of Jupiter                                                orbital period: 12 Earth years                                                                              fun fact: Jupiter is twice as big as every other planet combined. ";   
  textSize(20); 
  fill(255);
  text(words, width/40.35, height/3.5, 260, 800);
}

void saturnFacts()
{
  strokeWeight(.5);
  stroke(c,c1,c2);
  noFill();
  rect(width/47.35, height/12.5, 260, 800);
  fill(255);
  textFont(font, 40);
  text("Saturn", width/12, height/12, width/5, height/15);
  float Moon7x = moon7r * cos(moont) + width/9;
  float Moon7y = moon7r * sin(moont) + height/5;
  float Moon8x = moon8r * cos(moon2t) + width/9;
  float Moon8y = moon8r * sin(moon2t) + height/5;
  float Moon9x = moon9r * cos(moon3t) + width/9;
  float Moon9y = moon9r * sin(moon3t) + height/5;
  float Moon10x = moon10r * cos(moon4t) + width/9;
  float Moon10y = moon10r * sin(moon4t) + height/5;
  moont-=.03;
  moon2t-=.01;
  moon3t-=0.02;
  moon4t-=0.04;
  fill(#797973);
  stroke(#797973);
  ellipse(Moon7x, Moon7y, 10, 10);
  ellipse(Moon8x, Moon8y, 10, 10);
  ellipse(Moon9x, Moon9y, 10, 10);
  ellipse(Moon10x, Moon10y, 10, 10);
  stroke(#E0C6BA);
  fill(#E0C6BA);
  ellipse(width/9, height/5, 37, 37);
  stroke(#797973);
  fill(#797973);
  arc(width/9, height/5, 45,4, 0, PI+QUARTER_PI,PIE );
  String words ="diameter: 72,367.4 miles                      moons: around 53 (Titan, Enceladus, Rhea, and Tethys shown)                                                         distance from sun: 888.2 million miles             temperature is around -288°F                                               orbital period: 29 Earth years                                                                              fun fact: Although other planets have rings, Saturn's rings are the only ones that can be seen from Earth.";   
  textSize(20); 
  fill(255);
  text(words, width/40.35, height/3.5, 260, 800);
}

void uranusFacts()
{
  strokeWeight(.5);
  stroke(c,c1,c2);
  noFill();
  rect(width/47.35, height/12.5, 260, 800);
  fill(255);
  textFont(font, 40);
  text("Uranus", width/12, height/12, width/5, height/15);
  float Moon1x = moon1r * cos(moont) + width/9;
  float Moon1y = moon1r * sin(moont) + height/5;
  float Moon4x = moon4r * cos(moon2t) + width/9;
  float Moon4y = moon4r * sin(moon2t) + height/5;
  float Moon5x = moon5r * cos(moon3t) + width/9;
  float Moon5y = moon5r * sin(moon3t) + height/5;
  float Moon6x = moon6r * cos(moon4t) + width/9;
  float Moon6y = moon6r * sin(moon4t) + height/5;
  float Moon11x = moon11r * cos(moon5t) + width/9;
  float Moon11y = moon11r * sin(moon5t) + height/5;
  moont-=.03;
  moon2t-=.01;
  moon3t-=0.02;
  moon4t-=0.04;
  moon5t -= 0.025;
  fill(#797973);
  stroke(#797973);
  ellipse(Moon1x, Moon1y, 10, 10);
  ellipse(Moon4x, Moon4y, 10, 10);
  ellipse(Moon5x, Moon5y, 10, 10);
  ellipse(Moon6x, Moon6y, 10, 10);
  ellipse(Moon11x, Moon11y, 10, 10);
  stroke(#5A5EFF);
  fill(#5A5EFF);
  ellipse(width/9, height/5, 37, 37);
  String words ="diameter: 31,518 mi                      moons: 27 (Miranda, Ariel, Umbriel, Titania, and Oberon shown)                                                        distance from sun: 1.784 billion miles             temperature is around -357°F                                                orbital period: 84 Earth years                                                                              fun fact: Venus and Uranus are the only planets to rotate and orbit the sun clockwise. ";   
  textSize(20); 
  fill(255);
  text(words, width/40.35, height/3.5, 260, 800);
}

void neptuneFacts()
{
  strokeWeight(.5);
  stroke(c,c1,c2);
  noFill();
  rect(width/47.35, height/12.5, 260, 800);
  fill(255);
  textFont(font, 40);
  text("Neptune", width/12, height/12, width/5, height/15);
  float Moon1x = moon1r * cos(moont) + width/9;
  float Moon1y = moon1r * sin(moont) + height/5;
  moont-=.03;
  fill(#797973);
  stroke(#797973);
  ellipse(Moon1x, Moon1y, 10, 10);
  stroke(#5A5EFF);
  fill(#5A5EFF);
  ellipse(width/9, height/5, 37, 37);
  String words ="diameter: 30,599 miles                    moons: 14 (Triton shown)                                                        distance from sun: 2.795 billion miles             temperature is around -353°F                                                orbital period: 165 Earth years                                                                              fun fact: the only spacecraft to ever fly past Neptune was the Voyager 2. ";   
  textSize(20); 
  fill(255);
  text(words, width/40.35, height/3.5, 260, 800);
}
