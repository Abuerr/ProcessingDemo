Mover[] movers = new Mover[10];


void setup() {
  size(400, 400);
  for (int i=0; i<movers.length; i++) {
    movers[i] = new Mover(random(0.1, 2), random(width), random(height));
  }
}
void draw() {
  background(255);

  for (int i=0; i<movers.length; i++) {
    for (int j=0; j<movers.length; j++) {
      if (i!=j) {
        PVector force = movers[j].attract(movers[i]);
        movers[i].applyForce(force);
      }
    }
    movers[i].update();
    movers[i].display();
  }
}
