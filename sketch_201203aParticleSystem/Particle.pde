class Particle {
  PVector location, velocity, acceleration;
  float lifespan;
  float mass = 0.5;

  Particle(PVector l) {
    location = l.get();
    velocity = new PVector(random(-1, 1), random(-2, 0));
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
    lifespan-=20;
  }
  void display() {
    noStroke();
    fill(#F25D80, lifespan);

    if (random(0, 1)>0.3) {
      PImage p = loadImage("love1.png");
      image(p, location.x, location.y, 30, 30);
    } else if(random(0, 1)>0.8){
      ellipse(location.x, location.y, 15,15);
    }else{
      rect(location.x, location.y, 15,15);
    }
  }
  boolean isDead() {
    if (lifespan<0.0) {
      return true;
    } else {
      return false;
    }
  }
  void applayForce(PVector force) {
    force.div(mass);
    acceleration.add(force);
  }
}
