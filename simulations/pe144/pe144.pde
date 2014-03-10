void setup() {
  size(300,600);
  translate(width/2,height/2);
  scale(20);
  strokeWeight(0.1);
  smooth();
  fill(0,0,0,0);
  ellipseMode(RADIUS);
  ellipse(0,0,5,10);
}

void draw() {
  translate(width/2,height/2);
  scale(20);
  strokeWeight(0.01);
  stroke(255,100,100);
  line(0,10.1,1.4,-9.6);
}
