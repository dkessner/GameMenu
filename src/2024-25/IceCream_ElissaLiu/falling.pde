//Here, I declare the variables I need
//Here's the stuff for vanilla
float vanillax, vanillay;
//Here's the stuff for chocolate
float chocolatex, chocolatey;
//Here's the stuff for strawberry
float strawberryx, strawberryy;
//Here's the stuff for cherry
float cherryx, cherryy = -10;
//Here's the stuff for cookie
float cookiex, cookiey = -10;
float conex = width/2, coney;
float vx = 0, vy = 3.5;

void reset(){
  vanillay = 0 - flavorv.height;
  chocolatey = 0 - flavorc.height;
  strawberryy = 0 - flavors.height;
  cherryy = -10;
  cookiey = -10;
  conex = width/2;
  vx = 0;
  next = "NO";
}

void iceCream() {
  if (vanillay == 0 - flavorv.height) {
    vanillax = random(0+flavorv.width, width);
  }
  if (chocolatey ==  0 - flavorc.height) {
    chocolatex = random(0+flavorc.width, width);
  }
  if (strawberryy == 0 - flavors.height){
    strawberryx = random(0+flavors.width, width);
  }
  coney = height/2 + height/2.5;
  imageMode(CENTER);
  image(flavorv, vanillax, vanillay);
  image(flavorc, chocolatex, chocolatey);
  image(flavors, strawberryx, strawberryy);
  image(cone, conex, coney);
  image(toppingc, cherryx, cherryy);
  image(toppingco, cookiex, cookiey);
  textSize(20);
  textAlign(CORNER);
  text("SCORE: " + score, width/12, height/8);
  conex = conex + vx;
  //Vanilla stuff
  if (flavor == "Vanilla") {
    if (dist(vanillax, vanillay, conex, coney)>height/11 && dist(chocolatex, chocolatey, conex, coney)>height/11 && dist(strawberryx, strawberryy, conex, coney)>height/11) {
      //Now I'll set up the moving variables
      vanillay = vanillay + vy;
    }
    if (dist(vanillax, vanillay, conex, coney)<=height/11) {
      chocolatey = 0 - flavorc.height;
      strawberryy = 0 - flavors.height;
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
    if (dist(vanillax, vanillay, conex, coney)>height/11 && dist(chocolatex, chocolatey, conex, coney)>height/11 && dist(strawberryx, strawberryy, conex, coney)>height/11) {
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
    if (dist(chocolatex, chocolatey, conex, coney)>height/11 && dist(strawberryx, strawberryy, conex, coney)>height/11 && dist(vanillax, vanillay, conex, coney)>height/11) {
      //Now I'll set up the moving variables
      chocolatey = chocolatey + vy;
    }
    if (dist(chocolatex, chocolatey, conex, coney)<=height/11) {
      chocolatey = coney - cone.height+height/11;
      chocolatex = conex;
      strawberryy = 0 - flavors.height;
      vanillay = 0 - flavorv.height;
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
    if (dist(chocolatex, chocolatey, conex, coney)>height/11 && dist(vanillax, vanillay, conex, coney)>height/11 && dist(strawberryx, strawberryy, conex, coney)>height/11) {
      //Now I'll set up the moving variables
      chocolatey = chocolatey + vy;
    }
    if (dist(chocolatex, chocolatey, conex, coney)<=height/11) {
      chocolatey = 0 - flavorc.height;
      strawberryy = 0 - flavors.height;
      gameState = "END";
      println("hi");
    }
    if (chocolatey>height/2+height/2.5) {
      image(splatc, chocolatex, chocolatey);
      chocolatey = 0 - flavorc.height;
      strawberryy = 0 - flavors.height;
      println("hello");
    }
  }
  //Strawberry stuff
  if (flavor == "Strawberry") {
    if (dist(strawberryx, strawberryy, conex, coney)>height/11 && dist(chocolatex, chocolatey, conex, coney)>height/11 && dist(vanillax, vanillay, conex, coney)>height/11) {
      //Now I'll set up the moving variables
      strawberryy = strawberryy + vy;
    }
    if (dist(strawberryx, strawberryy, conex, coney)<=height/11) {
      chocolatey = 0 - flavorc.height;
      vanillay = 0 - flavorv.height;
      strawberryy = coney - cone.height+height/11;
      strawberryx = conex;
      image(flavors, strawberryx, strawberryy);
      next = "YES";
    }
    if (strawberryy>height/2+height/2.5) {
      image(splatter, strawberryx, strawberryy);//fix this later
      gameState = "END";
    }
  }
  if (flavor == "Chocolate" || flavor == "Vanilla") {
    if (dist(vanillax, vanillay, conex, coney)>height/11 && dist(strawberryx, strawberryy, conex, coney)>height/11 && dist(vanillax, vanillay, conex, coney)>height/11) {
      //Now I'll set up the moving variables
      strawberryy = strawberryy + vy;
    }
    if (dist(strawberryx, strawberryy, conex, coney)<=height/11) {
      gameState = "END";
    }
    if (strawberryy>height/2+height/2.5) {
      strawberryy = 0 - flavors.height;
    }
  }

  //Toppings stuff
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
        cherryy = coney - cone.height - height/11;
        cherryx = conex;
        image(toppingc, cherryx, cherryy);
        score +=1;
        gameState = "ORDER";
        vy += 1;
        days += 1;
        reset();
        randomOrder();
      } else if (cherryy>height) {
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
        score +=1;
        days += 1;
        vy += 0.5;
        gameState = "ORDER";
        randomOrder();
        reset();
      }
      if (cookiey>height/2+height/2.5) {
        cookiey = 0;
        gameState = "END";
        println("hi");
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

void randomOrder() {
  int flavorRoll = int (random(3));
  if (flavorRoll == 0) {
    flavor = "Vanilla";
  } else if (flavorRoll == 1) {
    flavor = "Chocolate";
  } else if (flavorRoll == 2) {
    flavor = "Strawberry";
  }
  int toppingsRoll = int (random(2));
  if (toppingsRoll == 0) {
    toppings = "Cherry";
  } else if (toppingsRoll == 1) {
    toppings = "Cookie";
  }
}
