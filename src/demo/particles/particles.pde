//
// particles.pde
//
// Darren Kessner
// Marlborough School
//


ParticleGenerator particle_generator;
Player player1;
Player player2;


void setup()
{
    fullScreen();
    noCursor();

    particle_generator = new ParticleGenerator();

    player1 = new Player();
    player2 = new Player();

    player1.position = new PVector(width/4, height/3);
    player1.velocity = new PVector(0, 0);
    player1.c = color(0, 0, 255);

    player2.position = new PVector(width*3/4, height/3);
    player2.velocity = new PVector(0, 0);
    player2.c = color(255, 0, 0);
}


void draw()
{
    background(0);
    
    particle_generator.display();
    particle_generator.update();

    // display number of particles

    textSize(40);
    fill(255);
    text(particle_generator.particles.size(), 10, 60);

    // show players

    player1.display();
    player2.display();
}


void keyPressed()
{
    float cursorSpeed = 15;
    int particleRateMax = 5;

    // Player 1

    if (keyCode == UP)
        player1.velocity.y = -cursorSpeed;
    else if (keyCode == DOWN)
        player1.velocity.y = cursorSpeed;
    else if (keyCode == LEFT)
        player1.velocity.x = -cursorSpeed;
    else if (keyCode == RIGHT)
        player1.velocity.x = cursorSpeed;
    else if (key == ' ')
        player1.particleRate = particleRateMax;

    // Player 2

    else if (key == 'w')
        player2.velocity.y = -cursorSpeed;
    else if (key == 's')
        player2.velocity.y = cursorSpeed;
    else if (key == 'a')
        player2.velocity.x = -cursorSpeed;
    else if (key == 'd')
        player2.velocity.x = cursorSpeed;
    else if (key == '1')
        player2.particleRate = particleRateMax;
}


void keyReleased()
{
    // Player 1

    if (keyCode == UP || keyCode == DOWN)
        player1.velocity.y = 0;
    else if (keyCode == LEFT || keyCode == RIGHT)
        player1.velocity.x = 0;
    else if (key == ' ')
        player1.particleRate = 0;

    // Player 2

    if (key == 's' || key == 'w')
        player2.velocity.y = 0;
    else if (key == 'a' || key == 'd')
        player2.velocity.x = 0;
    else if (key == '1')
        player2.particleRate = 0;
}


class Player
{
    PVector position;
    PVector velocity;
    int c;
    int particleRate;

    void display()
    {
        fill(c);
        stroke(128);
        strokeWeight(5);
        ellipse(position.x, position.y, 100, 100);
        position.add(velocity);
        particle_generator.create(position.x, position.y, particleRate);
    }
}

