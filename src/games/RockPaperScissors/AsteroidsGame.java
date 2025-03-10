//
// AsteroidsGame
//
// Darren Kessner
// Marlborough School
//


import processing.core.*;
import processing.sound.*;
import java.util.*;


class AsteroidsGame implements RockPaperScissors.Drawable, Thing.DeathListener
{
    public AsteroidsGame(RockPaperScissors rockPaperScissors)
    {
        this.rockPaperScissors = rockPaperScissors; // for returnToMenu()
        this.papplet = rockPaperScissors;           // for PApplet functions

        thingWrangler = new ThingWrangler(papplet);
        player = new Player();
        highScore = new HighScore(papplet, 
                System.getProperty("user.home") + "/VideoGameCabinetData/HighScore_RockPaperScissorsAsteroids.txt");
    }

    public void initialize()
    {
        Thing.borderBehavior = Thing.BorderBehavior.Wrap;
        Thing.killSame = true;
        Thing.registerDeathListener(this);

        score = 0;
        thingWrangler.initialize();
        player.initialize();
    }

    public void update()
    {
        player.update();
        thingWrangler.update();

        // periodically create a random Thing

        if (papplet.frameCount % 100 == 0)
        {

            Thing.Type type = Thing.randomType();
            int radius = random.nextInt(50) + 30;
            PVector position = new PVector(-radius, -radius);
            PVector velocity = PVector.random2D();
            velocity.setMag(random.nextFloat()*2 + 1);

            thingWrangler.createThing(type, 1, radius, 0, position, velocity);
        }

        if (player.alive)
            checkPlayerThingCollisions();
        else if (!highScore.isShowing())
            initialize();
    }

    public void display()
    {
        papplet.background(0);
        thingWrangler.display();

        papplet.fill(255);
        papplet.text(score, papplet.width-100, 100);

        if (player.alive)
        {
            player.display();
        }
        else if (highScore.isShowing())
        {
            highScore.display();
        }
    }

    public void keyPressed()
    {
        if (player.alive)
            player.keyPressed();
        else if (highScore.isShowing())
            highScore.keyPressed();
    }

    public void keyReleased()
    {
        player.keyReleased();
    }

    public void notifyNextOfKin(Thing deadThing, Thing.DeathListener.Cause cause)
    {
        if (player.alive && cause == Thing.DeathListener.Cause.Killed)
        {
            final int points = 100;

            if (deadThing.id == 1)
                score += points;
            else
                score -= points;
        }
    }


    // private data and methods

    static private Random random = new Random();

    private RockPaperScissors rockPaperScissors;
    private PApplet papplet;

    private ThingWrangler thingWrangler;
    private Player player;

    private int score;
    private HighScore highScore;

    private class Player implements RockPaperScissors.Drawable
    {
        public Player()
        {
            rocket = papplet.loadImage("data/rocket_no_thrust_small.png");
            rocketForward = papplet.loadImage("data/rocket_small.png");

            if (RockPaperScissors.soundEnabled)
            {
                thrustSound = new SoundFile(papplet, 
                    System.getProperty("user.dir") + "/data/thrust2.mp3");
                laserSound = new SoundFile(papplet, 
                    System.getProperty("user.dir") + "/data/laser1.mp3");
            }

            initialize();
        }

        public void initialize()
        {
            position = new PVector(papplet.width/2, papplet.height/2);
            velocity = new PVector(0, 0);
            heading = new PVector(0, -1);
            radius = papplet.width/40f;
            alive = true;
        }

        public void update()
        {
            position.add(velocity);

            // wrap around

            if (position.x < 0 - radius) position.x += papplet.width + 2*radius;
            else if (position.x > papplet.width + radius) position.x -= papplet.width + 2*radius;
            else if (position.y < 0 - radius) position.y += papplet.height + 2*radius;
            else if (position.y > papplet.height + radius) position.y -= papplet.height + 2*radius;

            if (forward)
            {
                velocity.add(heading.copy().setMag(.1f));
            }
            else if (reverse)
            {
                if (velocity.mag() < .1f)
                    velocity.setMag(0);
                else
                    velocity.setMag(velocity.mag() - .1f);
            }
            else if (left)
            {
                heading.rotate(-PApplet.PI/40);
            }
            else if (right)
            {
                heading.rotate(PApplet.PI/40);
            }
        }

