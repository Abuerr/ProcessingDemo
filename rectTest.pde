
//长方形的坐标
float x = 271;
float x1 = 56;
float x2 = x1+428;
float y = 46;
float cx = x+1.0;

//方块长度
float w = 200;
float w1 = 56;
float h = 50;

color c1 = color(238, 189, 110);
color c2 = color(234, 33, 33);
color c3 = color(211, 26, 232);

//距离差
float d3 = w/2+w1/2;

//0的时候往左移动，1的时候往右动
int flag = 0;

void setup()
{
  size(541, 566);

  frameRate(60);
}

void draw() {

  background(163, 209, 232);
  //绘制矩形
  //drawLRRect();

  //滑动的长方形
  noStroke();
  rectMode(CENTER);
  fill(c3);
  rect(x, y, w, h);
}
