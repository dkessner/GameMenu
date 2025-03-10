//
// TestGame
//
// Darren Kessner
// Marlborough School
//


import processing.core.*;
import java.util.*;


class TestGame implements RockPaperScissors.Drawable, Thing.DeathListener
{
    public TestGame(RockPaperScissors rockPaperScissors)
    {
        this.rockPaperScissors = rockPaperScissors; // for returnToMenu()
        this.papplet = rockPaperScissors;           // for PApplet functions

        thingWrangler = new ThingWrangler(papplet);
        initialize();
    }

    public void initialize()
    {
        //Thing.borderBehavior = Thing.BorderBehavior.Die;
        Thing.borderBehavior = Thing.BorderBehavior.Bounce;
        //Thing.borderBehavior = Thing.BorderBehavior.Wrap;
        Thing.killSame = true;

        //Thing.registerDeathListener(this); // for testing DeathListener notifications

        thingWrangler.initialize();

        // players

        x1 = papplet.width/3;
        y1 = papplet.height/2;

        x2 = papplet.width*2/3;
        y2 = papplet.height/2;
    }

    public void update()
    {
        thingWrangler.update();
    }

    public void display()
    {
        papplet.background(0);

        papplet.stroke(128);
        papplet.strokeWeight(5);

        papplet.fill(0, 0, 255);
        papplet.ellipse(x1, y1, 50, 50); // Player 1

        papplet.fill(255, 0, 0);
        papplet.ellipse(x2, y2, 50, 50); // Player 2

        thingWrangler.display();

        // display number of Things

        papplet.fill(255);
        papplet.text(thingWrangler.things().size(), 50, 50);
    }

    public void keyPressed()
    {
        float vx = papplet.random(-3, 3);
        float vy = papplet.random(-3, 3);
        float speed = 20;

        // Player 1

        if (papplet.keyCode == PApplet.UP)
            y1 -= speed;
        else if (papplet.keyCode == PApplet.DOWN)
            y1 += speed;
        else if (papplet.keyCode == PApplet.LEFT)
            x1 -= speed;
        else if (papplet.keyCode == PApplet.RIGHT)
            x1 += speed;

        else if (papplet.key == ' ')
            thingWrangler.createThing(Thing.Type.Rock, 0, papplet.random(10, 50), 3000,  
                    x1, y1, vx, vy);
        else if (papplet.key == ',')
            thingWrangler.createThing(Thing.Type.Paper, 0, papplet.random(10, 50), 3000, 
                    x1, y1, vx, vy);
        else if (papplet.key == '.')
            thingWrangler.createThing(Thing.Type.Scissors, 0, papplet.random(10, 50), 3000, 
                    x1, y1, vx, vy);

        // Player 2

        else if (papplet.key == 'w')
            y2 -= speed;
        else if (papplet.key == 's')
            y2 += speed;
        else if (papplet.key == 'a')
            x2 -= speed;
        else if (papplet.key == 'd')
            x2 += speed;

        else if (papplet.key == '1')
            thingWrangler.createThing(Thing.Type.Rock, 1, papplet.random(10, 50), 3000,
                    x2, y2, vx, vy);
        else if (papplet.key == '2')
            thingWrangler.createThing(Thing.Type.Paper, 1, papplet.random(10, 50), 3000,
                    x2, y2, vx, vy);
        else if (papplet.key == '3')
            thingWrangler.createThing(Thing.Type.Scissors, 1, papplet.random(10, 50), 3000,
                    x2, y2, vx, vy);

        else if (papplet.key == 'q')
            rockPaperScissors.returnToMenu();
    }

    public void notifyNextOfKin(Thing thing, Thing.DeathListener.Cause cause)
    {
        System.out.println(thing.type);
        System.out.println(thing.id);
        System.out.println(thing.radius);
        System.out.println(thing.position.x);
        System.out.println(thing.position.y);
        System.out.println(cause);
        System.out.println();
    }


    // private data and methods

    private RockPaperScissors rockPaperScissors;
    private PApplet papplet;

    private ThingWrangler thingWrangler;

    private float x1;
    private float y1;
    private float x2;
    private float y2;
}
 
