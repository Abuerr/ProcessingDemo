//int x, y;
//int dx, dy;
//int sx, sy;

//int r;
//void setup() {
//  size(300, 300);
//  frameRate(60);
//  smooth();
//  background(0);
//  x=0;
//  y=0;
//  dx=1;
//  dy=1;
//  sx=5;
//  sy=1;
//  r = 50;
//}
//void draw() {
//  background(0,0,0,random(100));
//  ellipse(x, y, r, r);

//  if (x+(r/2)*dx==width||x+(r/2)*dx==0) {
//    dx=(-1)*dx;
//  }
//  if (y+(r/2)*dy==width||y+(r/2)*dy==0) {
//    dy=(-1)*dy;
//  }
//  x = x+dx*sx;
//  y = y+dy*sy;
//}


int num = 5;
Ball[] balls = new Ball [num];
void setup() {
  size(400, 400);
  frameRate(24);
  smooth();

  for (int i=0; i<num; i++) {
    balls[i]=new Ball(random(width), random(height));//random(width)出来的数据类型和float不一样
  }
}
//——————————————
void draw() {
  fill(0,0,0,90);
  rect(0,0,width,height);
  for (int j=0; j<num; j++) {
    balls[j].drawBall();
    balls[j].change();
  }
}
//————————————
class Ball {
  float x, y;
  int dx =1;
  int dy =1;
  int sx =5;
  int sy =1;
  int r = int(random(50));
  Ball(float x, float y) {
    this.x = x;
    this.y = y;
  }
  void drawBall() {
    noStroke();
    ellipse(x, y, r, r);
  }
  void change() {
    if (x+(r/2)*dx>=width||x+(r/2)*dx<=0) { //数据类型不一样
      dx=(-1)*dx;
      fill(random(255), random(255), random(255));
      //碰壁的变颜色的效果和预想中的不一样，在JavaScript中是一样的步骤的但是效果是预想中的
      //只要其中一个变了颜色，其他的也会同时变颜色，想想
    }
    if (y+(r/2)*dy>=height||y+(r/2)*dy<=0) {
      dy=(-1)*dy;
      fill(random(255), random(255), random(255));
    }
    x = x+dx*sx;
    y = y+dy*sy;
  }
}
