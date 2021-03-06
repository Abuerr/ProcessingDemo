
//动态的方形
class dynamicRect {
  //长，宽，位置x, y,w, h
  int num = 4;
  float[] index = new float[num];
  //颜色
  color c;
  //运动方形标志
  int flag; //值为true向左/上运动，值为false向右或下运动
  //左右/上下的静态方块
  
  staticRect[] s = new staticRect[2];
  //距离差
  float[] d = new float[4];
  //移动速度
  float speed;

  //构造函数初始化成员变量
  dynamicRect(float[] index, color c, staticRect s1, staticRect s2, float speed) {
    this.index = index;
    this.c = c;

    flag = 0;

    this.s[0] = s1;
    this.s[1] = s2;
    d[2] = s1.w/2 + index[2]/2;
    d[3] = s1.h/2 + index[3]/2;

    this.speed = speed;
  }

  //绘制静态矩形
  void drawStaticRect() {
    //方块1 55*55 x:29，y:20
    rectMode(CENTER);
    noStroke();//去掉边缘线
    fill(c);
    //x,y,w,h
    rect(index[0], index[1], index[2], index[3]);
  }

  //更新距离差
  void updateDistance(int dir) {
    //更加移动方向更新距离差
    switch(dir) {
      //左右移动
    case 0 :
      d[0] = index[0]-this.s[0].x;
      d[1] = this.s[1].x-index[0];
      break;
      //上下移动
    case 1 : 
      d[0] = index[1]-this.s[0].y;
      d[1] = this.s[1].y-index[1];
      break;
    }
  }

  //方形的运动,dir为1则左右运动，dir为0则上下运动
  void moveRect(int dir) {

    updateDistance(dir);

    //向左/上移动
    if (d[0]>d[2+dir] && flag==0) {
      index[dir]--;
    }
    if (d[0]<=d[2+dir]) {
      flag=1;//开始向右运动
      c = s[0].c;//改变颜色
    }

    //向右/下移动
    if ( d[1]>d[2+dir] && flag==1) { //flag[1] == false 
      index[dir]++;
    }
    if (d[1]<=d[2+dir]) {
      flag=0;//开始向左运动
      c = s[1].c;//改变颜色
    }


  
  }
}
