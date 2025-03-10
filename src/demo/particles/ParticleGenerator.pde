//
// ParticleGenerator.pde
//
// Darren Kessner
//


import java.util.*;


class ParticleGenerator
{
    ArrayList<Particle> particles = new ArrayList<Particle>();

    void display()
    {
        // display each particle using Iterator -- this is equivalent to:
        //
        // for (int i=0; i<particles.size(); ++i)
        //     particles.get(i).display();

        for (Iterator<Particle> it = particles.iterator(); it.hasNext();)
            it.next().display();
    }

    void update()
    {
        // remove dead particles -- use Iterator::remove() to do this safely

        for (Iterator<Particle> it = particles.iterator(); it.hasNext();)
        {
            Particle p = it.next();
            if (p.lifetime == 0)
                it.remove();
        }

        // update each particle

        for (Iterator<Particle> it = particles.iterator(); it.hasNext();)
            it.next().update();
    }

    void create(float x, float y, int count)
    {
        for (int i=0; i<count; ++i)
        {
            particles.add(new Particle(x, y,                            // position
                                       random(-3, 3), random(-2, 2),    // velocity
                                       0, .1,                           // acceleration
                                       100));                           // lifetime
        }
    }
}


