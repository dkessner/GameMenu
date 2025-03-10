void setup()
{
    //size(1300, 750); 
    fullScreen();
    background(0);
    noCursor();
}


int x = 50;
int y = 10;
int vx = 1;
int vy = 2;


int programState = 0;


void draw_shapes1()
{
  
    // plum 7
    fill(#931F59);
    ellipse(x-50, y-20, 150, 150);

    
    //blue 1
    fill(0,0,255);
    ellipse(x, y, 50, 150);
    
    
    //light blue 2
    fill(#5DEDE9);
    ellipse(x+10,y+50, 100,100);
    
    
    // pink 4
    fill (#ED1875);
    ellipse(x+50, y+20, 100, 50);
   
    //lavender 3
    fill(0);
    ellipse(x+230, y+100, 40, 80);

    
    //green 6
    fill(0,150,200);
    ellipse (x-20, x-10, 75,95);
    
    //teal  5
    fill(30,180,760);
    ellipse( x- 320, y - 100, 50, 25);
    
    //triangle
    fill (#EA36DF);
    triangle(x,y+50,60,60,60,60); 
}


void draw1()
{
    pushMatrix();
    translate(width/2, height/2);
    scale(.2);

    float n = 13;
    for (int i=0; i<n; ++i)
    {
        pushMatrix();
        rotate(2*PI*i/n);
        draw_shapes1();
        popMatrix();
    }
    
    popMatrix();
    

    x += vx;
    y += vy;

    if (x<-400 || x>400)
        vx = -vx;
    if (y<-400 || y>400)
        vy = -vy;
        
    
}

void draw_shapes2()
{
  
    // navy 7
    fill(#16199D);
    ellipse(x-50, y-20, 150, 150);

    
    //green 1
    fill(#12FF2F);
    ellipse(x, y, 50, 150);
    
    //orange 2
    fill(#FF5F03);
    ellipse(x+10,y+50, 100,100);
    
    
    // pink 4
    fill (#ED1875);
    ellipse(x+50, y+20, 100, 50);
   
    //black 3
    fill(0);
    ellipse(x+230, y+100, 40, 80);

    
    //yellow 6
    fill(#E9FA05);
    ellipse (x-20, x-10, 75,95);
    
    //green  5
    fill(#05B212);
    ellipse( x- 320, y - 100, 50, 25);
    
    //triangle
    fill(#EA36DF);
    triangle(x,y+50,60,60,60,60);
}

void draw2()
{
    pushMatrix();
    
    translate(2*width/2.67, height/1.975);
    scale(.2);

    float n = 13;
    for (int i=0; i<n; ++i)
    {
        pushMatrix();
        rotate(2*PI*i/n);
        draw_shapes2();
        popMatrix();
    }
    
    popMatrix();

    x += vx;
    y += vy;

    if (x<-400 || x>400)
        vx = -vx;
    if (y<-400 || y>400)
        vy = -vy;
}

void drawshapes3()
{
    // red 7
    fill(255,0,0);
    ellipse(x-50, y-20, 150, 150);

    
    //blue 1
    fill(0,100,0);
    ellipse(x, y, 50, 150);
    
    
    //light blue 2
    fill(#5E66F0);
    ellipse(x+10,y+50, 100,100);
    
    
    // pink 4
    fill (#ED1875);
    ellipse(x+50, y+20, 100, 50);
   
    //black 3
    fill(0);
    ellipse(x+230, y+100, 40, 80);

    
    //green 6
    fill(0,150,200);
    ellipse (x-20, x-10, 75,95);
    
    //light pink  5
    fill(#FA9ACF);
    ellipse( x- 320, y - 100, 50, 25);
    
    //triangle
    fill (#EA36DF);
    triangle(x,y+50,60,60,60,60); 
}

void draw3()
{
  pushMatrix();
  translate(width/4, height/2.05);
    scale(0.2);

    float n = 13;
    for (int i=0; i<n; ++i)
    {
        pushMatrix();
        rotate(2*PI*i/n);
        drawshapes3();
        popMatrix();
    }
    
    popMatrix();

    x += vx;
    y += vy;

    if (x<-400 || x>400)
        vx = -vx;
    if (y<-400 || y>400)
        vy = -vy;
}


void draw()
{
   draw1();
   draw2();
   draw3();
}