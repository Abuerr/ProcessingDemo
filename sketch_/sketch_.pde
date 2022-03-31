
int num = 50; //圆的个数
Round [] rounds = new Round[num];

void setup() {
  size(800, 800);

  for (int i=0; i<num; i++) {
    rounds[i] = new Round(random(width), random(height), 50, random(-1, 1), random(1, -1));
  }

  //frameRate(10);
}
void draw() {
  background(0);
  for (int i =0; i<num; i++) {
    rounds[i].x += rounds[i].vx;
    rounds[i].y += rounds[i].vy;
    rounds[i].Round1();
    rounds[i].changeRoad();
  }
}


//画圆和圆的动作
class Round {
  float x, y, r, vx, vy;
  Round(float x, float y, float r, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.vx = vx;
    this.vy = vy;
  }
  void Round1() { //定义形状
    noStroke();
    //fill(random(255), random(255), random(255));
    fill(#C69DF0,random(255));
    ellipse(this.x, this.y, this.r, this.r);
  }
  void changeRoad() {
    if (mousePressed) {
    } else {
      if (this.x >width-this.r/2 || this.x + this.r/2<0) {
        this.vx *=-1;
      }
      if (this.y + this.r/2<0 || this.y>height-this.r/2) {
        this.vy *=-1;
      }
    }
  }
}
