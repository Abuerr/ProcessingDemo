class Particle {
  float r, x0, y0, theta;
  float x;
  float y;
  Particle(float r) {
    theta = radians(random(360));
    this.r = r;
    x0 = width/2;
    y0 = height/2;
  }
  void update() {
    x = x0+r*cos(theta);
    y = y0+r*sin(theta);
    theta+=radians(random(0.01,0.05));
  }
  void display() {
    noStroke();
    float p = map((float)randomGaussian(),0,1,0,255);
    fill(#f38c1c,p);
    ellipse(x, y, random(2,4), random(2, 4));
  }
}
