void setup() {
  int x = 200;
  int y = 200;
  size(x, y);
  background(0);
  noStroke();
  smooth();
};

int counter = 0;
void draw(){
  if (counter < 100){
    nextframe();
    //saveFrame("newpic####.png");
    //print(keyPressed);
    //print(key);
    //print("\n"); //about 60
  } else{
    noLoop();
  }
}

void nextframe(){
  fill(0,10);
  rect(0,0,width,height);
  fill(int(random(0,255)),int(random(0,255)),int(random(0,255)));
  float varsize = random(-10,10);
  ellipse(random(0,width), random(0,height),
     30 + varsize, 30 + varsize);
  counter = counter+1;
}
