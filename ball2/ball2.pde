
int n=5;
float[] x=new float[n];
float[] y=new float[n];
int[] dx=new int [n];
int[] dy=new int[n];
float[] sx=new float[n];
float[] sy=new float[n];
float[] r=new float[n];

void setup() {
  size(500, 500);
  frameRate(24);
  smooth();
  //background(0);
  for (int i=0; i<n; i++) {
    x[i]=random(width);
    y[i]=random(height);
    dx[i]=int(random(height));
    dy[i]=int(random(3))-1;
    dx[i]=int(random(3))-1;
    sx[i]=random(width/10);
    sy[i]=random(height/10);
    r[i]=int(random(50, 80));
  }
}
void draw() {
  //fill(0, 0,0,90);
  //rect(0,0,width,height);
  //noStroke();
  background(0, 0, 0, 90);
  for (int i=0; i<n; i++) {
    ellipse(x[i], y[i], r[i], r[i]);
    if (x[i]+(r[i]/2)*dx[i]>=width || x[i]+(r[i]/2)*dx[i]<=0) {
      dx[i]=(-1)*dx[i];
      fill(random(255), random(255), random(255));
    }
    if (y[i]+(r[i]/2)*dy[i]>=width || y[i]+(r[i]/2)*dy[i]<=0) {
      dy[i]=(-1)*dy[i];
      fill(random(255), random(255), random(255));
    }
    x[i]=x[i]+dx[i]*sx[i];
    y[i]=y[i]+dy[i]*sy[i];
  }
}
