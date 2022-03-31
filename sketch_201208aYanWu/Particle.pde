class Particle {
  PVector location, velocity, acceleration;
  float lifespan;
  PImage img;


  Particle(PVector l) {
    location = l.get();
    //velocity = new PVector(random(-1, 1), random(-2, 0));
    float vx = (float)randomGaussian()*0.3;
    float vy = (float)randomGaussian()*0.3-1.0;
    velocity = new PVector(vx, vy);
    acceleration = new PVector(0, 0.01);
    lifespan = 255;
    img = loadImage("round.png");
  }
  void run() {
    display();
    update();
  }
  void update() {
    location.add(velocity);
    velocity.add(acceleration);
    lifespan-=10;
  }
  void display() {
    noStroke();
    fill(255, lifespan);
    point(location.x, location.y);
    ellipse(location.x, location.y, random(1, 5), random(1, 5));
    imageMode(CENTER);
    tint(255, lifespan);
    image(img, location.x, location.y, 25, 25);
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
