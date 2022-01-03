
//动态的方形
class dynamicRect {
  //长，宽，位置
  float w, h, x, y;
  //颜色
  color c;
  //运动方形标志
  int flag; //值为1向左/上运动，值为0向右或下运动
  //左右的静态方块
  staticRect s1,s2;
  //距离差
  float d1,d2,d3;

  //构造函数初始化成员变量
  dynamicRect(float x, float y, float w, float h, color c,staticRect s1,staticRect s2) {
    this.w = w;
    this.h = h;
    this.x = x;
    this.y = y;
    this.c = c;
    flag = 0;
    this.s1 = s1;
    this.s2 = s2;
    d3 = this.s1.w/2 + this.w/2;
  }

  //绘制静态矩形
  void drawStaticRect() {
    //方块1 55*55 x:29，y:20
    rectMode(CENTER);
    noStroke();//去掉边缘线
    fill(c);
    rect(x, y, w, h);
  }

  //方形的运动
  void moveRect() {
    //更新距离差
    d1 = this.x-this.s1.x;
    d2 = this.s2.x-this.x;


    //print("x:"+x+"  "+"d1:"+d1 +"  "+"d2:"+d2+"  " +"d3:"+d3 +"  "+"flag:"+ flag +"\n");


    //向左移动
    if (d1>d3 && flag==0) {
      x--;
      //print("x:"+x+"  "+"d1:"+d1 +"  " +"d3:"+d3 +"  "+"flag:"+ flag +"\n");
    }
    if (d1<=d3) {
      flag=1;//开始向右运动
      c = s1.c;//改变颜色
    }


    //向右移动
    if ( d2>d3 && flag==1) {
      x++;
    }
    if (d2<=d3) {
      flag=0;//开始向左运动
      c = s2.c;//改变颜色
    }
  }
}
