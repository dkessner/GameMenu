import processing.core.*;

public class CollisionDetector {   
    PApplet p;
    
    public CollisionDetector(PApplet p) {
        this.p = p;
    }
    
    public boolean checkPlatformTop(Player player, Platform platform) {
        return player.getPosition().x + player.getWidth() > platform.getPosition().x &&
            player.getPosition().x < platform.getPosition().x + platform.getWidth() &&
            player.getPosition().y + player.getHeight() - player.getHeight() / 14 >= platform.getPosition().y &&
            player.getPosition().y + player.getHeight() - player.getHeight() / 14 <= platform.getPosition().y + 30
            /*player.getPosition().y < platform.getPosition().y + platform.getHeight()*/;
    }
    
    public boolean checkPlatformBottom(Player player, Platform platform) {
        return player.getPosition().x + player.getWidth() > platform.getPosition().x &&
            player.getPosition().x < platform.getPosition().x + platform.getWidth() &&
            player.getPosition().y > platform.getPosition().y - 30 &&
            player.getPosition().y < platform.getPosition().y;
    }
    
    public boolean checkPlatformLeft(Player player, Platform platform) {
        return player.getPosition().x + player.getWidth() > platform.getPosition().x &&
            player.getPosition().x + player.getWidth() < platform.getPosition().x + 30 &&
            player.getPosition().y + player.getHeight() - player.getHeight() / 14 > platform.getPosition().y + 30 &&
            player.getPosition().y <= platform.getPosition().y + 30;
    }
    
    public boolean checkSpike(Player player, Spike spike) {
        return player.getPosition().x + player.getWidth() >= spike.getPosition().x &&
            player.getPosition().x <= spike.getPosition().x + spike.getWidth() &&
            player.getPosition().y + player.getHeight() >= spike.getPosition().y &&
            player.getPosition().y <= spike.getPosition().y - spike.getHeight();
    }
    
    public boolean checkEndpoint(Player player, EndCheckpoint end) {
        return player.getPosition().x + player.getWidth() >= end.getPosition().x &&
            player.getPosition().x <= end.getPosition().x + end.getWidth() &&
            player.getPosition().y + player.getHeight() >= end.getPosition().y &&
            player.getPosition().y <= end.getPosition().y - end.getHeight();
    }
}