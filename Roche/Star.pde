//背景流星和星星

class Stars {
  int star_num;//星星的数量
  int meteor_num;//流星的数量
  PVector[] stars_p, meteor_p, velocity;//星星和流星的位置,流星的速度
  PVector acceleration;
  float rms;

  Stars(int num, int meteor_num) {
    this.star_num = num;
    this.meteor_num = meteor_num;
    stars_p = new PVector[num];
    meteor_p =new PVector[meteor_num];
    velocity = new PVector[meteor_num];
    rms = this.rms;

    //星星位置初始化
    float x1 = 0;
    float y1 = 0;
    for (int i=0; i<star_num; i++) {
      float x= map(noise(x1), 0, 1, 0, width);
      float y =map(noise(y1), 0, 1, 0, height);
      stars_p[i] = new PVector(x, y);
      y1+=30;
      x1+=0.5;
    }

    //流星初始化
    for (int i=0; i<meteor_num; i++) {
      //初始化流星的位置
      meteor_p[i] = new PVector(random(width), random(height));
      //初始化流星的速度
      float a = int(random(1, 2));
      float b= int(random(1, 2));
      velocity[i] = new PVector(rms, rms);
    }
  }

  void display() {
    //画星星
    for (int i=0; i<star_num; i++) {
      if (i%30==0) {
        //大一点点的星星
        stroke(#edccf7);
        fill(#edccf7);
        ellipse(stars_p[i].x, stars_p[i].y, 2, 2);
      } else {
        stroke(255);
        point(stars_p[i].x, stars_p[i].y);
      }
    }

    //画流星
    for (int i =0; i<meteor_num; i++) {
      float m =random(0, 1);
      float c = random(5);
      if (c>4) {
        stroke(#edccf7);
      } else {
        stroke(0);
      }
      if (m>meteor_num/2) {

        point(meteor_p[i].x, meteor_p[i].y);
      } else {

        ellipse(meteor_p[i].x, meteor_p[i].y, random(5), random(3));
      }
    }
  }


  //流星位置更新
  void update(float rms) {
    for (int i=0; i<meteor_num; i++) {
      velocity[i].x=rms;
      velocity[i].y =rms;
      meteor_p[i].add(velocity[i]);
    }
  }

  void checkEdge() {
    for (int i=0; i<meteor_num; i++) {
      if (meteor_p[i].x>width) {
        meteor_p[i].x=0;
      }

      if (meteor_p[i].y>height) {
        meteor_p[i].y=0;
      }
    }
  }
}
