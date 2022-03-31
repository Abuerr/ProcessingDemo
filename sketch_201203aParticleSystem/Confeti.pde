class Confeti extends Particle {
  Confeti(PVector l) {
    super(l);
  }
  void display() {
    rectMode(CENTER);
    
    if (random(0, 1)>0.5) {
      fill(#5FC9E5,lifespan);
      rect(location.x, location.y, 15,15);
    } else if(random(0, 1)>0.8){
      fill(#E55F7A,lifespan);
      ellipse(location.x, location.y, 15,15);
    }else{
      drawStar(location.x, location.y,15);
    }
    noStroke();
    pushMatrix();
    translate(location.x,location.y);
    float theta = map(location.x,location.y,width,0,TWO_PI*2);
   rotate(theta);
   rect(0,0,12,12);
    popMatrix();
  }
  void drawStar(float x,float y,int r){
  beginShape();
  vertex(x,y-r);
  vertex(x+r*sin(PI/5),y+r*cos(PI/5));
  vertex(x-r*cos(PI/10),y-r*sin(PI/10));
  vertex(x+r*sin(PI/10),y+r*cos(PI/10));
  vertex(x-r*sin(PI/5),y+r*cos(PI/5));
  endShape(CLOSE);
  
  }
}
