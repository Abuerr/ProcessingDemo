import java.util.Iterator;
ArrayList<Particle> particles;


void setup() {
  size(500,500);
  smooth();
  particles = new ArrayList<Particle>();
}
void draw() {
  fill(0,18);
  noStroke();
  rect(0,0,width,height);
  
  particles.add(new Particle(new PVector(width/2, height/2)));
  //particles.add(new Particle(new PVector(width/2, height-100)));
  Iterator<Particle> it = particles.iterator();
  while (it.hasNext()) {
    Particle p = it.next();
    p.run();
    if (p.isDead()) {
      it.remove();
    }
  }
}
