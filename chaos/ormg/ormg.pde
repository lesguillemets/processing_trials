/* p.106
 x_{n+1} = yn + axn
 y_{n+1} = xn**2 + b
*/

int len = 1600;
int counter = 0;
int n = 5000;
int hue = 0;
int loop = 200;
float scaler = 500;
boolean abprinted = false;

float x = 0;
float y = 0;
//float a = 0.4;
//float b = -1.2;
//float a = random(0,1);//0.42;
//float b = -random(1,2);//-1.2;
//0.52629083 -1.0805439
//0.42371744 -1.2206726
//0.3157069 -1.3268687
// 0.11549026 -1.5268558
float a= 0.18525845; float b=-1.1336243;
void setup(){
  size(len*3/2,len);
  background(0);
  //smooth();
}

void draw(){
  translate(len/2, len/2);
  scale(scaler);
  strokeWeight(0.001);
  if (counter <= loop){
    stepnext();
    println(counter);
    counter ++;
  } else {
    if (abprinted){
      noLoop();
    } else {
      println("______________");
      println(a,b);
      println("______________");
      abprinted = true;
      saveFrame("coloredfoo3.png");
    }
  }
  if(keyPressed){
    println(x,y);
  }
}

void stepnext(){
  colorMode(HSB,loop);
  stroke(loop*200/360,loop,hue);
  for (int i=0; i<=n; i++){
    point(x,y);
    float nextx, nexty;
    nextx = y + a*x;
    nexty = x*x + b;
    x = nextx;
    y = nexty;
  }
  hue++;
}
