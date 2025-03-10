//
// ThreeTargetGame
//
// Darren Kessner
// Marlborough School
//


import processing.core.*;
import processing.sound.*;
import java.util.*;


public class ThreeTargetGame implements RockPaperScissors.Drawable
{
    public ThreeTargetGame(RockPaperScissors rockPaperScissors)
    {
        this.rockPaperScissors = rockPaperScissors;
        this.papplet = rockPaperScissors;

        this.thingWrangler = new ThingWrangler(papplet);

        players = new Player[2];
        players[0] = new Player(0, papplet.width/8, papplet.height/2);
        players[1] = new Player(1, 7*papplet.width/8, papplet.height/2);

        targets = new ArrayList<Target>();
        targets.add(new Target(papplet.width/2, papplet.height/4));
        targets.add(new Target(papplet.width/2, papplet.height/2));
        targets.add(new Target(papplet.width/2, 3*papplet.height/4));

        if (RockPaperScissors.soundEnabled)
        {
            soundLaser1 = new SoundFile(papplet, absolutePath("data/laser1.mp3"));
            soundLaser2 = new SoundFile(papplet, absolutePath("data/laser2.mp3"));
        }

        initialize();
    }

    public void initialize()
    {
        state = State.Begin;
        countDown = 3;
        countDownNext = papplet.millis() + 1000;
        thingWrangler.initialize();

        for (Target t : targets)
            t.thing = null;
    }

    public void update()
    {
        switch (state)
        {
            case Begin:
                updateBegin();
                return;
            case Game:
                updateGame();
                return;
            case End:
                updateEnd();
                return;
        }
    }

    private void updateBegin()
    {
        if (papplet.millis() > countDownNext)
        {
            if (countDown > 0)
            {
                countDown--;
                countDownNext = papplet.millis() + 1000;
            }
            else
            {
                state = State.Game;
            }
        }
    }

    private void updateEnd()
    {

    }

    private void updateGame()
    {
        // check for Thing-Target collisions

        List<Thing> things = thingWrangler.things();

        for (Target target : targets)
        for (Thing thing : things)
        {
            target.grab(thing);        
        }

        // update Things, including Thing-Thing collisions

        thingWrangler.update();
    }

    public void display()
    {
        switch (state)
        {
            case Begin:
                displayBegin();
                return;
            case Game:
                displayGame();
                return;
            case End:
                displayEnd();
                return;
        }
    }

    private void displayBegin()
    {
        papplet.background(0);
        papplet.textAlign(PApplet.CENTER, PApplet.CENTER);
        papplet.fill(0, 255, 0);
        papplet.text("ready?", papplet.width/2, papplet.height/3);
        papplet.text(countDown, papplet.width/2, 2*papplet.height/3);
    }

    String endText = "";
    int endTextColor;

    private void displayEnd()
    {
        // note: don't clear background
        papplet.textAlign(PApplet.CENTER, PApplet.CENTER);
        papplet.fill(endTextColor);
        papplet.text(endText, papplet.width/2, papplet.height/8);

        papplet.text("Press Enter to Play Again", papplet.width/2, papplet.height*7/8);
    }

    private void displayGame()
    {
        papplet.background(0); 

        for (Target target : targets)
            target.display();

        thingWrangler.display();

        for (Player player : players)
            player.display();

        // see if someone wins (hack: after final display)

        checkForWin();
    }

    public void keyPressed()
    {
        if (state == State.Game)
        {
            if (papplet.key == ' ')
                players[0].shoot(Thing.Type.Rock);
            else if (papplet.key == ',')
                players[0].shoot(Thing.Type.Paper);
            else if (papplet.key == '.')
                players[0].shoot(Thing.Type.Scissors);
            else if (papplet.key == '1')
                players[1].shoot(Thing.Type.Rock);
            else if (papplet.key == '2')
                players[1].shoot(Thing.Type.Paper);
            else if (papplet.key == '3')
                players[1].shoot(Thing.Type.Scissors);
            else if (papplet.keyCode == papplet.UP)
            {
                if (players[0].targetIndex > 0) players[0].targetIndex--;
            }
            else if (papplet.keyCode == papplet.DOWN)
            {
                if (players[0].targetIndex < targets.size()-1) players[0].targetIndex++;
            }
            else if (papplet.key == 'w')
            {
                if (players[1].targetIndex > 0) players[1].targetIndex--;
            }
            else if (papplet.key == 's')
            {
                if (players[1].targetIndex < targets.size()-1) players[1].targetIndex++;
            }
            else if (papplet.key == PApplet.ESC)
            {
                state = State.Begin;
            }
        }
        else if (state == State.Begin)
        {
            if (papplet.key == PApplet.ESC)
                rockPaperScissors.returnToMenu();
        }
        else if (state == State.End)
        {
            if (papplet.key == PApplet.ESC)
                rockPaperScissors.returnToMenu();
            else if (papplet.keyCode == PApplet.ENTER)
                initialize();
        }
    }

