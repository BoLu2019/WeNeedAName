// color signatures for the six colors used
color red = color(255, 0, 0);
color orange = color(255, 150, 0);
color white = color(255);
color yellow = color(255, 255, 0);
color blue = color(0, 0, 255);
color green = color(0, 255, 0);

/* 
 COLOR CODE: 
 0 - red
 1 - orange
 2 - green
 3 - blue
 4 - white
 5 - yellow
 */

// size of the cube
float size = 300;
float squareSize = 80;
float space = 15;

// number of pieces per edge
int w = 3;
int h = 3;

//number of colors
int numColors = 6;

// 3D Array Squares
// Each 3x3 2D array represents one of the faces of the cube
// Each space in the array is assigned a number from 0-5 inclusive, which corresponds to one of the six colors
// Initially, the each face is given the same number, signifying that the cube is in a solved state
int[][][] squares = new int[w][h][numColors];

void setup() {
  size (800, 800, P3D);
  background(0);

  // initial state of the colors --> a solved cube
  for (int wid = 0; wid < w; wid++) {
    for (int hei = 0; hei < h; hei++) {
      for (int face = 0; face < numColors; face++) {
        squares[wid][hei][face] = face;
      }
    }
  }
}

void draw() {
  background(150);
  fill(0);
  stroke(white);
  strokeWeight(5);
  // move the box into the middle of the screen
  translate(width/2, height/2);
  // box rotation is relative to the position of the mouse on the screen
  rotateX(-mouseY * 2 * PI/width);
  rotateY(-mouseX * 2 * PI/height);
  box(size);

  // color filling
  
  // traversing through array Squares
  for (int wid = 0; wid < w; wid++) {
    for (int hei = 0; hei < h; hei++) {
      for (int face = 0; face < numColors; face++) {
        // Goes through each face and colors each square depending on the number at that position
        if (face == 0) { // red center
          pushMatrix();
          translate((1-wid)*95, (1-hei)*95, size/2+1);
          noStroke();
          fill(getColor(squares[wid][hei][face]));
          rectMode(CENTER);
          rect(0, 0, squareSize, squareSize);
          popMatrix();
        }
        if (face == 1) { // orange center
          pushMatrix();
          translate((1-wid)*95, (1-hei)*95, -(size/2+1));
          noStroke();
          fill(getColor(squares[wid][hei][face]));
          rectMode(CENTER);
          rect(0, 0, squareSize, squareSize);
          popMatrix();
        }
        if (face == 2) { // green face
          pushMatrix();
          rotateY(PI/2);
          translate((1-wid)*95, (1-hei)*95, size/2+1);
          noStroke();
          fill(getColor(squares[wid][hei][face]));
          rectMode(CENTER);
          rect(0, 0, squareSize, squareSize);
          popMatrix();
        }
        if (face == 3) { // blue face
          pushMatrix();
          rotateY(PI/2);
          translate((1-wid)*95, (1-hei)*95, -(size/2+1));
          noStroke();
          fill(getColor(squares[wid][hei][face]));
          rectMode(CENTER);
          rect(0, 0, squareSize, squareSize);
          popMatrix();
        }
        if (face == 4) { // white face
          pushMatrix();
          rotateX(PI/2);
          translate((1-wid)*95, (1-hei)*95, -(size/2+1));
          noStroke();
          fill(getColor(squares[wid][hei][face]));
          rectMode(CENTER);
          rect(0, 0, squareSize, squareSize);
          popMatrix();
        }
        if (face == 5) { // yellow face
          pushMatrix();
          rotateX(PI/2);
          translate((1-wid)*95, (1-hei)*95, size/2+1);
          noStroke();
          fill(getColor(squares[wid][hei][face]));
          rectMode(CENTER);
          rect(0, 0, squareSize, squareSize);
          popMatrix();
        }
      }
    }
  }
}

// Returns the color depending on the number from 0-5 inclusive
color getColor(int colorNum) {
  if (colorNum == 0) {
    return red;
  }
  if (colorNum == 1) {
    return orange;
  }
  if (colorNum == 2) {
    return green;
  }
  if (colorNum == 3) {
    return blue;
  }
  if (colorNum == 4) {
    return white;
  }
  if (colorNum == 5) {
    return yellow;
  }
  return -1;
}

// User input for turning sides and rotating the cube to a new face
void keyPressed() {
  if (key == 'r') {
    turnR();
  }
  if (key == 'R') {
    turnRp();
  }
  if (key == 'l') {
    turnL();
  }
  if (key == 'L') {
    turnLp();
  }
}

/* METHODS FOR EACH TURN*/

// Making a clockwise turn of the right face
void turnR() {
  
  int[] temps = new int[3];
  
  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < 3; x++) {
      
      if (i == 0) {
        temps[x] = squares[2][x][0];
        squares[2][x][0] = squares[2][x][5];
      }
      if (i == 1) {
        squares[2][x][5] = squares[2][x][1];
      }
      if (i == 2) {
        squares[2][x][1] = squares[2][x][4];
      }
      if (i == 3) {
        squares[2][x][4] = temps[x];
      }
    }
  }
}

// Making a counter-clockwise turn of the right face
void turnRp() {
  
  int[] temps = new int[3];
  
  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < 3; x++) {
      
      if (i == 0) {
        temps[x] = squares[2][x][0];
        squares[2][x][0] = squares[2][x][4];
      }
      if (i == 1) {
        squares[2][x][4] = squares[2][x][1];
      }
      if (i == 2) {
        squares[2][x][1] = squares[2][x][5];
      }
      if (i == 3) {
        squares[2][x][5] = temps[x];
      }
      
    }
  }
}

// Making a clockwise turn of the left face
void turnL() {
  
  // Changing the line of color
  int[] temps = new int[3];
  
  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < 3; x++) {
      
      if (i == 0) {
        temps[x] = squares[0][x][0];
        squares[0][x][0] = squares[0][x][4];
      }
      if (i == 1) {
        squares[0][x][4] = squares[0][x][1];
      }
      if (i == 2) {
        squares[0][x][1] = squares[0][x][5];
      }
      if (i == 3) {
        squares[0][x][5] = temps[x];
      }
    }
    
    // Rotating the left face as a side effect
    // Edges
    
    
    
  }
  
}

// Making a counter-clockwise turn of the left face
void turnLp() {
  
  int[] temps = new int[3];
  
  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < 3; x++) {
      
      if (i == 0) {
        temps[x] = squares[0][x][0];
        squares[0][x][0] = squares[0][x][5];
      }
      if (i == 1) {
        squares[0][x][5] = squares[0][x][1];
      }
      if (i == 2) {
        squares[0][x][1] = squares[0][x][4];
      }
      if (i == 3) {
        squares[0][x][4] = temps[x];
      }
    }
  }
}

void turnU() {
  
}
