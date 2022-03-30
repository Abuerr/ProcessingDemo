import java.util.Iterator;
PImage bp;
ArrayList<Particle> particles;

void setup() {
  size(800, 533);
  bp = loadImage("shuimo.png");
  particles = new ArrayList<Particle>();
}

void draw() {
  background(255);
  image(bp, width/2, height/2, width, height);

  particles.add(new Particle(new PVector(0,400)));
  Iterator<Particle> it = particles.iterator();
  while (it.hasNext()) {
    Particle p =it.next();
    p.run();
    if (p.isDead()) {
      it.remove();
    }
  }
}
