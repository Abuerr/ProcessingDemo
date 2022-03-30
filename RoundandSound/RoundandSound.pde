import processing.sound.*;
//导入sound库，这个是要自己下载的：速写本——引用库文件——添加库文件——Libraries搜索栏输入：sound——选择搜索结果中的sound然后install
AudioIn audio;
Amplitude amp;
//振幅影响速度
String filename;
Particle[] particles;
SoundFile file;

void setup() {
  size(1000, 1000);
  smooth();
  background(0);

  particles =new Particle[4];//周围想几个轨迹就设置几个圆
  for (int i=0; i<particles.length; i++) {
    particles[i]=new Particle(random(150, 300), 5);
  }

  //指定音乐文件播放
  file = new SoundFile(this, "Black_mamba.mp3");
  file.play();

  //采集音频振幅
  amp = new Amplitude(this);
  amp.input(file);
  
  //保存图片
  filename = this.getClass().getName();
}

void draw() {
  fill(0, 10);
  noStroke();
  rect(0, 0, width, height);

  float rms = amp.analyze();//返回音频振幅数据
  rms = constrain(rms, 0, 1);

  for (int i=0; i<particles.length; i++) {
    particles[i].run(rms);

  }
}

//鼠标点击界面即可保存图片
void mousePressed() {
  saveFrame(filename+".jpg");
}
