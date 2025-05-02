import processing.core.*;

public class EndScene {
    private PApplet p;
    private boolean levelPassed;
    
    public EndScene(PApplet p, boolean levelPassed) {
        this.p = p;
        this.levelPassed = levelPassed;
    }
    
    public void display() {
        if (levelPassed) {
            p.background(0);
            p.fill(255);
            p.textSize(30);
            p.text("YOU WON!", p.width / 2, p.height / 2);
            //p.text("Press SPACE to go to next level", p.width / 2, p.height / 2 + 30);
            p.text("Press ENTER to restart level", p.width / 2, p.height / 2 + 60);
            p.text("Press PERIOD to return to menu", p.width / 2, p.height / 2 + 90);
        } else {
            p.background(0);
            p.fill(255);
            p.textAlign(p.CENTER, p.CENTER);
            p.textSize(50);
            p.text("GAME OVER", p.width / 2, p.height / 2);
            p.text("Press ENTER to restart level", p.width / 2, p.height / 2 + 70);
            p.text("Press PERIOD to return to menu", p.width / 2, p.height / 2 + 140);
            p.text("It might take a while to load...", p.width / 2, p.height / 2 + 210);
        }
    }
}