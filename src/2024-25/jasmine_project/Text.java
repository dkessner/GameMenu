import processing.core.*;

public class Text {
    private PApplet p;
    private PVector position;
    private PFont pixelifySans;
    private String message, displayText = "";
    private int inDuration;
    private int frameStart;
    private int size, borderThickness;
    private boolean border;
    private int[] colors; // TODO: change
    
    public Text(PApplet p, PVector position, String message, int size, boolean border) {
        this.p = p;
        this.position = position;
        this.message = message;
        this.inDuration = 40;
        this.frameStart = -1;
        this.size = size;
        this.borderThickness = size / 15;
        this.border = border;
        
        colors = new int[] {
            p.color(203, 64, 122), 
            p.color(0, 179, 215), 
            p.color(255, 198, 221), 
            p.color(194, 243, 253)
        };
        
        pixelifySans = p.createFont("Pixelify_Sans/PixelifySans-VariableFont_wght.ttf", 60);
        p.textFont(pixelifySans);
        
        p.textAlign(p.LEFT, p.BASELINE);
    }
    
    public void display() {
        int elapsedTime = p.frameCount - frameStart;
        
        if (position.x <= p.width && frameStart != -1) {
            displayText = (elapsedTime < inDuration) ? getGlitchedText(elapsedTime) : message;
            drawGlitchedText(displayText, elapsedTime);
        }
    }
    
    public void update() {
        if (position.x <= p.width + 10 && frameStart == -1) {
            frameStart = p.frameCount;
        }
        position.x -= Project.scrollSpeed;
    }
    
    public String getGlitchedText(int progress) {
        String result = "";
        
        for (int i = 0; i < message.length(); i++) {
            // Original letters revealed gradually over time
            if (p.random(1) < 0.3 || i > message.length() * progress / inDuration) {
                result += message.charAt(i);
            } else {
                result += (char) (int) p.random(63, 122);
            }
        }
        return result;
    }
    
    public void drawGlitchedText(String msg /*TODO*/, int progress) {        
        float shakeForce = p.random(-size / 4, size / 4);
        int flickerColor = colors[(int) p.random(4)];
        
        // Draw the outline by offsetting
        if (border) {
            drawTextBorder(msg);
        }
        
        p.fill(flickerColor);
        p.textSize(size);
        
        if (progress < inDuration) {
            if (p.random(progress / 5) <= 1) {
                p.text(msg, position.x + shakeForce, position.y - shakeForce);
            }
            if (p.random(progress / 5) <= 1) {
                p.text(msg, position.x - shakeForce, position.y + shakeForce);
            }
        } else {
            if (p.random(60) <= 1) {
                p.text(msg, position.x + shakeForce, position.y - shakeForce);
            }
            if (p.random(60) <= 1) {
                p.text(msg, position.x - shakeForce, position.y + shakeForce);
            }
        }
        
        // Draw normal text
        p.fill(p.color(183, 235, 241));
        p.text(msg, position.x, position.y);
    }
    
    private void drawTextBorder(String msg) {
        p.fill(p.color(22, 4, 32));
        for (int dx = -borderThickness; dx <= borderThickness; dx++) {
            for (int dy = -borderThickness; dy <= borderThickness; dy++) {
                if (dx != 0 || dy != 0) {  // Avoid drawing at (0,0) to prevent overlapping
                    p.text(msg, position.x + dx, position.y + dy);
                }
            }
        }
    }
}