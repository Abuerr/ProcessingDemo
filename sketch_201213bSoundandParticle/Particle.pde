//class Particle {
//  float x, y, py, w, speed;
//  Particle(float x, float y) {
//    this.x = x;
//    this.y = y;
//    this.py = y;
//    w = random(2,10);
//    speed = random(.1, 1);
//  }

//  void update(float rms) {
//    py = y;
//    y+=speed*rms*100;
//    border();
//  }

//  void border() {
//    if (y>height) {
//      x=random(width);
//      y=0;
//      py=y;
//    }
//  }
//  void display() {
//    stroke(0);
//    strokeWeight(w);
//    line(x,py,x,y);
//  }
//}
//______________________________

////横向的particle

//class Particle {
//  float x, y, px, w, speed;
//  Particle(float x, float y) {
//    this.x = x;
//    this.y = y;
//    this.px = x;
//    w = random(2, 10);
//    speed = random(.1, 1);
//  }

//  void update(float level) {
//    px = x;
//    x+=speed*level*1000;
//    border();
//  }

//  void border() {
//    if (px>height) {
//      x=random(width);
//      y=0;
//      px=x;
//    }
//  }
//  void display() {
//    stroke(#72F0D7);
//    strokeWeight(w);
//    line(x, px, x, y);

//    //stroke(#44E8D9);
//    //strokeWeight(w);
//    //point(x,y);

//    //stroke(#E84465);
//    //strokeWeight(w);
//    //point(x,py);
//  }
//}


//横向的particle

class Particle {
  float x, y, px, w, speed;
  Particle(float x, float y) {
    this.x = x;
    this.y = y;
    this.px = x;
    w = random(2, 10);
    speed = random(.1, 1);
  }

  void update(float level) {
    px = x;
    x+=speed*level*1000;
    border();
  }

  void border() {
    if (px>width) {
      y=random(height);
      x=0;
      px=x;
    }
  }
  void display() {
    stroke(#72F0D7);
    strokeWeight(w);
    line(px, y, x, y);

  }
}
