class Particle {
  PVector location, velocity, acceleration;
  float lifespan, mass;

  Particle(PVector l) {
    location = l.get();
    velocity = new PVector(random(-1, 1), random(-2, 0));
    acceleration = new PVector(0, 0.01);
    lifespan = 255;
    mass=1;
  }
  void run() {
    display();
    update();
  }
  void update() {
    location.add(velocity);
    velocity.add(acceleration);
    lifespan-=2;
  }
  void display() {
    noStroke();
    fill(#F25D80, lifespan);
    //ellipse(location.x, location.y, 8, 8);
    PImage p = loadImage("love.png");
    image(p, location.x, location.y, 30,30);
  }
  boolean isDead() {
    if (lifespan<0.0) {
      return true;
    } else {
      return false;
    }
  }
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
}
