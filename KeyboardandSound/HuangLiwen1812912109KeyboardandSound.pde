/**
 * This example shows how to make a simple keyboard-triggered sampler with the Sound
 * library. In this sketch 5 different short samples are loaded and played back at
 * different speeds, which also changes their perceived pitch by one or two octaves.
 */

/*
原版：
 这个例子展示了如何用声音库制作一个简单的键盘触发采样器。
 在这个草图中，5个不同的短样本被加载并以不同的速度回放，这也改变了他们感知的音高一个或两个八度。按不同的键时背景颜色也随之改变。
 */
//导入sound库
import processing.sound.*;

//声明一个数组名为file，类型为SoundFile
SoundFile[] file;

// Define the number of samples 定义数组的长度
int numsounds = 5;

// Define a variable to store the randomly generated background color in
// 定义一个数组来存储随机产生的背景颜色
int backgroundColor[] = {255, 255, 255};

//————————————————————————————————————————

void setup() {
  size(600, 600);
  noStroke();



  // Create a Sound renderer and an array of empty soundfiles
  //创建一个声音渲染器和一个空的声音数组文件
  file = new SoundFile[numsounds];

  // Load 5 soundfiles from a folder in a for loop. By naming
  // the files 1.aif, 2.aif, 3.aif, ..., n.aif it is easy to iterate
  // through the folder and load all files in one line of code.
  for (int i = 0; i < numsounds; i++) {
    file[i] = new SoundFile(this, (i+1) + ".aif");
  }
}
//——————————————————————————————

void draw() {

  background(backgroundColor[0], backgroundColor[1], backgroundColor[2]);
  fill(0, 100);
  textSize(20);
  text("Please Press the key", 10, 100);
}


//————————————————————————————————————

void keyPressed() {
  // We use a boolean helper variable to determine whether one of the branches
  // of the switch-statement was activated or not
  //我们使用一个布尔辅助变量来确定switch-statement的一个分支是否被激活

  boolean validKey = true;

  switch(key) {
  case 'a':
    file[0].play(0.5, 1.0); 
    fireSpark(5, 30, 30, 30);
    break;

  case 's':
    file[1].play(0.5, 1.0);
    fireSpark(5, 30, 60, 60);
    break;

  case 'd':
    file[2].play(0.5, 1.0);
    fireSpark(5, 30, 10, 10);
    break;

  case 'f':
    file[3].play(0.5, 1.0);
    circle(10, 100, 300, 40);
    break;

  case 'g':
    file[4].play(0.5, 1.0);
    circle(10, 150, 300, 10);
    break;

  case 'h':
    file[0].play(1.0, 5.0);
    fill(255);    
    circle(10, 200, 300, 10);
    circle(10, 200, 300, 7);
    break;

  case 'j':
    file[1].play(1.0, 1.0);
    fill(255);
    ellipse(mouseX, mouseY, 300, 300);
    fill(random(255));
    ellipse(mouseX, mouseY, 250, 250);
    break;

  case 'k':
    file[2].play(1.0, 1.0);
    fill(255);
    rectMode(CENTER);
    rect(mouseX, mouseY, 300, 300);
    fill(random(255));
    rect(mouseX, mouseY, 250, 250);
    break;

  case 'l':
    file[3].play(1.0, 1.0);
    getBall(10);
    break;

  case ';':
    file[4].play(1.0, 1.0);
    getBall(15);
    break;

  case '\'':
    file[0].play(2.0, 1.0);
    fill(255);
    ellipse(mouseX, mouseY, 300, 300);
    fill(random(255));
    ellipse(mouseX, mouseY, 250, 250);
    break;

  case 'q':
    file[1].play(2.0, 1.0);
    drawR(50, 10, 10);
    break;

  case 'w':
    file[2].play(2.0, 1.0);
    drawR(100, 20, 20);
    break;    

  case 'e':
    file[3].play(2.0, 1.0);
    drawR(150, 30, 10);
    break;

  case 'r':
    file[4].play(2.0, 1.0);
    fill(255);
    ellipse(300, 300, 300, 300);
    fill(random(255));
    ellipse(300, 300, 250, 250);
    break; 

  case 't':
    file[0].play(3.0, 1.0);
    break;

  case 'y':
    file[1].play(3.0, 1.0);
    fill(255);
    rectMode(CENTER);
    rect(300, 300, 300, 300);
    fill(random(255));
    rect(300, 300, 250, 250);
    break;

  case 'u':
    file[2].play(3.0, 1.0);
    textSize(150);
    text("Hello", 0, 300);
    break;    

  case 'i':
    file[3].play(3.0, 1.0);
    textSize(150);
    text("World", 200, 300);
    break;

  case 'o':
    file[4].play(3.0, 1.0);
    textSize(50);
    text("Hello World", 180, 300);
    break;

  case 'p':
    file[0].play(4.0, 1.0);
    textSize(150);
    text("Hello World", 0, 300);
    break;    

  case '[':
    file[1].play(4.0, 1.0);
    textSize(100);
    fill(255);
    text("hello world", 0, 250);
    text("hello world", 0, 150);
    text("hello world", 0, 50);
    text("hello world", 100, 450);
    text("hello world", 100, 600);
    break;

    // no valid key was pressed, store that information
  default:
    validKey = false;
  }

  // If a new sample playback was triggered, change the background color
  if (validKey) {
    for (int i = 0; i < 3; i++) {
      backgroundColor[i] = int(random(255));
    }
  }
}

void fireSpark(int r_num, int e_num, int d, int z) {
  for (int i=0; i<r_num; i++) {
    fill(random(255), random(255), random(255), (255/r_num)*(i+1));
    for (int j=0; j<e_num; j++) {
      float theta = 2*PI*j/e_num;
      float x = sin(theta)*(z+d*i)+width/2;
      float y = cos(theta)*(z+d*i)+height/2;
      ellipse(x, y, d, d);
    }
  }
  z++;
  if (z>width/2) {
    z=10;
  }
}

void circle(int z, int k, int a, int r) {
  float x, y;
  for (int i=0; i<z; i++) {
    float theta = 2*PI*i/z;
    x = sin(theta)*k+a;
    y = cos(theta)*k+a;
    ellipse(x, y, 40, 40);
  }
}
void getBall(int num) {

  for (int i=0; i<num; i++) {
    ellipse(random(width), random(height), i*20, i*20);
  }
}
void drawR(float r, int z, int d) {
  for (int i=2; i<z; i++) {
    float theta = 2*PI*i/z;
    float x = sin(theta)*r+300;
    float y = cos(theta)*r+300;
    rectMode(CENTER);
    rect(x, y, d, d);
  }
}
