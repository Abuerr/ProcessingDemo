//构成中心圆的粒子
class Particle{
  float r, x0, y0, theta;
  float x;
  float y;
 Particle(float r1,float r2) {
    theta = radians(random(360));
    this.r = r1;
    this.r = r2;
    x0 = width/2;
    y0 = height/2;
  }
  void update() {
    x = x0+r*cos(theta);
    y = y0+r*sin(theta);
    theta+=radians(random(0.01, 0.05));
  }
  void display() {
    
      noStroke();
      float p = map((float)randomGaussian(), 0, 1, 0, 255);
      fill(#FC651F, p);
      ellipse(x, y, random(2, 4), random(2, 4));
    
  }
}
