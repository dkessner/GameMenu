import processing.sound.*;

class Sound {

  SoundFile startTone;
  SoundFile endGame;
  SoundFile dud;
  SoundFile detonate;
  SoundFile explosion;
  SoundFile launch;

  Sound(PApplet p) {
    dud = new SoundFile(p, "hit.wav");
    startTone = new SoundFile(p, "startTone.wav");
    endGame = new SoundFile(p, "endGame.wav");
    detonate = new SoundFile(p, "Explosion29.wav");
    explosion = new SoundFile(p, "Explosion37.wav");
    launch = new SoundFile(p, "missileLaunch.wav");
  }
}