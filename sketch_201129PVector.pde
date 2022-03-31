//______________________
//PVector mouse;
//PVector center;

//void setup(){
//size(800,400);

//}
//void draw(){
//background(255,100);
//center = new PVector(width/2,height/2);
//mouse =new PVector(mouseX,mouseY);

//mouse.sub(center);
//translate(width/2,height/2);
//line(0,0,mouse.x,mouse.y);
//}
//______________________________________

//速度和随机速度
Mover mover;
void setup() {
  size(800, 400);
  mover = new Mover();
  frameRate(120);
}
void draw() {
  background(255, 50);
  //noStroke();
  //fill(255, 100);
  //rect(0, 0, width, height);
  mover.display();
  mover.update();
  mover.checkEdges();
}
class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r, topspeed;
  Mover() {
    location = new PVector(random(r, width-r), random(r, height-r));
    //location = new PVector(width,height);

    velocity = new PVector(0, 0);
    acceleration = new PVector(random(-0.02, 0.02), random(-0.02, 0.02));

    topspeed =16;
    r =16;
  }
  void update() {
    acceleration =  PVector.random2D();//PVector.random2D()函数返回一个长度为1，方向随机的向量
    acceleration.mult(random(1.2));
    location.add(velocity);
    velocity.add(acceleration);
    velocity.limit(topspeed);
  }
  void display() {
    stroke(0);
    fill(0);
    ellipse(location.x, location.y, r*2, r*2);
  }
  void checkEdges() {
    if (location.x>width-r || location.x<r) {
      velocity.x*=-1;
    }
    if (location.y>height-r || location.y<r) {
      velocity.y*=-1;
    }
  }
}
