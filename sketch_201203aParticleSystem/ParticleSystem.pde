import java.util.Iterator;

////_______________________________________
//class ParticleSystem {
//  ArrayList<Particle> particles;
//  PVector origin;

//  ParticleSystem(PVector location) {
//    origin = location.get();
//    particles = new ArrayList<Particle>();
//  }
//  void addParticle() {
//    particles.add(new Particle(origin));
//  }
//  void run() {
//    Iterator<Particle> it = particles.iterator();
//    while (it.hasNext()) {
//      Particle p = it.next();
//      p.run();
//      p.applayForce(new PVector(random(1),random(1)));
//      if (p.isDead()) {
//        it.remove();
//      }
//    }
//  }
//}

//_______________________________________
//Confeti
class ParticleSystem {
  ArrayList<Confeti> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Confeti>();
  }
  void addParticle() {
    particles.add(new Confeti(origin));
  }
  void run() {
    Iterator<Confeti> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      p.applayForce(new PVector(random(1),random(1)));
      if (p.isDead()) {
        it.remove();
      }
    }
  }
}
