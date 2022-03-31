//
//ParticleSystem ps;
//void setup() {
//  size(800, 800);
//  smooth();
//  ps = new ParticleSystem(new PVector(width/2, height/2));
//}
//void draw() {
//  background(255);
//  ps.addParticle();
//  ps.run();
//}
//void mousePressed(){

//}
//_________________________________________________ 

//ArrayList<ParticleSystem> systems;
//void setup() {
//  size(800, 800);
//  smooth();
//  systems = new ArrayList<ParticleSystem>();
//}
//void draw() {
//  background(255);
//  for (ParticleSystem ps : systems) {
//    ps.addParticle();
//    ps.run();
//  }
//}
//void mousePressed() {
//  systems.add(new ParticleSystem(new PVector(mouseX,mouseY)));
//}

//_______________________________________________________
ArrayList<ParticleSystem> systems;
void setup() {
  size(800, 800);
  smooth();
  systems = new ArrayList<ParticleSystem>();
}
void draw() {
  background(255);
  for (ParticleSystem ps : systems) {
    ps.addParticle();
    ps.run();
  }
}
void mousePressed() {
  systems.add(new ParticleSystem(new PVector(mouseX,mouseY)));
}
