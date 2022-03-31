Oscillator[] oscillators =new Oscillator[5];

void setup() {
  size(800, 400);
  smooth();
  for (int i =0; i<oscillators.length; i++) {
    oscillators[i] = new Oscillator();
  }
}

void draw() {
  background(255, 50);
  noStroke();
  fill(255, 10);
  rect(0, 0, width, height);

  rectMode(CENTER);
  for (int i =0; i<oscillators.length; i++) {
    oscillators[i].oscillator();
    oscillators[i].display();
  }
}


class Oscillator {
  PVector angle;
  PVector aVelocity;
  PVector amplitude;

  Oscillator() {
    angle = new PVector();
    aVelocity = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    amplitude = new PVector(random(20, width/2), random(20, height/2));
  }
  void  oscillator() {
    angle.add(aVelocity);
  }
  void display() {

    float x = sin(angle.x)*amplitude.x;
    float y = sin(angle.y)*amplitude.y;

    pushMatrix();
    translate(width/2, height/2);

    stroke(#FA8888);
    strokeWeight(2);
    fill(random(255), random(255), random(255), random(255));
    line(0, 0, x, y);
    noStroke();
    ellipse(x, y, random(32), random(32));
    popMatrix();
  }
}
