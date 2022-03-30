int num = 15;
RedPacktet[] redpacktet = new RedPacktet[num];
int getNum = 0;
String str;

void setup() {
  size(800, 800);
  for (int i=0; i<num; i++) {
    redpacktet[i] = new RedPacktet(random(width-100)+i*10, random(20)+i*50);
  }
  frameRate(24);
}

void draw() {
  background(255);
  for (int j=0; j<num; j++) {
    redpacktet[j].appear();
    redpacktet[j].moveRedPacktet();
    if ( (mouseX-10)<redpacktet[j].x && redpacktet[j].x  < (mouseX+20) && redpacktet[j].y > height-508*0.3) {
      redpacktet[j].x=mouseX+random(20);
      redpacktet[j].y=height-508*0.5;
      
    }
  }
  takeBag();
  //fill(0, 102, 153, 51);
  //textSize(50); 
  //str = ""+getNum;
  //text(str, 10, 50);
}


//红包
class RedPacktet { 
  float x, y;
  float t =1;
  float g =50;
  float v0 = random(50);
  RedPacktet(float x, float y) {
    this.x= x;
    this.y = y;
  }
  void appear() {
    PImage png;
    png = loadImage("redpacket.png");
    image(png, this.x, this.y, 238*0.3, 306*0.3);
  }
  void moveRedPacktet() {
    this.y +=v0*t+g*t/2;
    t++;
  }
}

void mousePressed() {
}

//收红包袋
void takeBag() {
  PImage bag;
  bag = loadImage("bag.png");
  image(bag, mouseX, height-508*0.3, 668*0.3, 508*0.3 );
}
