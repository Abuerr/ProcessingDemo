import java.util.Iterator;

////_______________________________________
class ParticleSystem2 {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem2(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }
  void addParticle() {
    particles.add(new Particle(origin));
  }
  void run() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
}
