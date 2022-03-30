class Particle {
  float r, angle, aVelocity, aAcceleration, d;

  Particle(float r, float d) {
    this.r =r;
    this.angle = random(radians(0), 2*PI);
    //this.angle = 0;
    this.aAcceleration =0;
    this.aVelocity=0;
    this.d = d;
  }

  void update(float rms) {
    angle+=aVelocity;
    aVelocity += aAcceleration;
    aAcceleration=rms;
    println(angle);
    
  }

  void display() {
    pushMatrix();
    translate(width/2, height/2);
    rotate(angle);


    //point(r, 0);
    if (r>120||r<280) {
      fill(255);
      stroke(255);
      strokeWeight(10);
    } else {
      fill(#575DF5);
      stroke(#575DF5);
      strokeWeight(10);
    }
    ellipseMode(CENTER);
    ellipse(r, r, d, d);

    popMatrix();
  }
}
