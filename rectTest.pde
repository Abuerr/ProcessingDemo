
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
  drawLRRect();

  Move();

  //滑动的长方形
  noStroke();
  rectMode(CENTER);
  fill(c3);
  rect(x, y, w, h);
}

void drawLRRect() {
  //方块1 55*55 x:29，y:20
  rectMode(CENTER);
  noStroke();
  //rectMode(CORNER);
  //left
  fill(c1);
  rect(x1, y, w1, h);
  //right
  fill(c2);
  rect(x2, y, w1, h);
}

void Move() {
  //更新距离差
  float d1 = x-x1;
  float d2 = x2-x;


  //print("x:"+x+"  "+"d1:"+d1 +"  "+"d2:"+d2+"  " +"d3:"+d3 +"  "+"flag:"+ flag +"\n");

  
  //向左移动
  if (d1>d3 && flag==0) {
    x--;
    //print("x:"+x+"  "+"d1:"+d1 +"  " +"d3:"+d3 +"  "+"flag:"+ flag +"\n");
  }
  if (d1<=d3) {
    flag=1;//开始向右运动
    c3 = c1;//改变颜色
  }

  
  //向右移动
  if ( d2>d3 && flag==1) {
    x++;
  }
  if (d2<=d3) {
    flag=0;//开始向左运动
    c3 = c2;//改变颜色
  }
}
