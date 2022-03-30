Sun sun;
Planet planet;
void setup() {
  size(1000, 800);
  background(0);
  sun = new Sun();
  planet =new Planet(250,20);
}

void draw() {
  //background(0, 200);
  noStroke();
  fill(0,100);
  rect(0,0,width,height);
  
  sun.display();
  sun.update();
  
  planet.display();
  planet.update();
}
