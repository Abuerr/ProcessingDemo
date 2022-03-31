import processing.sound.*;
String filename;
AudioIn audio;
Amplitude amp;
Particle[] particles;
void setup() {
  filename = this.getClass().getName();
  background(255);
  
  size(1000, 1000);
  audio = new AudioIn(this, 0);
  audio.start();
  amp = new Amplitude(this);
  amp.input(audio);
  
  particles = new Particle[100];
  for (int i=0;i<particles.length;i++) {
    particles[i] = new Particle(random(width),random(height));
  }
}
void draw() {
  
  noStroke();
  
  rect(0,0,width,height);
  
  float rms = amp.analyze(); 
  for (int i=0;i<particles.length;i++) {
    particles[i].update(rms);
    particles[i].display();
  }
  
  
}
void mousePressed() {
  saveFrame(filename+"jpg");
}
