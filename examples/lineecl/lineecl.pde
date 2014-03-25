void setup(){
  size(500,1000);
  translate(width/2, height/2);
  scale(50);
  float cx = -5;
  float cy = 0;
  for (float d=0.005; d<=10; d+=0.005){
    float x = cx + d;
    float y;
    y = (float) Math.sqrt(100-4*x*x);
    strokeWeight(0.01);
    point(x,y);
    point(x,-y);
  }
}

