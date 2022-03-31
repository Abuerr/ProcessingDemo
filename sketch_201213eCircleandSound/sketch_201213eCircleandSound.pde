import processing.sound.*;
AudioIn audio;
Amplitude amp;
//振幅影响速度
String filename;
Particle[] particles;

void setup() {
  size(1000, 1000);
  smooth();
  background(255);
  particles =new Particle[50];
  for (int i=0; i<particles.length; i++) {
    particles[i]=new Particle(random(50, 250), 10);
  }

  audio = new AudioIn(this, 0);
  audio.start();

  amp = new Amplitude(this);
  amp.input(audio);

  filename=this.getClass().getName();
}

void draw() {
  fill(255, 50);
  noStroke();
  rect(0, 0, width, height);
  //background(255);

  float rms = amp.analyze();

  float a = map(rms, 0, 1, 0, 2*PI);

  for (int i=0; i<particles.length; i++) {
    particles[i].update(a);
    particles[i].display();
  }
}

void mousePressed() {
  saveFrame(filename+".jpg");
}
