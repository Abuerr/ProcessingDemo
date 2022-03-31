ParticleSystem ps;
PImage img;
void setup() {
  size(800, 400, P2D);
  smooth();
  img = loadImage("round.png");
  ps = new ParticleSystem(new PVector(width/2, height/2));
}

void draw() {
  blendMode(ADD);
  background(0);

  ps.addParticle();
  float dx = map(mouseX, 0, width, -0.02, 0.02);
  PVector wind = new PVector(dx, 0);
  ps.applyForce(wind);
  ps.addParticle();
  ps.run();
}
