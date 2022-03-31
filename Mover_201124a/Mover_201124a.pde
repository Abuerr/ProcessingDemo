////____________________________________
//Mover[] movers = new Mover[20];
//void setup() {
//  size(800, 200);
//  smooth();
//  for (int i =0; i<20; i++) {
//    movers[i] = new Mover(random(5),random(100),random(200));
//  }
//}

//void draw() {
//  background(255, 100);

//  PVector wind = new PVector(random(0.1), 0);
//  PVector gravity = new PVector(0, 0.01);
//  for (int i=0; i<20; i++) {
//    movers[i].apllyForce(wind);
//    movers[i].apllyForce(gravity);

//    movers[i].update();
//    movers[i].display();
//    movers[i].checkEdge();
//  }
//}

//____________________________________
////加个数
//Mover[] movers = new Mover[20];
//void setup() {
//  size(800, 400);
//  smooth();
//  for (int i =0; i<20; i++) {
//    movers[i] = new Mover(random(5),0,0);
//  }
//}

//void draw() {
//  background(255, 100);

//  PVector wind = new PVector(random(0.1), 0);

//  for (int i=0; i<20; i++) {
//    PVector gravity = new PVector(0, 0.01*movers[i].mass);
//    movers[i].apllyForce(wind);
//    movers[i].apllyForce(gravity);

//    movers[i].update();
//    movers[i].display();
//    movers[i].checkEdge();
//  }
//}
//____________________________________
//加摩擦力
Mover[] movers = new Mover[20];
void setup() {
  size(800, 400);
  smooth();
  for (int i =0; i<20; i++) {
    //movers[i] = new Mover(random(5), random(width), random(height));
    movers[i] = new Mover(random(0.1,4), 0, 0);
  }
}

void draw() {
  background(255, 100);

  PVector wind = new PVector(random(0.1), 0);

  for (int i=0; i<20; i++) {
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    movers[i].apllyForce(wind);
    movers[i].apllyForce(gravity);

    float c = 0.05;
    PVector friction = movers[i].velocity.get();
    friction.mult(-1);
    friction.normalize(wind);
    friction.mult(c);

    movers[i].update();
    movers[i].display();
    movers[i].checkEdge();
  }
}
