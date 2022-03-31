import java.util.Iterator;
ArrayList<Particle> particles;
void setup() {
  size(800, 800);
  smooth();
  particles = new ArrayList<Particle>();
}
void draw() {
  background(255);
  //particles.add(new Particle(new PVector(mouseX, mouseY)));
  particles.add(new Particle(new PVector(width/2, height/2)));
  Iterator<Particle> it = particles.iterator();
  PVector wind = new PVector(random(-0.05, 0.05), random(0.05));
  while (it.hasNext()) {
    Particle p = it.next();
    p.run();
    if (mousePressed) {
      p.applyForce(wind);
    }
    if (p.isDead()) {
      it.remove();
    }
  }
}
