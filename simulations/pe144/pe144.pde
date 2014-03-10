float x,y;
float xp,yp;
MyVector pn;
MyVector pp;

void setup() {
  size(300,600);
  translate(width/2,height/2);
  scale(20);
  strokeWeight(0.1);
  smooth();
  fill(0,0,0,0);
  ellipseMode(RADIUS);
  ellipse(0,0,5,10);
  pn = new MyVector(1.4, -9.6);
  pp = new MyVector(0.0,10.1);
}

void draw() {
  translate(width/2,height/2);
  scale(20);
  strokeWeight(0.01);
  stroke(255,100,100);
  line(pp.x,pp.y,pn.x,pn.y);
  MyVector pbuf = new MyVector(pn.x,pn.y);
  pn = next(pn,pp);
  pp = new MyVector(pbuf.x, pbuf.y);
}

class MyVector{
  float x;
  float y;
  
  MyVector(float x, float y){
    this.x = x;
    this.y = y;
  }
}

MyVector next(MyVector v1, MyVector v0){
  float alpha;
  float comx;
  float comy;
  float gamma;
  float nx,ny;
  alpha = (4*v1.x*v1.x - 4*v1.x*v0.x + v1.y*v1.y - v1.y*v0.y)/(16*v1.x*v1.x + v1.y*v1.y);
  comx = v1.x - v0.x - 8*alpha*v1.x;
  comy = v1.y - v0.y - 2*alpha*v1.x;
  gamma = 2*(4*comx*v1.x + comy*v1.y)/(4*comx*comx + comy*comy);
  nx = v1.x + comx*gamma;
  ny = v1.x + comy*gamma;
  return new MyVector(nx,ny);
}

