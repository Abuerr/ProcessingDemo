//白色小球
class Satellite {
  float a, b;//定义椭圆轨道的宽高(半长轴，半短轴)
  float x, y;//定义小球的坐标
  float h;//让椭圆轨道倾斜的变量
  float angle, angleSpeed;//定义椭圆三角函数的角和角速度变化的速度
  float[] c = new float[3];
  float r1;//小球的半径大小
  float mass;
  Particle[] particles;

  Satellite (float a, float b) {
    this.a= a;
    this.b=b;
    angle =random(radians(360));
    angleSpeed = 0.01f;
    x = a*cos(radians(angle))+width/2;
    y = b*sin(radians(angle))+height/2;
    colorMode(HSB);

    r1 = random(20, 30);
  }

  void update() {
    x = a*cos(angle)+width/2;
    y = b*sin(angle)+height/2;
  
    angle +=angleSpeed;
  }

  void display() {
    //轨道
    stroke(255);
    strokeWeight(0.1);
    noFill();
    ellipse(width/2, height/2, 2*a, b*2);

    //小球
    noStroke();

    fill(255, 100);
    ellipse(x, y, r1, r1);
  }

  void update2(float rms2) {
    float ra =map(rms2, 0, 1, 1, 10);


    //println(a);

    if (a>540) {
      x = a*cos(angle)+width/2;
      y = b*sin(angle)+height/2;
      stroke(255);
      strokeWeight(0.1);
      noFill();
      ellipse(width/2, height/2, 2*a, b*2);
      float ap=ra;
      float bp=ra;
      a-=ap;
      b-=bp;
    } else {
      float ap=ra;
      float bp=ra;
      x = a*cos(angle)+width/2;
      y = b*sin(angle)+height/2;
      angle +=angleSpeed;
      
      display();
      a-=ap;
      b-=bp;
    }
  }
}
