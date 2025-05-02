import processing.core.*;

public class Background {
    private PApplet p;
    private PImage[] layers;
    private float[] xPositions;
    private float[] speeds;
    private boolean newSpeedSet;
    
    public Background(PApplet p) {
        this.p = p;
        newSpeedSet = false;
        
        layers = new PImage[] {
            p.loadImage("background.PNG"),
            p.loadImage("buildings-back.PNG"),
            p.loadImage("buildings-mid.PNG"),
            p.loadImage("buildings-front.PNG"),
            p.loadImage("hangings-back.PNG"),
            p.loadImage("hangings-front.PNG")
        };
            
        for (int i = 0; i < layers.length; i++) {
            layers[i].resize(0, p.height);
        }
        
        xPositions = new float[layers.length];
        speeds = new float[] {
            Project.scrollSpeed * 0.2f,
            Project.scrollSpeed * 0.4f,
            Project.scrollSpeed * 0.6f, Project.scrollSpeed * 0.8f,
            Project.scrollSpeed * 0.9f, Project.scrollSpeed
        };
    }
    
    public void display() {
        for (int i = 0; i < layers.length; i++) {
            p.image(layers[i], xPositions[i], 0);
            p.image(layers[i], xPositions[i] + layers[i].width, 0);
        }
    }
    
    public void update() {
        for (int i = 0; i < layers.length; i++) {
            xPositions[i] -= speeds[i];
            if (xPositions[i] <= -layers[i].width) {
                xPositions[i] = 0;
            }
        }
    }
    
    public void backgroundKeyPressed() {
        /*if (p.keyCode == p.SHIFT && !newSpeedSet) {
            speeds = new float[] {
                Project.scrollSpeed * 0.2f,
                Project.scrollSpeed * 0.4f,
                Project.scrollSpeed * 0.6f, Project.scrollSpeed * 0.8f,
                Project.scrollSpeed * 0.9f, Project.scrollSpeed
            };
            newSpeedSet = true;
        }*/
    }
    
    public void backgroundKeyReleased() {
        /*if (newSpeedSet) {
            speeds = new float[] {
                Project.scrollSpeed * 0.2f,
                Project.scrollSpeed * 0.4f,
                Project.scrollSpeed * 0.6f, Project.scrollSpeed * 0.8f,
                Project.scrollSpeed * 0.9f, Project.scrollSpeed
            };
        }
        newSpeedSet = false;*/
    }
}