Stars s;
ArrayList<ParticleSystem2> systems;
void setup() {
  size(800, 800);
  smooth();
   s = new Stars(3000, 30);
  systems = new ArrayList<ParticleSystem2>();
 
}
void draw() {
  fill(0, 18);
  noStroke();
  rect(0, 0, width, height);
  
  s.display();
  s.update();
  s.checkEdge();

  for (ParticleSystem2 ps : systems) {
    ps.addParticle();
    ps.run();
  }
  
}
void mousePressed() {
  systems.add(new ParticleSystem2(new PVector(mouseX,mouseY)));
}
