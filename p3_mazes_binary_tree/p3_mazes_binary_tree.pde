Node[][] grid = new Node[8][6];
int MARGIN = 50;

void setup() {
  size(800,600);
  
  for( int i = 0; i < grid.length; i++) {
    for( int j = 0 ; j < grid[i].length; j++ ) {
      grid[i][j] = new Node();
      if( j == grid[i].length - 1 || (random(-1, 1) > 0  && i < grid.length - 1)) {
         grid[i][j].right = true; 
      }
      else {
         grid[i][j].down = true;
      }
    }
  }
  
}

void draw() {
  background(0);
  fill(0);
  stroke(255);
  
  PVector TL = new PVector(MARGIN, MARGIN);
  PVector TR = new PVector(width-MARGIN, MARGIN);
  PVector BR = new PVector(width-MARGIN, height-MARGIN);
  PVector BL = new PVector(MARGIN, height-MARGIN);
  int STEP_X = int((TR.x - TL.x) / grid.length);
  int STEP_Y = int((BL.y - TL.y) / grid[0].length);
  quad(TL.x, TL.y, TR.x, TR.y, BR.x, BR.y, BL.x, BL.y);
  
   
  for( int i = 0; i < grid.length; i++) {
    for( int j = 0 ; j < grid[i].length; j++ ) {
      PVector b = new PVector(TL.x + i * STEP_X, TL.y + j * STEP_Y);
      quad(b.x, b.y, b.x + STEP_X, b.y, b.x + STEP_X, b.y + STEP_Y, b.x, b.y + STEP_Y);
    }
  }
  
  stroke(0);
  for( int i = 0; i < grid.length; i++) {
    for( int j = 0 ; j < grid[i].length; j++ ) {
      PVector b = new PVector(TL.x + i * STEP_X, TL.y + j * STEP_Y);
      if( grid[i][j].left )
      {
        line(b.x, b.y, b.x, b.y + STEP_Y);
      }
      if( grid[i][j].right )
      {
        line(b.x + STEP_X, b.y, b.x + STEP_X, b.y + STEP_Y);
      }
      if( grid[i][j].up )
      {
        line(b.x, b.y, b.x + STEP_X, b.y);
      }
      if( grid[i][j].down )
      {
        line(b.x, b.y + STEP_Y, b.x + STEP_X, b.y + STEP_Y);
      }
    }
  }
  
}

class Node {
  public boolean up, down, left, right;
   Node() {
     up = false;
     down = false;
     left = false;
     right = false;
   }
  
}
