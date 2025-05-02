import processing.core.*;

public class Constants {
    
    private static PApplet p;
    
    public static void setPApplet(PApplet applet) { p = applet; }
    
    public static class Screen {
        public static final float BASE_WIDTH = 1920;
        public static final float BASE_HEIGHT = 1080;
    }
    
    public static class Physics {
        public static final float GRAVITY = 0.8f;
        public static final float JUMP_FORCE = -16f;
        public static final float SCROLL_SPEED = 10;
    }
    
    public static class Size {
        public static final int BLOCK_WIDTH = (int) scaleX(125);
        public static final int SPIKE_WIDTH = (int) scaleY(56);
    }
    
    public static float scaleX(float x) {
        return x * ((float) p.width / Screen.BASE_WIDTH);
    }

    public static float scaleY(float y) {
        return y * ((float) p.height / Screen.BASE_HEIGHT);
    }
}