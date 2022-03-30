ParticleSystem ps;
PImage img, bpimg;
void setup() {
  size(800, 532, P2D);
  smooth();
  //img = loadImage("smog.png");
  bpimg= loadImage("yanwu.png");
  //ps = new ParticleSystem(new PVector(width/2, height/2));
  ps = new ParticleSystem(new PVector(width/2, height/2));
}

void draw() {
  background(255);
  image(bpimg, width/2, height/2);

  ps.addParticle();
  float dx = map(mouseX, 0, width, -0.02, 0.02);
  PVector wind = new PVector(dx, 0);
  ps.applyForce(wind);
  ps.addParticle();
  ps.run();
}
