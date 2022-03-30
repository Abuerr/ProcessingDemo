//星球
class Planet {
  float a, b;//定义椭圆轨道的宽高(半长轴，半短轴)
  float x, y;//定义星球的坐标
  float h;//让椭圆轨道倾斜的变量
  float angle, angleSpeed;//定义椭圆三角函数的角和角速度变化的速度

  Planet (float a, float b) {
    this.a= a;
    this.b=b;
    angle =0;
    angleSpeed = 0.01f;
    x = a*cos(radians(angle))+width/2;
    y = b*sin(radians(angle))+height/2;
  }

  void update() {
    x = a*cos(angle)+width/2;
    y = b*sin(angle)+height/2;
    angle +=angleSpeed;
    
  }

  void display() {
    ////轨道
    //stroke(255);
    //noFill();
    //ellipse(width/2, height/2, 2*a, b*2);

//星球
    stroke(255);
    fill(255);
    ellipse(x, y, 20, 20);
  }
}
