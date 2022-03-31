class Mover {
  PVector location, velocity, acceleration;
  float mass, g;

  Mover(float m, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    this.mass = m;
    this.g = 0.4;
  }

  void update() {
    velocity.add(acceleration);

    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  void display() {
    noStroke();
    fill(#FF7979);
    ellipse(location.x, location.y, 10*mass, 10*mass);
  }

  PVector attract(Mover m) {

    PVector force = PVector.sub(location, m.location);//计算力的方向
    float distance = force.mag();
    distance = constrain(distance, 25, 40);
    force.normalize();

    float strength = (g*mass*m.mass)/(distance*distance);

    force.mult(strength);
    return force;
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
