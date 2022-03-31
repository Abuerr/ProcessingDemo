class Attractor {
  float mass;
  float G;
  PVector location;

  Attractor() {
    location = new PVector(width/2, height/2);
    mass = 20;
    G = 0.4;
  }

  void display() {
    stroke(0);
    fill(200, 200);
    ellipse(location.x, location.y, mass*2, mass*2);
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);//计算里的方向


    float distance = force.mag();
    distance = constrain(distance, 25, 40);
    force.normalize();

    float strength = (G * mass *m.mass)/(distance*distance);

    force.mult(strength);
    return force;
  }
}
