Sun sun;
Stars s;
Planet[] planets;
void setup() {
  size(1000, 800);
  background(0);
  sun = new Sun();
  planets =new Planet[8];
  s = new Stars(3000, 30);
  for (int i=0; i<planets.length; i++) {
    planets[i] = new Planet(150+i*30, 20+i*10);
  }
}

void draw() {
  //background(0, 200);
  noStroke();
  fill(0, 18);
  rect(0, 0, width, height);

  s.display();
  s.update();
  s.checkEdge();

  for (int i=0; i<planets.length; i++) {
    //planets[i].display();
    planets[i].update2();
  }
  sun.display();
  sun.update();
}
