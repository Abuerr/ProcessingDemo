class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;


  Particle(PVector l) {
    acceleration = new PVector(0, -0.20);
    float vx = (float)randomGaussian()*0.3;
    float vy = (float)randomGaussian()*0.3-1.0;
    velocity = new PVector(vx, vy);
    //velocity = new PVector(random(-2,-1), random(-2,-1));
    location = l.get();
    lifespan = 255.0;
    //img = loadImage("round2.png");
  }

  void run() {
    update();
    render();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 10.0;
  }

  void display() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(127, lifespan);
    ellipse(location.x, location.y, 12, 12);
  }
  void render() {
    noStroke();
    imageMode(CENTER);
    tint(255, lifespan);

    image(img, location.x, location.y, 25,25);
  }
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
  void applyForce(PVector f) {
    acceleration.add(f);
  }
}
