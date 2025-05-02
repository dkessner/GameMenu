import processing.core.*;

public class EndCheckpoint {
    private PApplet p;
    private PVector position;
    private PImage endpointImg;
    
    public EndCheckpoint(PApplet p, PVector position) {
        this.p = p;
        this.position = position;
        endpointImg = p.loadImage("energy.PNG");
        endpointImg.resize((int) Constants.scaleX(120), 0);
    }
    
    public void display() {
        p.fill(255);
        p.image(endpointImg, position.x, position.y);
    }
    
    public void update() {
        position.x -= Project.scrollSpeed;
    }
    
    public PVector getPosition() { return position; }
    public int getWidth() { return 50; }
    public int getHeight() { return 50; }
}