float GM = 2500;
int planetnum = 30;
Mass sun = new Mass(0,0,0,0,0);
Mass planets[] = new Mass[planetnum];
double dt = 0.001;
int steps = 1000;
int wid = 800;
int hei = 800;
boolean isanyalive = true;

void setup(){
  size(wid,hei);
  ellipseMode(CENTER);
  for(int i=0;i<planetnum;i++){
    planets[i] = new Mass(50,0,0,5.8+0.2*i,100);
  }
  noStroke();
}

void draw(){
  if (isanyalive){
    saveFrame("img####.png");
    colorMode(RGB);
    fill(90,90,90,9);
    rect(0,0,width,height);
    translate(width/2,height/2);
    fill(255,100,100);
    ellipse(0,0,20,20);
    colorMode(HSB);
    isanyalive = false;
    for(int n=0;n<planetnum;n++){
      Mass earth = planets[n];
      if (earth.isalive){
        isanyalive=true;
        //scale(0.1);
        //background(0);
        fill(n*255/(planetnum),255,200);
        for (int i=0; i<steps; i++){
          ellipse((float) earth.r.x, (float) earth.r.y,1,1);
          double ax, ay;
          ax = -GM*earth.r.x / earth.r.nrmth();
          ay = -GM*earth.r.y / earth.r.nrmth();
          earth.movewith(ax,ay);
        }
        
        if (earth.r.x < -wid || earth.r.x > wid
            || earth.r.y < -hei || earth.r.x > hei
            || (earth.r.x < 0.1 && earth.r.x > -0.1 &&
                earth.r.y < 0.1 && earth.r.y > -0.1)){
          earth.die();
          println("%d died!",n);
        }
        //println(earth.v.nrm()*earth.v.nrm()/2 - GM/earth.r.nrm());
      }
    }
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
    this.r = this.r.add(this.v.multi(dt));
    this.v = this.v.add(new MyVector(ax*dt,ay*dt));
  }
  void movewith(MyVector a){
    this.r = this.r.add(this.v.multi(dt));
    this.v = this.v.add(a.multi(dt));
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
  
  MyVector multi(double times){
    return new MyVector(this.x*times, this.y*times);
  }

   MyVector multi(float times){
    return new MyVector(this.x*times, this.y*times);
  }

   MyVector multi(int times){
    return new MyVector(this.x*times, this.y*times);
  }
  
  double nrm(){
    return Math.sqrt(this.x*this.x + this.y*this.y);
  }
  
  double nrmth(){
    double vo = this.x*this.x + this.y*this.y;
    return vo * Math.sqrt(vo);
  }
}
