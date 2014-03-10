void setup(){
  size(480,120);
}

void mydraw() {
  if (mousePressed){
    fill(0);
  } else{
    fill(255);
  }
  ellipse(mouseX,mouseY, 80,80);
}

void draw(){
  mydraw();
}
