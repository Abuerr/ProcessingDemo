class Particle {
  PVector location, velocity, acceleration;
  float lifespan, vx, vy;//生命周期
  PImage img;
  Particle(PVector l) {
    lifespan=255;
    acceleration = new PVector(0, -0.2);
    vx = (float)randomGaussian()*0.3;
    vy = (float)randomGaussian()*0.3;
    velocity = new PVector(vx, vy);
    location = l.get();
    img = loadImage("smog.png");
  }
  void run() {
    update();
    render();
  }
  //更新粒子的速度
  void update() {
    location.add(velocity);
    velocity.add(acceleration);

    lifespan-=5;
  }

  //加载图片，渲染
  void render() {
    noStroke();
    imageMode(CENTER);
    tint(255, lifespan);

    image(img, location.x, location.y,12,12);
  }
  //煽风点火
  void applyForce(PVector f) {
    PVector force = f.get();
    acceleration.add(force);
  }
  //判断消亡
  boolean isDead() {
    if (lifespan<0.0) {
      return true;
    } else {
      return false;
    }
  }
}
