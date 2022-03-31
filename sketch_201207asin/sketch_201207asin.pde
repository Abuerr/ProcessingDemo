//模拟简谐运动
//void setup() {
//  size(800, 800);
//  background(255);
//}
//void draw() {
//  //残影效果
//  noStroke();
//  fill(255, 5);
//  rect(0, 0, width, width);

//  float period =120;//周期
//  float amplitude = 300;//振幅
//  //根据简谐运动的公式计算水平位置
//  float x = amplitude*sin(TWO_PI*frameCount/period);

//  stroke(0);
//  strokeWeight(2);
//  fill(127);
//  translate(width/2, height/2);
//  line(0, 0, x, 0);
//  ellipse(x, 0, 48, 48);
//}

//____________________________________________________
//带有角速度的震荡
float angle = 0;
float aVelocity = 0.03;
void setup() {
  size(800, 800);
  background(255);
}
void draw() {
  //残影效果
  noStroke();
  fill(255, 5);
  rect(0, 0, width, width);

  //float period =120;//周期
  float amplitude = 300;//振幅
  //根据简谐运动的公式计算水平位置
  //float x = amplitude*sin(TWO_PI*frameCount/period);
    float x = amplitude*sin(angle);
    angle += aVelocity;


  //stroke(0);
  //strokeWeight(2);
  noStroke();
  fill(#F27575);
  translate(width/2, height/2);
  line(0, 0, x, 0);
  ellipse(x, 0, 48, 48);
}
