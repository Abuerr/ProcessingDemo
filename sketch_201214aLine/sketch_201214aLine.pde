//使用粒子系统
String filename;
import processing.sound.*;
AudioIn audio;
Amplitude amp;
Particle[] particles;

void setup() {
  filename = this.getClass().getName();

  size(1280,720);
  audio = new AudioIn(this, 0);
  audio.start();
  amp = new Amplitude(this);
  amp.input(audio);
  
  background(255);

  //初始化粒子
  particles = new Particle[100];
  for (int i=0; i<particles.length; i++) {
    particles[i]=new Particle(random(width), random(height));
  }
}


void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  
  float rms = amp.analyze();
 
  for (int i=0; i<particles.length; i++) {
    particles[i].update(rms);
    particles[i].display();
  }
}
void mousePressed() {
  saveFrame(filename+".jpg");
}
