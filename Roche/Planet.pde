//行星
class Planet {
  float w;//定义图片的宽高
  PImage circle;
  Particle[] particles;
  Planet() {
    //光圈
    circle = loadImage("sun3.png");
    w=250;
    particles = new Particle[5000];
    for (int i=0; i<particles.length; i++) {
      particles[i] = new Particle(random(120), random(120));
    }
  }

  void update() {
    for (int i=0; i<particles.length; i++) {
      particles[i].update();
      particles[i].display();
    }
  }
  void display() {
    imageMode(CENTER);
    //image(circle, width/2, height/2, w, w);
  }
  
  void mousePressed() {
    for (int i=0; i<particles.length; i++) {
      particles[i] = new Particle(random(120), random(120));
    }
  }
}
