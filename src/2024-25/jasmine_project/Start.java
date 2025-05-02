import processing.core.*;

public class Start {
    private PApplet p;
    private PImage startScreen;
    
    public Start(PApplet p) {
        this.p = p;
        startScreen = p.loadImage("start-screen.PNG");
        startScreen.resize(0, p.height);
    }
    
    public void display() {
        p.image(startScreen, 0, 0);
    }
}