//
// kaleidoscope.pde
//
// Darren Kessner
// Marlborough School
//


void setup()
{
    fullScreen(); 
    background(0);
    noCursor();
}


int x = 50;
int y = 10;
int vx = 1;
int vy = 2;


void draw_shapes()
{
    fill(255, 0, 0);
    ellipse(x, y, 50, 150);

    fill(0, 255, 0);
    ellipse(x+30, y+30, 10, 10);

    fill(0, 0, 255);
    ellipse(x-50, y-20, 10, 10);
}


void draw()
{
    translate(width/2, height/2);

    float n = 13;
    for (int i=0; i<n; ++i)
    {
        pushMatrix();
        rotate(2*PI*i/n);
        draw_shapes();
        popMatrix();
    }

    x += vx;
    y += vy;

    if (x<-200 || x>200)
        vx = -vx;
    if (y<-200 || y>200)
        vy = -vy;
}


