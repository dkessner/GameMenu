//
// Thing
//
// Darren Kessner
// Marlborough School
//


import processing.core.*;
import processing.sound.*;
import java.util.*;


public class Thing implements RockPaperScissors.Drawable
{
    public enum Type {Rock, Paper, Scissors}

    public static Type randomType()
    {
        int value = random.nextInt(3);
        switch (value) 
        {
            case 0: return Type.Rock;
            case 1: return Type.Paper;
            case 2: return Type.Scissors;
            default: throw new RuntimeException("This isn't happening.");
        }
    }

    public static enum BorderBehavior {Die, Wrap, Bounce};
    public static BorderBehavior borderBehavior = BorderBehavior.Die;
    public static boolean killSame = false;

    public Thing(PApplet papplet, Type type, int id, float radius, int lifetime,
                 float x, float y, float vx, float vy)
    {
        this.papplet = papplet;
        this.type = type;
        this.id = id;
        this.radius = radius;

        this.timeToDie = (lifetime != 0 ? (papplet.millis() + lifetime) : 0);

        this.position = new PVector(x, y);
        this.velocity = new PVector(vx, vy);

        this.state = State.Alive;

        if (rockImage == null)
            loadImages();

        if (type == Type.Rock) myImage = rockImage;
        else if (type == Type.Paper) myImage = paperImage;
        else if (type == Type.Scissors) myImage = scissorsImage;
    }

    public void update()
    {
        // move 

        position.add(velocity);

        // border behavior

        if (borderBehavior == BorderBehavior.Die)
        {
            if (position.x <= radius || position.x >= papplet.width-radius ||
                position.y <= radius || position.y >= papplet.height-radius)
            {
                dieNow(DeathListener.Cause.Natural);
            }
        }
        else if (borderBehavior == BorderBehavior.Bounce)
        {
            if (position.x <= radius || position.x >= papplet.width-radius)
                velocity.x *= -1;

            if (position.y <= radius || position.y >= papplet.height-radius)
                velocity.y *= -1;
        }
        else if (borderBehavior == BorderBehavior.Wrap)
        {
            if (position.x < 0 - radius) position.x += papplet.width + 2*radius;
            else if (position.x > papplet.width + radius) position.x -= papplet.width + 2*radius;
            else if (position.y < 0 - radius) position.y += papplet.height + 2*radius;
            else if (position.y > papplet.height + radius) position.y -= papplet.height + 2*radius;
        }
        else
        {
            throw new RuntimeException("[Thing::update()]  This isn't happening.");
        }

        // transition Alive -> Dying

        if (state == State.Alive && timeToDie > 0 && papplet.millis() > timeToDie)
        {
            die(DeathListener.Cause.Natural);
        }

        // transition Dying -> Dead

        if (state == State.Dying && papplet.millis() > timeOfDeath + explosionDuration)
            state = State.Dead;
    }

    public void display()
    {
        if (state == State.Alive)
            displayAlive();
        else if (state == State.Dying)
            displayDying();
    }

    public boolean isAlive()
    {
        return state == State.Alive;
    }

    public boolean isDead()
    {
        return state == State.Dead;
    }

    public void collide(Thing that)
    {
        if (this.state == State.Alive && that.state == State.Alive &&
            this.position.dist(that.position) < this.radius + that.radius)
        {
            // always bounce

            PVector temp = this.velocity;
            this.velocity = that.velocity;
            that.velocity = temp;

            // check rock-paper-scissors rules

            Thing markedForDeath = null;

            if (killSame || (this.id != that.id))
            {
                if ((this.type == Type.Rock && that.type == Type.Paper) ||
                    (this.type == Type.Paper && that.type == Type.Scissors) ||
                    (this.type == Type.Scissors && that.type == Type.Rock))
                    markedForDeath = this;

                else if ((this.type == Type.Paper && that.type == Type.Rock) ||
                    (this.type == Type.Scissors && that.type == Type.Paper) ||
                    (this.type == Type.Rock && that.type == Type.Scissors) )
                    markedForDeath = that;
            }

            if (markedForDeath != null)
            {
                markedForDeath.die(this.id == that.id ? DeathListener.Cause.FriendlyFire : 
                        DeathListener.Cause.Killed);
            }
        }
    }

    public void die(DeathListener.Cause cause)
    {
        state = State.Dying;
        timeOfDeath = papplet.millis();

        if (explosionSound != null)
        {
            explosionSound.stop();
            explosionSound.play();
        }

        if (deathListener != null)
            deathListener.notifyNextOfKin(this, cause);
    }

    public void dieNow(DeathListener.Cause cause)
    {
        state = State.Dead; 

        if (deathListener != null)
            deathListener.notifyNextOfKin(this, cause);
    }

    public interface DeathListener
    {
        public enum Cause {Killed, FriendlyFire, Natural};
        public void notifyNextOfKin(Thing deadThing, Cause cause);
    }

    public static void registerDeathListener(DeathListener deathListener)
    {
        Thing.deathListener = deathListener;
    }


    // private methods and data

    private static DeathListener deathListener;
    private static Random random = new Random();

    private PApplet papplet;
    public final Type type;
    public final int id;
    public float radius;

    public PVector position;
    public PVector velocity;

    private PImage myImage;

    private enum State {Alive, Dying, Dead}
    private State state;
    private int timeToDie;
    private int timeOfDeath;

    static private PImage rockImage;
    static private PImage paperImage;
    static private PImage scissorsImage;
    static private PImage[] explosionImages;

    static private SoundFile explosionSound;

    static final private int explosionDuration = 3000;

    private void loadImages()
    {
        try
        {
            rockImage = papplet.loadImage("data/rock.png");
            paperImage = papplet.loadImage("data/paper.png");
            scissorsImage = papplet.loadImage("data/scissors.png");

            explosionImages = new PImage[8];
            for (int i=0; i<explosionImages.length; i++)
                explosionImages[i] = papplet.loadImage("data/explode" + i + ".png");

            if (RockPaperScissors.soundEnabled)
                explosionSound = new SoundFile(papplet, 
                    System.getProperty("user.dir") + "/data/torpedo_impact.mp3");
        }
        catch (Exception e)
        {
            System.out.println("Caught exception.");
            System.out.println(e.getMessage());
        }
    }

    private void displayAlive()
    { 
        if (myImage != null)
        {
            papplet.fill(0);
            if (id == 0) papplet.stroke(0, 0, 255); else papplet.stroke(255, 0, 0);
            papplet.strokeWeight(5);
            papplet.ellipse(position.x, position.y, radius*2, radius*2);

            papplet.imageMode(papplet.CENTER);
            papplet.image(myImage, position.x, position.y, radius*1.4f, radius*1.4f);
        }
        else
        {
            papplet.fill(0, 0, 255);
            papplet.ellipse(position.x, position.y, radius*2, radius*2);
        }
    }

    private void displayDying()
    { 
        if (explosionImages != null)
        {
            int explosionIndex = (int)papplet.map(papplet.millis(), 
                    timeOfDeath, timeOfDeath + explosionDuration,
                    0, explosionImages.length);

            if (explosionIndex < explosionImages.length)
            {
                papplet.imageMode(papplet.CENTER);
                papplet.image(explosionImages[explosionIndex], position.x, position.y, radius*2, radius*2);
            }
        }
        else
        {
            papplet.fill(0, 0, 255);
            papplet.ellipse(position.x, position.y, radius*2, radius*2);
        }
    }
}


