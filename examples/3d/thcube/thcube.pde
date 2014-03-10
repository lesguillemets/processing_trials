float rx = 0.0;
float ry = 0.0;
float rz = 0.0;
void setup(){
  size(300,300,P3D);
  smooth();
}

void draw(){
  background(204);
  //translate(-100,-100,-100);
  scale(0.5);
  translate(width,height,0);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  pushMatrix();
  //translate(-50,-50,-50);
  fill(0,120,200);
  box(100,100,100);
  popMatrix();
  pushMatrix();
  fill(0,200,120);
  translate(-100,-100,-100);
  box(100,100,100);
  popMatrix();
  //rect(-50,-50,100,100);
}

void keyPressed() {
  switch (keyCode){
    case UP:
      rx -= 0.1;
      break;
    case DOWN:
      rx += 0.1;
      break;
    case LEFT:
      ry -= 0.1;
      break;
    case RIGHT:
      ry += 0.1;
      break;
  }
}
