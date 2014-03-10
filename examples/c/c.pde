void setup() {
  int x = 200;
  int y = 200;
  size(x, y);
  background(0);
  noStroke();
  smooth();
};

void draw(){
  fill(244);
  translate(10,10);
  rect(40,40,50,50);
  scale(2);
  rect(40,40,50,50);
};
