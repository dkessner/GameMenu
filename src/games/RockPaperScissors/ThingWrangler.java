//
// ThingWrangler
//
// Darren Kessner
// Marlborough School
//


import processing.core.*;
import java.util.*;


public class ThingWrangler implements RockPaperScissors.Drawable
{
    public ThingWrangler(PApplet papplet)
    {
        this.papplet = papplet;
        things = new ArrayList<Thing>();
    }

    public void initialize()
    {
        things.clear();
    }

    public void update()
    {
        for (Thing t : things)
            t.update();

        // remove dead things

        Iterator<Thing> it = things.iterator();
        while (it.hasNext())
        {
            if (it.next().isDead())
                it.remove();
        }

        // check for collisions

        for (int i=0; i<things.size(); i++)
        for (int j=0; j<i; j++)
        {
            things.get(i).collide(things.get(j));
        }
    }

    public void display()
    {
        for (Thing t : things)
            if (!t.isAlive())
                t.display();

        for (Thing t : things)
            if (t.isAlive())
                t.display();
    }

    public void createThing(Thing.Type type, int player, float radius, int lifetime,
                            float x, float y, float vx, float vy)
    {
        things.add(new Thing(papplet, type, player, radius, lifetime, x, y, vx, vy));
    }

    public void createThing(Thing.Type type, int player, float radius, int lifetime,
            PVector position, PVector velocity)
    {
        things.add(new Thing(papplet, type, player, radius, lifetime,
                   position.x, position.y, velocity.x, velocity.y));
    }

    public List<Thing> things()
    {
        return Collections.unmodifiableList(things);
    }

    // private data and methods

    private PApplet papplet;
    private ArrayList<Thing> things;
}


