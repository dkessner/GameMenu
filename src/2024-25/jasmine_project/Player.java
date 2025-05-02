import processing.core.*;

/** Represents the player
 * 
 * 
 * 
 */
public class Player {    
    private PApplet p;
    private PVector position, velocity, acceleration;
    private boolean isJumping;
    private PImage player;    
    private boolean shiftHeld;
    
    public Player(PApplet p, PVector position) {
        this.p = p;
        this.position = position;
        this.velocity = new PVector(0, 0);
        this.acceleration = new PVector(0, Constants.Physics.GRAVITY);
        this.isJumping = true;
        
        player = p.loadImage("player.PNG");
        player.resize((int) Constants.scaleX(160), 0);
    }
    
    public void display() {
        p.image(player, position.x, position.y);
    }
    
    public void update() {
        velocity.add(acceleration);
        position.add(velocity);
    }
    
    public boolean withinScreen() {
        return position.y <= p.height &&
            position.y + player.height >= 0 &&
            position.x <= p.width &&
            position.x + player.width >= 0;
    }
    
    public void jump() {
        if (!isJumping) {
            velocity.y = Constants.Physics.JUMP_FORCE;
            acceleration.y = Constants.Physics.GRAVITY;
            isJumping = true;
        }
    }
    
    public void resetToPlatform(Platform platform) {
        position.y = platform.getPosition().y - player.height + player.height / 14;
        //velocity.x = 0;
        acceleration.y = 0;
        isJumping = false;
    }
    
    public void moveWithPlatform() {
        velocity.x = -Project.scrollSpeed;
    }
    
    public void limitToPlatformBottom(Platform platform) {
        //velocity.x = 0;
        if (velocity.y < 0) {
            velocity.y = 0;
        }
    }
    
    public void playerKeyPressed() {
        if (p.key == ' ') {
            jump();
        }
        /*if (p.keyCode == p.SHIFT && !shiftHeld) {
            shiftHeld = true;
            Project.updateScrollSpeed(Project.scrollSpeed / 2);
        }*/
    }
    
    public void playerKeyReleased() {
        /*if (p.keyCode == p.SHIFT) {
            shiftHeld = false;
            Project.updateScrollSpeed(Project.scrollSpeed * 2);
        }*/
    }
    
    // Setters
    public void setVelocity(PVector vel) { velocity = vel; }
    
    // Accessors
    public PVector getPosition() { return position; }
    public PVector getVelocity() { return velocity; }
    public PVector getAcceleration() { return acceleration; }    
    public int getWidth() { return player.width; }
    public int getHeight() { return player.height; }
}