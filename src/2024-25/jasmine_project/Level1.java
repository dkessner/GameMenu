import processing.core.*;
import java.util.*;

public class Level1 extends Level {    
    
    public Level1(PApplet p) {
        super(p);
    }
    
    @Override
    public void setup() {
        background = new Background(p);
        player = new Player(p, new PVector(p.width / 2, p.height / 3));
        collisionDetector = new CollisionDetector(p);
        end = new EndCheckpoint(p, new PVector(scaleX(20200), scaleY(750)));
        
        platforms = new ArrayList<Platform>();
        
        platforms.add(new Platform(p, new PVector(scaleX(384), scaleY(720)), 25, new int[]{25}, new int[0]));
        platforms.add(new Platform(p, new PVector(scaleX(3509), scaleY(620)), 3, false));
        platforms.add(new Platform(p, new PVector(scaleX(4071), scaleY(720)), 5, new int[]{5}, new int[0]));
        platforms.add(new Platform(p, new PVector(scaleX(4821), scaleY(620)), 3, new int[]{3}, new int[0]));
        platforms.add(new Platform(p, new PVector(scaleX(5321), scaleY(520)), 3, new int[0], new int[]{3}));
        platforms.add(new Platform(p, new PVector(scaleX(6259), scaleY(520)), 3, new int[]{1}, new int[0]));
        platforms.add(new Platform(p, new PVector(scaleX(6759), scaleY(620)), 3, false));
        platforms.add(new Platform(p, new PVector(scaleX(7259), scaleY(720)), 25, false));
        platforms.add(new Platform(p, new PVector(scaleX(10509), scaleY(800)), 5, false));
        platforms.add(new Platform(p, new PVector(scaleX(11321), scaleY(720)), 7, false));
        platforms.add(new Platform(p, new PVector(scaleX(12321), scaleY(880)), 8, false));
        platforms.add(new Platform(p, new PVector(scaleX(13421), scaleY(700)), 5, true));
        platforms.add(new Platform(p, new PVector(scaleX(14121), scaleY(600)), 5, false));
        platforms.add(new Platform(p, new PVector(scaleX(15000), scaleY(400)), 17, false));
        platforms.add(new Platform(p, new PVector(scaleX(15000), scaleY(800)), 17, false));
        platforms.add(new Platform(p, new PVector(scaleX(17400), scaleY(700)), 5, false));
        platforms.add(new Platform(p, new PVector(scaleX(18300), scaleY(600)), 5, true));
        platforms.add(new Platform(p, new PVector(scaleX(19000), scaleY(450)), 5, true));
        platforms.add(new Platform(p, new PVector(scaleX(19000), scaleY(800)), 15, false));
        
        spikes = List.of(
            new Spike(p, new PVector(scaleX(8384), scaleY(720)), 2),
            new Spike(p, new PVector(scaleX(8884), scaleY(720)), 3),
            new Spike(p, new PVector(scaleX(9509), scaleY(720)), 4),
            new Spike(p, new PVector(scaleX(11920), scaleY(720)), 3),
            new Spike(p, new PVector(scaleX(15600), scaleY(400)), 4),
            new Spike(p, new PVector(scaleX(16300), scaleY(400)), 4),
            new Spike(p, new PVector(scaleX(15600), scaleY(800)), 1),
            new Spike(p, new PVector(scaleX(16100), scaleY(800)), 1),
            new Spike(p, new PVector(scaleX(16600), scaleY(800)), 1),
            new Spike(p, new PVector(scaleX(19400), scaleY(800)), 2)
        );
        
        messages = List.of(
            new Text(p, new PVector(scaleX(2670), scaleY(560)), "Press SPACE to jump", 48, true),
            new Text(p, new PVector(scaleX(5670), scaleY(380)), "You can jump after falling!", 48, true),
            new Text(p, new PVector(scaleX(8170), scaleY(540)), "Don't touch the spikes", 48, true),
            new Text(p, new PVector(scaleX(12200), scaleY(780)), "Careful! There are moving platforms!", 48, true),
            new Text(p, new PVector(scaleX(14100), scaleY(500)), "Which way will you go?", 48, true),
            new Text(p, new PVector(scaleX(19600), scaleY(700)), "Touch the end checkpoint", 48, true)
        );
    }
    
    private float scaleX(float n) {
        return Constants.scaleX(n);
    }
    
    private float scaleY(float n) {
        return Constants.scaleY(n);
    }
}