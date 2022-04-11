import processing.sound.*; //所用到的库sound
Planet planet;
Stars s;
Satellite[] satellites;
//音乐
AudioIn audio;
Amplitude amp, amp2;
SoundFile file;

//保存图片
String filename;
int j;
void setup() {
  size(1980, 1080);
  background(0);
  planet = new Planet();


  s = new Stars(3000, 30);//初始化星空背景

  satellites =new Satellite[20];//初始化卫星
  for (int i=0; i<satellites.length; i++) {
    satellites[i] = new Satellite(150+i*50, 20+i*10);
  }

  file = new SoundFile(this, "小瀬村晶 - Love Theme.mp3");
  file.loop();
  file.play();

  //收播外部的声音，营造氛围感，声音会更有空灵感
  audio = new AudioIn(this, 0);
  audio.play();
  audio.start();

  //分析背景音乐的振幅
  amp = new Amplitude(this);
  amp.input(file);

  //输入麦克风传来的声音的振幅
  amp2 = new Amplitude(this);
  amp2.input(audio);

  //图片保存
   j=0;
  filename = "Listening";
}

void draw() {
  //background(0, 200);
  noStroke();
  fill(0, 18);
  rect(0, 0, width, height);



  //音乐文件的声音改变背景流星的运动速度
  float rms = amp.analyze();
  rms = map(rms, 0, 1, 0.8, 2);
  //println(rms);

  //分析麦克风传入的声音
  float rms2 = amp2.analyze();
  //rms = map(rms2, 0, 1, 0.5, 1);
  //println(rms2);

  s.display();
  s.update(rms);
  s.checkEdge();

  for (int i=0; i<satellites.length; i++) {
    //planets[i].display();
    satellites[i].update2(rms2);
  }
  planet.display();
  planet.update();

//点击"a"或"A"保存当前画面为图片
  if (keyPressed) {
    if (key == 'a' || key == 'A') {
       saveFrame(filename+j+".jpg");
       j++;
    }
  }
}

void mousePressed() {
  s = new Stars(3000, 30);
  for (int i=0; i<satellites.length; i++) {
    satellites[i] = new Satellite(150+i*30, 20+i*10);
  }
}
