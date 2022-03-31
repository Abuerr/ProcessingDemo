//中心圆的律动
//String filename;
//import processing.sound.*;
//AudioIn audio;
//Amplitude amp;

//void setup() {
//  filename = this.getClass().getName();

//  size(1000, 1000);
//  audio = new AudioIn(this, 0);
//  audio.start();
//  amp = new Amplitude(this);
//  amp.input(audio);

//}
//void draw() {
//  background(255);
//  float rms = amp.analyze();
//  float radius = map(rms, 0, 1, 0, 5000);
//  stroke(#E84444);
//  strokeWeight(5);
//  noFill();
//  ellipse(width/2, height/2, radius, radius);
//}
//void mousePressed() {
//  saveFrame(filename+".jpg");
//}

//——————————————————————————
//使用粒子系统
//String filename;
//import processing.sound.*;
//AudioIn audio;
//Amplitude amp;
//Particle[] particles;
//void setup() {
//  filename = this.getClass().getName();

//  size(1000, 1000);
//  audio = new AudioIn(this, 0);
//  audio.start();
//  amp = new Amplitude(this);
//  amp.input(audio);

//  //初始化粒子
//  particles = new Particle[100];
//  for (int i=0; i<particles.length; i++) {
//    particles[i]=new Particle(random(width), random(height));
//  }
//}


//void draw() {
//  noStroke();
//  fill(255,10);
//  rect(0,0,width,height);
  
//  float rms = amp.analyze();
//  //float radius = map(rms, 0, 1, 0, 5000);
//  for (int i=0; i<particles.length; i++) {
//    particles[i].update(rms);
//    particles[i].display();
//  }
//}
//void mousePressed() {
//  saveFrame(filename+".jpg");
//}

//————————————————————————
//改变x,x方向的流动
String filename;
import processing.sound.*;
AudioIn audio;
Amplitude amp;
Particle[] particles;
void setup() {
  filename = this.getClass().getName();

  size(1000, 1000);
  audio = new AudioIn(this, 0);
  audio.start();
  amp = new Amplitude(this);
  amp.input(audio);

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
  //float radius = map(rms, 0, 1, 0, 5000);
  for (int i=0; i<particles.length; i++) {
    particles[i].update(rms);
    particles[i].display();
  }
}
void mousePressed() {
  saveFrame(filename+".jpg");
}
