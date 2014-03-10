int len = 400;
float x = -2.3;
float y = -2;
//float x = -2;
//float y = 8;
int n = 20000;
int counter = 0;

void setup(){
  size(len,len);
  smooth();
}

void draw(){
  translate(len/2,len/2);
  scale(8);
  strokeWeight(0.01);
  if (counter <= 50){
    stepnext();
    //saveFrame("pic###.png");
    println(counter);
    counter ++;
  } else {
    noLoop();
  }
}
void stepnext(){
  for (int i=0; i<=n; i++){
    point(x,y);
    float nextx, nexty;
    nextx = y + 0.2*x + 5*x/(1+x*x);
    nexty = -x;
    x = nextx;
    y = nexty;
  }
}
