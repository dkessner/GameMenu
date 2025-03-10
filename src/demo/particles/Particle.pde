//
// Particle.pde
//
// Darren Kessner
//


class Particle
{
    float x;
    float y;
    float vx;
    float vy;
    float ax;
    float ay;
    int lifetime;
    color c;

    Particle(float x_start, float y_start, 
             float vx_start, float vy_start,
             float ax_start, float ay_start,
             int lifetime_start)
    {
        x = x_start;
        y = y_start;
        vx = vx_start;
        vy = vy_start;
        ax = ax_start;
        ay = ay_start;
        lifetime = lifetime_start;
        c = color(random(255), random(255), random(255));
    }

    void display()
    {
        stroke(c);
        fill(c);
        ellipse(int(x), int(y), 2, 2);
    }

    void update()
    {
        x += vx;
        y += vy;
        vx += ax;
        vy += ay;
        if (lifetime > 0) lifetime--;
    }
}


