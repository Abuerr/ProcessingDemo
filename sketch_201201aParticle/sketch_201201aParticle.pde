Particle[] particles = new Particle[100];
void setup() {
  size(800, 800);
  smooth();
  for (int i =0; i<particles.length; i++) {
    particles[i] = new Particle(random(-5, 5), random(-10, 10));
  }
}
void draw() {
  background(255);
  getNew();
  
  for (int i =0; i<particles.length; i++) {
    if (particles[i].isDead()) {
      particles[i] = new Particle(random(-5, 5), random(-10, 10));
      getNew();
    }
  }
}
void getNew() {
  for (int i =0; i<particles.length; i++) {
    particles[i].run();
    
  }
}