        public void display()
        {
            if (rocket != null && rocketForward != null)
            {
                papplet.imageMode(PApplet.CENTER);

                papplet.pushMatrix();
                papplet.translate(position.x, position.y);
                papplet.rotate(heading.heading() + PApplet.PI/2);

                if (forward)
                    papplet.image(rocketForward, 0, 0);
                else
                    papplet.image(rocket, 0, 0);

                papplet.popMatrix();
            }
            else
            {
                // circle body

                papplet.fill(0, 0, 255);
                papplet.strokeWeight(5);
                papplet.stroke(128);
                papplet.ellipse(position.x, position.y, radius*2f, radius*2f);

                // cannon

                papplet.strokeWeight(15);
                PVector end = position.copy();
                end.add(heading.copy().setMag(radius * 1.3f));
                papplet.line(position.x, position.y, end.x, end.y);
            }
        }

        public void keyPressed()
        {
            if (alive)
            {
                // movement

                if (papplet.keyCode == PApplet.UP)
                {
                    forward = true;
                    if (thrustSound != null)
                        thrustSound.loop();
                }
                else if (papplet.keyCode == PApplet.DOWN)
                {
                    reverse = true;
                }
                else if (papplet.keyCode == PApplet.LEFT)
                {
                    left = true;
                }
                else if (papplet.keyCode == PApplet.RIGHT)
                {
                    right = true;
                }

                // shooting

                else if (papplet.key == ' ')
                {
                    thingWrangler.createThing(Thing.Type.Rock, 0, projectileRadius, 3000,
                        calculateThingPosition(), calculateThingVelocity());

                    if (laserSound != null)
                        laserSound.play();
                }
                else if (papplet.key == ',')
                {
                    thingWrangler.createThing(Thing.Type.Paper, 0, projectileRadius, 3000,
                        calculateThingPosition(), calculateThingVelocity());

                    if (laserSound != null)
                        laserSound.play();
                }
                else if (papplet.key == '.')
                {
                    thingWrangler.createThing(Thing.Type.Scissors, 0, projectileRadius, 3000,
                        calculateThingPosition(), calculateThingVelocity());
                    if (laserSound != null)
                        laserSound.play();
                }
            }
        }

        public void keyReleased()
        {
            if (papplet.keyCode == PApplet.UP)
            {
                forward = false;
                if (thrustSound != null)
                    thrustSound.stop();
            }
            else if (papplet.keyCode == PApplet.DOWN)
            {
                reverse = false;
            }
            else if (papplet.keyCode == PApplet.LEFT)
            {
                left = false;
            }
            else if (papplet.keyCode == PApplet.RIGHT)
            {
                right = false;
            }
        }

        private PVector calculateThingPosition()
        {
            PVector thingPosition = heading.copy();
            thingPosition.setMag(player.radius + projectileRadius + 1);
            thingPosition.add(position);
            return thingPosition; 
        }

        private PVector calculateThingVelocity()
        {
            PVector thingVelocity = heading.copy();
            thingVelocity.setMag(10);
            thingVelocity.add(velocity);
            return thingVelocity;
        }

        private PVector position;
        private PVector velocity;
        private PVector heading;
        private float radius;
        private boolean alive;
        private PImage rocket;
        private PImage rocketForward;
        private SoundFile thrustSound;
        private SoundFile laserSound;

        private static final float projectileRadius = 20;

        private boolean forward;
        private boolean reverse;
        private boolean left;
        private boolean right;
    }

    private void checkPlayerThingCollisions()
    {
        for (Thing thing : thingWrangler.things())
        {
            if (thing.isAlive() && 
                player.position.dist(thing.position) < player.radius + thing.radius)
            {
                // player dies

                player.alive = false;

                // hack an explosion: create a Thing with lifetime == 1
                thingWrangler.createThing(Thing.Type.Rock, 0, 100, 1, player.position, player.velocity);

                // show the high score screen
                highScore.show(score);

                break;
            }
        }
    }
}
 
