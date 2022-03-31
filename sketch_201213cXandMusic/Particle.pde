
class Particle {
  float x, y, px, w, speed;
  Particle(float x, float y) {
    this.x = x;
    this.y = y;
    this.px = x;
    w = random(2, 10);
    speed = random(.1, 1);
  }

  void update(float level) {
    px = x;
    x+=speed*level*1000;

    if (px>width) {
      y=random(height);
      x=0;
      px=x;
    }
  }


  void display() {
    //stroke(random(255),random(255),random(255),random(255));
    stroke(#7279F0);
    strokeWeight(w);
    line(x, px, x, y); //对角线实现的关键处，因为改错了地方，哈哈哈
  }
}
