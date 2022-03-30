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
    fill(#F2D738, lifespan);
    drawStar(location.x, location.y, 15);
  }
  
  boolean isDead() {
    if (lifespan<0.0) {
      return true;
    } else {
      return false;
    }
  }


  void drawStar(float x, float y, int r) {
    beginShape();
    vertex(x, y-r);
    vertex(x+r*sin(PI/5), y+r*cos(PI/5));
    vertex(x-r*cos(PI/10), y-r*sin(PI/10));
    vertex(x+r*sin(PI/10), y+r*cos(PI/10));
    vertex(x-r*sin(PI/5), y+r*cos(PI/5));
    endShape(CLOSE);
  }
}
