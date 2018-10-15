
import processing.sound.*;

SoundFile file;

void setup(){
  size(600,600);
  background(255);
  
  file = new SoundFile(this,"error.wav");
  file.play();
}
void draw(){
  
}
