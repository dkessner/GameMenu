//
// Sierpinski
//


import processing.core.*;


public class Sierpinski extends PApplet
{
    private static final int windowSize = 700;

    public void settings()
    {
        //size(windowSize, windowSize);
        fullScreen();
    }

    public void setup()
    {
        noCursor();
    }

    private int level = 0;

    public void draw()
    {
        background(0);

        // print level

        fill(255);
        textSize(20);
        text("Change level: UP/DOWN", 50, 50);
        textSize(40);
        text("" + level, 50, 100);

        // transform to standard coordinate system

        translate(width/2, height/2);   // move origin to center of window
        scale(1, -1);                   // flip y-axis
        scale((float)windowSize/200);   // scale: [-100, 100] x [-100, 100]

        // draw triangles

        equilateralTriangle();
        sierpinski(level);
    }

    public void sierpinski(int depth)
    {
        invertedTriangle();

        if (depth > 0)
        {
            // draw 3 transformed inverted triangles 

            pushMatrix();
            translate(0, 50);
            scale(.5f);
            sierpinski(depth-1);
            popMatrix();

            pushMatrix();
            translate(-50, -50);
            scale(.5f);
            sierpinski(depth-1);
            popMatrix();

            pushMatrix();
            translate(50, -50);
            scale(.5f);
            sierpinski(depth-1);
            popMatrix();
        }
    }

    public void equilateralTriangle()
    {
        fill(255);
        triangle(0, 100, -100, -100, 100, -100); 
    }

    public void invertedTriangle()
    {
        fill(0);
        triangle(-50, 0, 50, 0, 0, -100);
    }

    public void keyPressed()
    {
        if (keyCode == UP)
        {
            if (level < 8)
                level++;
        }
        else if (keyCode == DOWN)
        {
            if (level>0) 
                level--;
        }
    }

    public static void main(String[] args)
    {
        PApplet.main("Sierpinski");
    }
}

