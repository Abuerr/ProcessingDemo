int x, y, i;



void setup() {
  size(800, 800);
  background(0, 0, 0);
  smooth();
  colorMode(HSB, 360, 100, 100);
  noStroke();
}

void draw() {
  for (y=0; y<height; y+=100 ) {
    for (x=0; x<width; x+=100 ) {
      for (i=0; i<8; i++ ) {
        fill(random(360), 100, 100, random(50, 100));
        ellipse(x+random(30), y+random(30), random(50), random(50));
      }
    }
  }
}
