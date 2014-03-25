int sizex = 500;
int sizey = 500;
int boxwidth = 10;
boolean[][] painted = new boolean[sizex/boxwidth][sizey/boxwidth];
int rest = sizex/boxwidth*sizey/boxwidth;
int timesatonce = 5;

void setup(){
  size(sizex,sizey);
  background(200);
  noStroke();
  colorMode(HSB);
  rectMode(CENTER);
  //println(painted[0][0]);
}

void draw(){
  if (rest>0){
    rectMode(RECT);
    fill(100,0,200,5);
    rect(0,0,width,height);
    rectMode(CENTER);
    for(int i=0; i<timesatonce; i++){
      int chosenx, choseny;
      do {
      chosenx = int(random(0,sizex/boxwidth));
      if (chosenx == sizex){chosenx = sizex-1;}
      choseny = int(random(0,sizey/boxwidth));
      if (choseny == sizey){choseny = sizey-1;}
      }
      while(painted[chosenx][choseny]);
      painted[chosenx][choseny]=true;
      rest--;
      fill(random(255),200,200);
      rect(chosenx*boxwidth,choseny*boxwidth,boxwidth,boxwidth);
    }
  } else {
    //println("foo");
    noLoop();
  }
}



