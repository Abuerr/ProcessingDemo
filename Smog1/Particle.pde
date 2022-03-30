class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan, vx, vy,length;
  PImage img;
  Particle(PVector l) {
    location = l;
    vx= (float)randomGaussian()*1;
    vy = (float)randomGaussian()*0.5-1;
    velocity = new PVector(vx, vy);
    acceleration = new PVector(0.2,random(0.1));
    lifespan = 200;
    img = loadImage("round2.png");
    
    //length = random(20,50);
    length = 250;
  }

  //优化结构，便于调用
  void run() {
    update();
    render();
  }
  //更新位置
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan-=1.5;//降低透明度设置为消亡状态以便生成新的粒子

  }
  //画粒子

  void render() {
    noStroke();
    imageMode(CENTER);
    tint(255, lifespan);
     

    image(img, location.x, location.y,length,length);
  }
  //判断粒子是否消亡
  boolean isDead() {
    if (lifespan==0) {
      return true;
    } else {
      return false;
    }
  }
  //外力改变加速度
  void applyForce(PVector force) {
    PVector f = force.get();
    acceleration.add(f);
  }
}
