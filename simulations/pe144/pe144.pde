double x,y;
double xp,yp;
MyVector pn;
MyVector pp;
boolean keepgoing = true;
int counter = 0;
//int saveflag = 3;

void setup() {
  background(0);
  size(300,600);
  translate(width/2,height/2);
  scale(20);
  strokeWeight(0.1);
  smooth();
  //fill(0,0,0,0);
  fill(255);
  ellipseMode(RADIUS);
  ellipse(0,0,5,10);
  pn = new MyVector(1.8377, 9.3);
  pp = new MyVector(4,10.1);
}

void draw(){
  if(keepgoing){
    translate(width/2,height/2);
    scale(20);
    strokeWeight(0.05);
    stroke(111,120,220);
    line((float)pp.x,(float)pp.y,(float)pn.x,(float)pn.y);
    MyVector pbuf = new MyVector(pn.x,pn.y);
    pn = next(pn,pp);
    pp = new MyVector(pbuf.x, pbuf.y);
    if (-0.01 <= pp.x && pp.x <= 0.01 && pp.y>0){
      println(counter);
      keepgoing = false;
    } else {
      counter++;
      //saveflag--;
      //if(saveflag==0){
      //  saveFrame("pic####.png");
      //  saveflag=3;
      //}
    }
  } else {
    noLoop();
  }
}

class MyVector{
  double x;
  double y;
  
  MyVector(double x, double y){
    this.x = x;
    this.y = y;
  }
}


MyVector next(MyVector v1, MyVector v0){
  double alpha;
  double comx;
  double comy;
  double gamma;
  double nx,ny;
  alpha = (4*v1.x*v1.x - 4*v1.x*v0.x + v1.y*v1.y - v1.y*v0.y)/(16*v1.x*v1.x + v1.y*v1.y);
  comx = v1.x - v0.x - 8*alpha*v1.x;
  comy = v1.y - v0.y - 2*alpha*v1.y;
  gamma = -2*(4*comx*v1.x + comy*v1.y)/(4*comx*comx + comy*comy);
  nx = v1.x + comx*gamma;
  ny = v1.y + comy*gamma;
  return new MyVector(nx,ny);
}

