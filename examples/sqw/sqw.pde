// 3-27.
void setup(){
  size(320,240);
  noFill();
  smooth();
  rectMode(CENTER);
}

float angle = 0.0;

void draw(){
  background(200);
  stroke(255);
  translate(160,120);
  rect(0,0,160,160);
  
  rotate(angle);
  stroke(0,0,255);
  rect(0,0,160,160);
  angle += 0.01;
}

