
import ddf.minim.*;
Minim minim;
AudioPlayer bells;
AudioPlayer shot;
AudioPlayer punch;

void playBells() {
  bells.rewind();
  bells.play();
}

void playShot() {
   shot.rewind();
   shot.play();
}

void playPunch() {
   punch.rewind();
   punch.play();
}

void soundSetup() {
  minim = new Minim(this);
  bells = minim.loadFile("bells.wav");
  punch = minim.loadFile("Punch.mp3"); 
  shot = minim.loadFile("Shot.mp3");
  shot.setVolume(0.05);
  punch.setVolume(0.4);
}
