int sizex = 300; // size x
int sizey = 300; // size y
int gridwidth = 14; // grid to contain squares
int squarewidth = 40; // (mean) width of each square
int n=0; // proceeding
int nmax = (sizex+sizey)/gridwidth-2; // maximum steps
float sizevar = 0.8;  // ratio of variant / size
float sizevar_s = gridwidth*sizevar/2; // 0.8--1--1.2 makes 0.4 var width.
Square[][] squares = new Square[sizex/gridwidth][sizey/gridwidth];
int uptime = 42;
int waittime = 3;
int waitcounter = waittime;
int record = 4;

void setup() {
  size(sizex,sizey);
  background(200);
  noStroke();
  colorMode(HSB);
  rectMode(CENTER);
  setupSquares();
}

void draw(){
  if (n<=nmax+uptime){
  background(200);
    for (int row=0; row<=n; row++){
      for(int x=max(0,row-sizey/gridwidth+1);
            x<=row && x<sizex/gridwidth; x++){
        int y = row - x;
        //println(x,y,"\t",row, "\t",n);
        Square thissquare = squares[x][y];
        pushMatrix();
        translate(gridwidth*x,gridwidth*y);
        fill(thissquare.col,255,255,90*thissquare.age/uptime);
        rotate(thissquare.r * thissquare.age/uptime);
        float thislen = thissquare.l * thissquare.age / uptime;
        rect(0,0,thislen,thislen);
        thissquare.growold();
        popMatrix();
      }
    }
    if (waitcounter>0){
      waitcounter --;
    } else{
    n++;
    waitcounter = waittime;
    }
    if (record==0){
      //saveFrame("pic3_####.png");
      record=4;
    } else {
      record--;
    }

  } else {
    noLoop();
  }
}

void setupSquares() {
  for(int x=0; x<sizex/gridwidth; x++){
    for(int y=0; y<sizey/gridwidth; y++){
      float variant = random(-sizevar_s, sizevar_s);
      float r = random(0,TWO_PI);
      int col = int(random(0,255));
      squares[x][y] = new Square(squarewidth+variant,r,col);
    }
  }
}

class Square{
  float l; //length
  float r; //angle
  int col; //color
  int age = 0;//-waittime;
  
  Square(float l,float r, int col){
    this.l = l;
    this.r = r;
    this.col = col;
  }
  void growold(){
    if (this.age < uptime){
      this.age++;
    }
  }
}
  
