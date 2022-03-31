
mergeRect m;
void setup()
{  
  size(541,566);
  m = new mergeRect();
}

void draw() {
  //刷新背景色
  background(163, 209, 232);
  //绘制静态矩形
  m.initStaticRect();

 //绘制动态方形并使其运动起来
  m.drawAndMove();
}
