import processing.sound.*;

class Sound{

  SoundFile gun;
  SoundFile engine;
  SoundFile lowTone;
  SoundFile highTone;
  SoundFile risingTone;
  SoundFile music;
  
  Sound(PApplet p){
    //machine gun sound from CGEffex: https://www.freesound.org/people/CGEffex/sounds/101962/
    //sound was cropped so there is only one shot in wav file
    gun = new SoundFile(p, "gun3.wav");
    gun.amp(0.2);
    lowTone = new SoundFile(p, "lowTone2.wav");
    lowTone.amp(0.2);
    highTone = new SoundFile(p, "lowTone2.wav");
    lowTone.amp(0.4);
    highTone.rate(2);
    engine = new SoundFile(p, "rev.mp3");
    engine.amp(0.001);
    risingTone = new SoundFile(p, "risingTone.wav");
    
    //music by joshua empyre from freesound.org https://www.freesound.org/people/joshuaempyre/sounds/250856/
    music = new SoundFile(p,"mono_250856__joshuaempyre__epic-orchestra-loop.wav");
    music.amp(0.2);
    music.play();
    music.stop();
    music.loop();
    
  }

}
