int sizex = 500;
int sizey = 500;
int boxwidth = 10;
boolean[][] painted = new boolean[sizex/boxwidth][sizey/boxwidth];

void setup(){
  size(sizex,sizey);
  background(200);
  noStroke();
  colorMode(HSB);
  rectMode(CENTER);
  //println(painted[0][0]);
}

void draw(){
  int chosenx, choseny;
  do {
  chosenx = int(random(0,sizex/boxwidth));
  if (chosenx == sizex){chosenx = sizex-1;}
  choseny = int(random(0,sizey/boxwidth));
  if (choseny == sizey){choseny = sizey-1;}
  }
  while(painted[chosenx][choseny]);
  painted[chosenx][choseny]=true;
  fill(random(255),200,200);
  rect(chosenx*boxwidth,choseny*boxwidth,boxwidth,boxwidth);
}



