import processing.core.*;
import java.util.*;

public class Level2 extends Level {    
    
    public Level2(PApplet p) {
        super(p);
    }
    
    @Override
    public void setup() {
        background = new Background(p);
        player = new Player(p, new PVector(p.width / 2, p.height / 6));
        collisionDetector = new CollisionDetector(p);
        end = new EndCheckpoint(p, new PVector(p.width / 5 + 9750, p.height * 2 / 3 + 130));
        
        platforms = new ArrayList<Platform>();
        platforms.add(new Platform(p, new PVector(p.width / 5, p.height / 3), 10, false));
        platforms.add(new Platform(p, new PVector(p.width / 5 + 1300, p.height / 3 + 60), 3, false));
        
        spikes = List.of(
            new Spike(p, new PVector(p.width / 5 + 1300, p.height * 2 / 3), 2)
        );
        
        messages = List.of(
            new Text(p, new PVector(p.width + 600, 450), "Press SPACE to jump", 48, true),
            new Text(p, new PVector(p.width + 2800, 250), "You can jump after falling!", 48, true),
            new Text(p, new PVector(p.width + 5000, 450), "Don't touch the spikes", 48, true)
        );
    }
}