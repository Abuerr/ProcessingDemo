class Particle {
  PVector location, velocity, acceleration;
  float lifespan;
  PImage p;

  Particle(float x, float y) {
    location = new PVector(width/2, 100);
    velocity = new PVector(x, y);
    acceleration = new PVector(0, 0.01);
    lifespan = 255;
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
    ellipse(location.x, location.y, 8, 8);
    //image(p,location.x,location.y,15,15);
  }
  boolean isDead() {
    if (lifespan<0.0) {
      return true;
    } else {
      return false;
    }
  }
  void applayForce(PVector force) {
    acceleration.add(force);
  }
}
