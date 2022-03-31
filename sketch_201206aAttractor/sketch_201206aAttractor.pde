////单个
//Mover m;
//Attractor a;

//void setup() {
//  size(400, 400);
//  m = new Mover();
//  a = new Attractor();
//}
//void draw() {
//  background(255);

//  PVector f = a.attract(m);
//  m.applyForce(f);//m受到attract对象的引力

//  m.update();

//  a.display();
//  m.display();
//}

//————————————————————————————

//多个
Mover[] movers = new Mover[10];
Attractor a;

void setup() {
  size(400, 400);
  for (int i=0; i<movers.length; i++) {
    movers[i] = new Mover(random(0.1, 2), random(width), random(height));
  }
  a = new Attractor();
}
void draw() {
  background(255);
  a.display();
  for (int i=0; i<movers.length; i++) {
    PVector f = a.attract(movers[i]);
    movers[i].applyForce(f);//m受到attract对象的引力

    movers[i].update();
    movers[i].display();
  }

  
}
