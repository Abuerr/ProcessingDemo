
//静态方形的坐标数据
float sx1, sx2, sx3, sy1, sy2, sy3;

//方块长度
float w1 = 56;
float h1 = 50;

//颜色数据
color c1, c2, c0, c3, c4;


//动态方形的变量
float[][] index = new float[3][];//三组x,y,w,h
float speed;

//0的时候往左移动，1的时候往右动
int flag = 0;

//五个静态和三个动态
staticRect[] sr =  new staticRect[5];
dynamicRect[] dr = new dynamicRect[3];

void setup()
{  
  size(541, 566);
  frameRate(60);
  initIndex();
}

void draw() {
  //刷新背景色
  background(163, 209, 232);
  //绘制静态方形
  initStaticRect();

  //绘制动态方形
}






//初始化全局变量
void initIndex() {
  sx1 = 58;
  sx2 = 492;
  sx3 = 276;

  sy1 = 46;
  sy2 = 527;

  //颜色参数
  c0 = color(238, 189, 110);
  c1 = color(234, 33, 33);
  c2 = color(211, 26, 232);
  c3 = color(238, 179, 197);
  c4 = color(233, 236, 193);

  //动态方形的初始数据
  index[0] = new float[]{width/2,sy1,w1*4,h1};
  index[1] = new float[]{sx1,height/2,w1,h1*5};
  index[2] = new float[] {385,sy2,w1*2,h1};
  
  speed = 1;
}



//初始化相关的静态方形
void initStaticRect() {

  sr[0] = new staticRect(sx1, sy1, w1, h1, c0);
  sr[1] = new staticRect(sx2, sy1, w1, h1, c1);
  sr[2] = new staticRect(sx1, sy2, w1, h1, c2);
  sr[3] = new staticRect(sx3, sy2, w1, h1, c3);
  sr[4] = new staticRect(sx2, sy2, w1, h1, c4);

  //绘制静态方形方形
  for (int i=0; i<sr.length; i++) {
    sr[i].drawStaticRect();
  }
}



//初始化相关的静态方形
void initDynamicRect() {
  //初始化动态方形
  dr[0] = new dynamicRect(index[0],c1,sr[0],sr[1],speed);
  dr[1] = new dynamicRect(index[1],c3,sr[0],sr[2],speed);
  dr[2] = new dynamicRect(index[2],c1,sr[3],sr[4],speed);
}
