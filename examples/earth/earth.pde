float GM = 2500;
Mass sun = new Mass(0,0,0,0,0);
Mass earth;
int wid = 800;
int hei = 800;

void setup(){
  size(wid,hei);
  ellipseMode(CENTER);
  earth = new Mass(92,0,0,5.2,100);
  noStroke();
}

void draw(){
  if (earth.isalive){
    //scale(0.1);
    //background(0);
    fill(90,90,90,9);
    rect(0,0,width,height);
    translate(width/2,height/2);
    fill(255,100,100);
    ellipse(0,0,20,20);
    fill(0,255,100);
    ellipse((float) earth.r.x, (float) earth.r.y,10,10);
    double ax, ay;
    //ax = -GM*earth.r.x / Math.pow(earth.r.nrm(),3);
    ax = -GM*earth.r.x / earth.r.nrmth();
    //ay = -GM*earth.r.y / Math.pow(earth.r.nrm(),3);
    ay = -GM*earth.r.y / earth.r.nrmth();
    //println(earth.r.x, earth.r.y, "\t", earth.v.x, earth.v.y,"\t",ax, ay);
    earth.movewith(ax,ay);
    
    if (earth.r.x < -wid/2 || earth.r.x > wid/2
        || earth.r.y < -hei/2 || earth.r.x > hei/2
        || (earth.r.x < 0.1 && earth.r.x > -0.1 &&
            earth.r.y < 0.1 && earth.r.y > -0.1)){
      earth.die();
    }
    println(earth.v.nrm()*earth.v.nrm()/2 - GM/earth.r.nrm());
  } else {
    noLoop();
  }
}

class Mass {
  MyVector r;
  MyVector v;
  float m;
  boolean isalive;
  
  Mass(double x, double y, double vx, double vy, float m){
    //PVector doesn't seem to support double.
    this.r = new MyVector(x,y);
    this.v = new MyVector(vx,vy);
    this.m = m;
    this.isalive = true;
  }
  Mass(MyVector r, MyVector v, float m){
    this.r = r;
    this.v = v;
    this.m = m;
  }
  
  void movewith(double ax, double ay){
    this.r = this.r.add(this.v);
    this.v = this.v.add(new MyVector(ax,ay));
  }
  void movewith(MyVector a){
    this.r = this.r.add(this.v);
    this.v = this.v.add(a);
  }
  
  void die(){
    this.isalive = false;
  }
}

class MyVector {
  double x;
  double y;
  
  MyVector(double x, double y){
    this.x = x;
    this.y = y;
  }
  
  MyVector add(MyVector other){
    return new MyVector(this.x+other.x, this.y+other.y);
  }
  
  double nrm(){
    return Math.sqrt(this.x*this.x + this.y*this.y);
  }
  
  double nrmth(){
    double vo = this.x*this.x + this.y*this.y;
    return vo * Math.sqrt(vo);
  }
}


