//Here, I declare the variables I need
//Here's the stuff for vanilla
float vanillax, vanillay = 5;
//Here's the stuff for chocolate
float chocolatex, chocolatey = 5;
//Here's the stuff for cherry
float cherryx, cherryy = -10;
//Here's the stuff for cookie
float cookiex, cookiey = -10;
float conex = width/2, coney;
float vx = 0, vy = 3.5;

void iceCream() {
  if (vanillay == 5) {
    vanillax = random(0+flavorv.width, width);
  }
  if (chocolatey == 5) {
    chocolatex = random(0+flavorc.width, width);
  }
  coney = height/2 + height/2.5;
  imageMode(CENTER);
  image(flavorv, vanillax, vanillay);
  image(flavorc, chocolatex, chocolatey);
  image(cone, conex, coney);
  image(toppingc, cherryx, cherryy);
  image(toppingco, cookiex, cookiey);
  conex = conex + vx;
  //Vanilla stuff
  if (flavor == "Vanilla") {
    if (dist(vanillax, vanillay, conex, coney)>height/11 && dist(chocolatex, chocolatey, conex, coney)>height/11) {
      //Now I'll set up the moving variables
      vanillay = vanillay + vy;
    }
    if (dist(vanillax, vanillay, conex, coney)<=height/11) {
      chocolatey = 0 - flavorc.height;
      vanillay = coney - cone.height+height/11;
      vanillax = conex;
      image(flavorv, vanillax, vanillay);
      next = "YES";
    }
    if (vanillay>height/2+height/2.5) {
      image(splatter, vanillax, vanillay);
      vanillay = 0;
      gameState = "END";
    }
  }
  if (flavor == "Chocolate" || flavor == "Strawberry") {
    if (dist(vanillax, vanillay, conex, coney)>height/11) {
      //Now I'll set up the moving variables
      vanillay = vanillay + vy;
    }
    if (dist(vanillax, vanillay, conex, coney)<=height/11) {
      gameState = "END";
    }
    if (vanillay>height/2+height/2.5) {
      vanillay = 0;
    }
  }

  //Chocolate stuff
  if (flavor == "Chocolate") {
    if (dist(chocolatex, chocolatey, conex, coney)>height/11) {
      //Now I'll set up the moving variables
      chocolatey = chocolatey + vy;
    }
    if (dist(chocolatex, chocolatey, conex, coney)<=height/11) {
      chocolatey = coney - cone.height+height/11;
      chocolatex = conex;
      image(flavorc, chocolatex, chocolatey);
      next = "YES";
    }
    if (chocolatey>height/2+height/2.5) {
      image(splatc, chocolatex, chocolatey);
      chocolatey = 0;
      gameState = "END";
    }
  }
  if (flavor == "Vanilla" || flavor == "Strawberry") {
    if (dist(chocolatex, chocolatey, conex, coney)>height/11 && dist(vanillax, vanillay, conex, coney)>height/11) {
      //Now I'll set up the moving variables
      chocolatey = chocolatey + vy;
    }
    if (dist(chocolatex, chocolatey, conex, coney)<=height/11) {
      chocolatey = 0 - flavorc.height;
      gameState = "END";
      println("hi");
    }
    if (chocolatey>height/2+height/2.5) {
      image(splatc, chocolatex, chocolatey);
      chocolatey = 0 - flavorc.height;
      println("hello");
    }
  }
  if (next == "YES") {
    if (cherryy == -10) {
      cherryx = random(0+toppingc.width, width);
    }
    if (cookiey == -10) {
      
      cookiex = random(0+toppingco.width, width);
    }
    //Cherry stuff
    if (toppings == "Cherry") {
      if (dist(cherryx, cherryy, conex, coney)>height/8 && dist(cookiex, cookiey, conex, coney)>height/8) {
        //Now I'll set up the moving variables
        cherryy = cherryy + vy;
      }
      if (dist(cherryx, cherryy, conex, coney)<=height/8) {
        cookiey = 0 - toppingc.height;
        cherryy = coney + cone.height + flavorv.height;
        cherryx = conex;
        image(toppingc, cherryx, cherryy);
      }
      if (cherryy>height/2+height/2.5) {
        cherryy = 0;
        gameState = "END";
      }
    }
    if (toppings == "Cookie") {
      if (dist(cherryx, cherryy, conex, coney)>height/8) {
        //Now I'll set up the moving variables
        cherryy = cherryy + vy;
      }
      if (dist(cherryx, cherryy, conex, coney)<=height/8) {
        gameState = "END";
      }
      if (cherryy>height/2+height/2.5) {
        cherryy = 0;
      }
    }

    //Cookie stuff
    if (toppings == "Cookie") {
      if (dist(cookiex, cookiey, conex, coney)>height/8) {
        //Now I'll set up the moving variables
        cookiey = cookiey + vy;
      }
      if (dist(cookiex, cookiey, conex, coney)<=height/8) {
        cookiey = coney - cone.height- flavorv.height +height/11;
        cookiex = conex;
        image(toppingco, cookiex, cookiey);
      }
      if (cookiey>height/2+height/2.5) {
        cookiey = 0;
        gameState = "END";
      }
    }
    if (toppings == "Cherry") {
      if (dist(cookiex, cookiey, conex, coney)>height/8 && dist(cherryx, cherryy, conex, coney)>height/8) {
        //Now I'll set up the moving variables
        cookiey = cookiey + vy;
      }
      if (dist(cookiex, cookiey, conex, coney)<=height/8) {
        cookiey = 0 - toppingco.height;
        gameState = "END";
        println("hi");
      }
      if (cookiey>height/2+height/2.5) {
        cookiey = 0 - toppingco.height;
        println("hello");
      }
    }
  }
}
