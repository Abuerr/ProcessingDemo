//2020/11/24
class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float tx, ty;


  Mover(float m, float x, float y) {
    location = new PVector(30, 30);
    velocity = new PVector(0, 0);
    acceleration= new PVector(0, 0);
    this.mass = m;
    location.x = x;
    location.x = y;
    tx =0;
    ty =100;
  }
  void apllyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  void update() {
    velocity.add(acceleration);

    location.add(velocity);
    acceleration.mult(0);
  }
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(145);
    ellipse(location.x, location.y, 10*mass, 10*mass);
  }
  void checkEdge() {
    if (location.x>width) {
      location.x =width;
      velocity.x *=-1;
    } else if (location.x<0) {
      location.x =0;
      velocity.x *=-1;
    }

    if (location.y>height) {
      location.y = height;
      velocity.y *=-1;
    }
    
  }
 
}
