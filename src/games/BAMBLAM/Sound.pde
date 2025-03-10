import processing.sound.*;

class Sound {

  SoundFile startTone;
  SoundFile endGame;
  SoundFile gameMusic;
  SoundFile endMusic;
  SoundFile enemyHit;
  SoundFile shoot;
  SoundFile caught;

  Sound(PApplet p) {
    //music by Eric Skiff
    gameMusic = new SoundFile(p, "anightofdizzyspells.mp3");
    gameMusic.amp(0.2);
    endMusic = new SoundFile(p, "Wereallunderthestars.mp3");
    endMusic.amp(0.2);
    startTone = new SoundFile(p, "startTone.wav");
    enemyHit = new SoundFile(p, "Explosion29.wav");
    shoot = new SoundFile(p, "hit.wav");
    caught = new SoundFile(p, "Pickup_Coin4.wav");
  }
}