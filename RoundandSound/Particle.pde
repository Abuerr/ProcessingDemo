class Particle {
  
  float r, angle, d;//中心圆的直径r，周围小圆的旋转角度和直径
  PImage img;
  int[] c = new int[3];//颜色数组
  Particle(float r, float d) {
    this.r =r;
    this.angle = random(radians(0), 2*PI);
    this.d = d;
    img = loadImage("aespa.png");//aespa的照片
    for(int j=0;j<3;j++){
      c[j]=0;
    }
  }

  //调用下面两个方法
  void run(float rms) {
    display(rms);
    update(rms);
  }
  
  //周围小圆点位置更新，形成轨迹
  void update(float rms) {
    //使旋转角度随音频振幅大小变化
    angle+=rms/18;
  }

  //展示
  void display(float rms) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(angle);

    colorChange(rms);//利用振幅的变化改变小球颜色
    float radius = map(rms, 0, 1, 0, 600);
    
    ellipseMode(CENTER);
    ellipse(0, 0, radius, radius);
    ellipse(r, r, d, d);
    
    imageMode(CENTER);
    image(img, 0, 0, 200, 200);
    popMatrix();
  }

  //颜色随振幅参数改变
  void colorChange(float rms) {

    colorMode(HSB);
    noStroke();
    fill(c[0], c[1], c[2]);
    
    int ca =(int)map(rms, 0, 1, 0,10);

     for (int i=0; i<c.length; i++) {
      c[i]+=ca;
      if(c[i]>255||c[i]<0){       
       c[i]=0; //当颜色值大于255时使之清零
      }
    }


  }
}
