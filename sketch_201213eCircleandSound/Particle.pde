class Particle {
  float r, angle, aVelocity, aAcceleration, d;
  
  Particle(float r, float d) {
    this.r =r;
    this.angle = random(radians(0),2*PI);
    //this.angle = 0;

    this.aVelocity=0;
    this.d = d;
  }

  void update(float rms) {
    angle+=aVelocity;
    aVelocity = rms/10;
    
  }

  void display() {
    pushMatrix();
    translate(width/2, height/2);
    rotate(angle);
    //stroke(0);
    //strokeWeight(10);
    noStroke();
    fill(#F53451, random(255));
    //point(r, 0);
    ellipseMode(CENTER);
    ellipse(r, r, d, d);

    
    popMatrix();
  }
}
