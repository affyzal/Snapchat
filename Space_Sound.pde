import processing.sound.*;

SoundFile file;

void setup(){
  size(600,600);
  background(255);
  
}
void draw(){
  
}

void keyPressed() {
  loop();
  if (key == CODED) {
    if (keyCode == SHIFT) {
      //link to the sound file: https://freesound.org/people/celestino.anthony/sounds/172457/
      file = new SoundFile(this,"Space.wav");
  file.play();
  
    }
  }
}