    // private data and methods

    private RockPaperScissors rockPaperScissors;
    private PApplet papplet;

    private enum State {Begin, Game, End}
    private State state;
    private int countDown;
    private int countDownNext;

    private ThingWrangler thingWrangler;

    private class Target
    {
        public Target(float x, float y)
        {
            this.position = new PVector(x, y);
        }

        public void display()
        {
            papplet.fill(0);
            papplet.stroke(0, 255, 0);
            papplet.strokeWeight(1);
            papplet.ellipse(position.x, position.y, radius*2, radius*2);
        }

        public void grab(Thing thing)
        {
            if (thing != this.thing &&
                thing.isAlive() &&
                position.dist(thing.position) < radius + thing.radius)
            {
                // stop the new thing when it is within the Target radius, but 
                // reposition close enough (within 2 radii) for collide() to work

                PVector offset = thing.position.copy();
                offset.sub(this.position);
                offset.setMag(thing.radius*2 - 1);
                offset.add(this.position);
                thing.position.set(offset);

                PVector originalVelocity = thing.velocity.copy();
                originalVelocity.normalize();
                thing.velocity.set(0, 0);

                if (this.thing == null || !this.thing.isAlive())
                {
                    // replace old thing with new thing

                    this.thing = thing;
                    this.thing.position.set(this.position);
                }
                else
                {
                    // check normal collision rules first

                    this.thing.collide(thing);

                    if (this.thing.isAlive() && thing.isAlive())
                    {
                        // one must die

                        if (thing.id == this.thing.id)
                        {
                            this.thing.die(Thing.DeathListener.Cause.FriendlyFire);
                            this.thing.velocity.set(originalVelocity);
                            this.thing = thing;
                            this.thing.position.set(this.position);
                        }
                        else
                        {
                            thing.die(Thing.DeathListener.Cause.Killed);
                        }
                    }
                }
            }
        }

        public PVector position;
        private static final float radius = 40;
        public Thing thing;
    }

    private ArrayList<Target> targets;

    private class Player
    {
        public Player(int id, float x, float y)
        {
            this.id = id;
            this.targetIndex = 1;
            this.position = new PVector(x, y);
            this.reloading = false;
        }

        public void display()
        {
            int intensity = reloading ? 128 : 255;
            if (this.id == 0) papplet.fill(0, 0, intensity); else papplet.fill(intensity, 0, 0);

            papplet.stroke(180);
            papplet.strokeWeight(2);
            papplet.ellipse(position.x, position.y, 50, 50);

            Target target = targets.get(targetIndex);

            papplet.stroke(180);
            papplet.strokeWeight(8);

            PVector end = target.position.copy();
            end.sub(position);
            end.setMag(40);
            end.add(position);
            papplet.line(position.x, position.y, end.x, end.y);

            if (reloading && papplet.millis() > doneReloadingTime)
                reloading = false;
        }

        public void shoot(Thing.Type type)
        {
            if (reloading) return;

            if (id == 0)
            {
                if (soundLaser1 != null)
                    soundLaser1.play();
            }
            else
            {
                if (soundLaser2 != null)
                    soundLaser2.play();
            }

            Target target = targets.get(targetIndex);

            thingWrangler.createThing(type, id, 20, 0, 
                    position.x, position.y,
                    (target.position.x-this.position.x)/30, (target.position.y-this.position.y)/30);

            reloading = true;
            doneReloadingTime = papplet.millis() + 500;
        }

        final private int id;
        private int targetIndex;
        private PVector position;
        private boolean reloading;
        private int doneReloadingTime;
    }

    Player[] players;

    private void checkForWin()
    {
        int[] scores = new int[2];
        for (Target t : targets)
            if (t.thing != null)
                scores[t.thing.id]++;

        if (scores[0] == 3)
        {
            endText = "Winner:  Player 1";
            endTextColor = papplet.color(0, 0, 255);
            state = State.End;
        }
        else if (scores[1] == 3)
        {
            endText = "Winner:  Player 2";
            endTextColor = papplet.color(255, 0, 0);
            state = State.End;
        }
    }

    private SoundFile soundLaser1;
    private SoundFile soundLaser2;

    private String absolutePath(String relativePath)
    {
        String path = System.getProperty("user.dir") + "/" + relativePath;
        return path;
    }
}


