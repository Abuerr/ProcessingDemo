//静态的方形
class staticRect {
  //长，宽，位置
  float w, h, x, y;
  color c;
  //颜色

  //构造函数初始化成员变量
  staticRect(float x, float y, float w, float h, color c) {
    this.w = w;
    this.h = h;
    this.x = x;
    this.y = y;
    this.c = c;
  }

  //绘制静态矩形
  void drawStaticRect() {
    rectMode(CENTER);
    noStroke();//去掉边缘线
    fill(c);
    rect(x, y, w, h);
  }
}
