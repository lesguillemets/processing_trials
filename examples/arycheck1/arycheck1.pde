class Grid {
  int level;
  int[][] grid;// = new int[3][3];
  
  Grid() {
    this.level = 3;
    //this.grid = {{3,4,5},{5,6,7},{2,3,4}};
    this.grid = new int[3][3];
    for(int i=0;i<3;i++){
      for(int j=0;j<3;j++){
        this.grid[i][j] = 10*i+j;
      }
    }
  }
}
int [] a = {5,3,5,5,4};
int[][] grid = {{3,4,5},{5,6,7},{2,3,4}};

void setup(){
  size(500,500);
  background(0);
  scale(20);
  Grid b;
  int x;
 
  b = new Grid();
  println("_______");
  println(b.level);
  println("_______");
  fill(255);
  for (int i=0;i<3;i++){
    for (int j=0;j<3;j++){
      x = b.grid[i][j];
      println(x);
      fill(255-10*x);
      rect(x,x,x+2,x+2);
    }
  }
  // */
  /*
  for (int i=0;i<5;i++){
    x = a[i];
    println(x);
    fill(200,0,100);
    rect(x,x,x+x,x+x);
  }
  */
}

