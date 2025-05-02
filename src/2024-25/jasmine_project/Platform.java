import processing.core.*;
import java.util.*;

/**
 *  Represents a platform consisting of multiple blocks.
 *  - Blocks alternate between two base designs
 *  - Blocks have randomly selected pattern designs.
 *  - Platform moves continuously to the left.
 */
public class Platform {    
    private PApplet p;
    private PVector position;
    private int numBlocks;
    private int borderWidth;
    private boolean moves;
    private int frameCount;
    private PImage jumpIndicator;
    private PImage fallIndicator;
    private PImage[] baseBlocks;
    private PImage[] patternBlocks;
    private int[] selectedPatterns;
    private ArrayList<Integer> jumpPositions;
    private ArrayList<Integer> fallPositions;
    
    public Platform(PApplet p, PVector position, int numBlocks, int[] jumpPositions, int[] fallPositions) {
        this.p = p;
        this.position = position;
        this.numBlocks = numBlocks;
        this.borderWidth = (int) (Constants.Size.BLOCK_WIDTH / 16.76923);
        this.moves = false;
        
        this.jumpPositions = new ArrayList<Integer>();
        for (int pos: jumpPositions) this.jumpPositions.add(pos - 1);
        
        this.fallPositions = new ArrayList<Integer>();
        for (int pos: fallPositions) this.fallPositions.add(pos - 1);
        
        jumpIndicator = loadAndResize("jump-indicator.PNG", Constants.Size.BLOCK_WIDTH, 0);
        fallIndicator = loadAndResize("fall-indicator.PNG", Constants.Size.BLOCK_WIDTH, 0);
        
        // Load alternating block designs
        baseBlocks = new PImage[] {
            loadAndResize("block-base-1.PNG", Constants.Size.BLOCK_WIDTH, 0),
            loadAndResize("block-base-2.PNG", Constants.Size.BLOCK_WIDTH, 0),
        };
        
        // Load pattern designs
        patternBlocks = new PImage[13];
        for (int i = 0; i < patternBlocks.length; i++) {
            patternBlocks[i] = loadAndResize("pattern-" + (i + 1) + ".PNG", Constants.Size.BLOCK_WIDTH, 0);
        }
        
        // Randomize patterns for each block
        selectedPatterns = new int[numBlocks];        
        for (int i = 0; i < numBlocks; i++) {
            // 50% chance of no pattern, otherwise randomly select
            selectedPatterns[i] = (p.random(1) < 0.5) ? -1: (int) p.random(patternBlocks.length);
        }
    }
    
    public Platform(PApplet p, PVector position, int numBlocks, boolean moves) {
        this.p = p;
        this.position = position;
        this.numBlocks = numBlocks;
        this.borderWidth = (int) (Constants.Size.BLOCK_WIDTH / 16.76923);
        this.moves = moves;
        this.frameCount = 0;
        
        // Load alternating block designs
        baseBlocks = new PImage[] {
            loadAndResize("block-base-1.PNG", Constants.Size.BLOCK_WIDTH, 0),
            loadAndResize("block-base-2.PNG", Constants.Size.BLOCK_WIDTH, 0),
        };
        
        // Load pattern designs
        patternBlocks = new PImage[13];
        for (int i = 0; i < patternBlocks.length; i++) {
            patternBlocks[i] = loadAndResize("pattern-" + (i + 1) + ".PNG", Constants.Size.BLOCK_WIDTH, 0);
        }
        
        // Randomize patterns for each block
        selectedPatterns = new int[numBlocks];        
        for (int i = 0; i < numBlocks; i++) {
            // 50% chance of no pattern, otherwise randomly select
            selectedPatterns[i] = (p.random(1) < 0.5) ? -1: (int) p.random(patternBlocks.length);
        }
    }
    
    public void display() {
        for (int i = 0; i < numBlocks; i++) {
            float displayX = position.x + i * (baseBlocks[0].width - borderWidth);
            
            if (displayX > p.width) break;
            
            if (jumpPositions != null && jumpPositions.contains(i)) {
                p.image(jumpIndicator, displayX, position.y);
            } else if (fallPositions != null && fallPositions.contains(i)) {
                p.image(fallIndicator, displayX, position.y);
            } else {
                // Alternate between the block types
                p.image(baseBlocks[i % baseBlocks.length], displayX, position.y);
                if (selectedPatterns[i] != -1) {
                    p.image(patternBlocks[selectedPatterns[i]], displayX, position.y);
                }
            }
        }
        
        p.rectMode(p.CORNER);
        p.fill(p.color(22, 4, 32));
        p.noStroke();
        p.rect(position.x, position.y + baseBlocks[0].height / 2, Constants.Size.BLOCK_WIDTH / 16, baseBlocks[0].height / 2);
    }
    
    public boolean onScreen() {
        return position.x + numBlocks * (Constants.Size.BLOCK_WIDTH - borderWidth) + borderWidth >= 0;
    }
    
    public void update() {
        position.x -= Project.scrollSpeed;
        
        if (moves && frameCount >= 100) {
            frameCount = 0;
        } else if (moves && frameCount < 50) {
            position.y += 3;
            frameCount++;
        } else if (moves && frameCount >= 50) {
            position.y -= 3;
            frameCount++;
        }
    }
    
    private PImage loadAndResize(String filename, int newWidth, int newHeight) {
        PImage img = p.loadImage(filename);
        img.resize(newWidth, newHeight);
        return img;
    }
    
    // Accessors
    public PVector getPosition() { return position; }
    public int getNumBlocks() { return numBlocks; }
    public int getWidth() { return numBlocks * (Constants.Size.BLOCK_WIDTH - borderWidth) + borderWidth; }
    public int getHeight() { return baseBlocks[0].height; }
}