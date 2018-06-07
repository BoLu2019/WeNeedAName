//There's 830 lines of code in this file

// color signatures for the six colors used
color red = color(255, 0, 0);
color orange = color(255, 110, 0);
color white = color(255);
color yellow = color(255, 255, 0);
color blue = color(0, 0, 255);
color green = color(0, 255, 0);

//Face Status, forgot to use the final variables though
static final int RED = 0;
static final int ORANGE = 1;
static final int GREEN = 2;
static final int BLUE = 3;
static final int WHITE = 4;
static final int YELLOW = 5;
int curr = RED;

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
  size (750, 750, P3D); //to fit the 1024*768 requirements
  background(0);

  // initial state of the colors --> a solved cube
  for (int wid = 0; wid < w; wid++) {
    for (int hei = 0; hei < h; hei++) {
      for (int face = 0; face < numColors; face++) {
        squares[wid][hei][face] = face;
      }
    }
  }
  print("Hi");
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
// the moves are from the perspective of the red face, however the moves can be reused. For example, the right move for face green is the same thing as front move for red.
void keyPressed() {
  if (key == 'r') {
    if (curr == 1 || curr == 4) {
      turnL();
    }
    if (curr == 2) {
      turnF();
    }
    if (curr == 3) {
      turnB();
    }
    if (curr == 5 || curr == 0) {
      turnR();
    }
  }
  if (key == 'R') {
    if (curr == 1 || curr ==  4) {
      turnLp();
    }
    if (curr == 2) {
      turnFp();
    }
    if (curr == 3) {
      turnBp();
    }
    if (curr == 5 || curr == 0) {
      turnRp();
    }
  }
  if (key == 'l') {
    if (curr == 1 || curr == 4) {
      turnR();
    }
    if (curr == 2) {
      turnB();
    }
    if (curr==3) {
      turnF();
    }
    if (curr == 5 || curr == 0) {
      turnL();
    }
  }
  if (key == 'L') {
    if (curr == 1 || curr == 4) {
      turnRp();
    }
    if (curr == 2) {
      turnBp();
    }
    if (curr == 3) {
      turnFp();
    }
    if (curr == 5 || curr == 0) {
      turnLp();
    }
  }
  if (key == 'u') {
    if (curr==4 || curr == 5) {
      turnF();
    } else {
      turnU();
    }
  }
  if (key == 'U') {
    if (curr == 4 || curr == 5) {
      turnFp();
    } else {
      turnUp();
    }
  }
  if (key == 'd') {
    if (curr == 4 || curr == 5) {
      turnB();
    } else {
      turnD();
    }
  }
  if (key == 'D') {
    if (curr == 4 || curr == 5) {
      turnBp();
    } else {
      turnDp();
    }
  }
  if (key == 'f') {
    if(curr == 1){
      turnB();
    }
    if(curr == 2){
      turnL();
    }
    if(curr == 3){
      turnR();
    }
    if(curr == 4){
      turnU();
    }
    if(curr == 5){
      turnD();
    }
    else{
      turnF();
    }
  }
  if (key == 'F') {
    if(curr == 1){
      turnBp();
    }
    if(curr == 2){
      turnLp();
    }
    if(curr == 3){
      turnRp();
    }
    if(curr == 4){
      turnUp();
    }
    if(curr == 5){
      turnDp();
    }
    else{
      turnFp();
    }
  }
  if (key == 'b') {
    if(curr == 1){
      turnF();
    }
    if(curr == 2){
      turnR();
    }
    if(curr == 3){
      turnL();
    }
    if(curr == 4){
      turnD();
    }
    if(curr == 5){
      turnU();
    }
    else{
      turnB();
    }
  }
  if (key == 'B') {
    if(curr == 1){
      turnFp();
    }
    if(curr == 2){
      turnRp();
    }
    if(curr == 3){
      turnLp();
    }
    if(curr == 4){
      turnDp();
    }
    if(curr == 5){
      turnUp();
    }
    else{
      turnBp();
    }
  }
  if (key == 's') { //mixes the cube up
    scramble();
  }
}

/* METHODS FOR EACH TURN*/

// Making a clockwise turn of the right face
void turnR() {

  int[] temps = new int[3];
  int tempCorner = squares[2][0][3];
  int tempEdge = squares[1][0][3];

  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < 3; x++) {

      if (i == 0) {
        temps[x] = squares[2][x][0];
        squares[2][x][0] = squares[2][x][5];
        //side effect(blue)
        squares[2][0][3] = squares[2][2][3];
        squares[1][0][3] = squares[2][1][3];
      }
      if (i == 1) {
        squares[2][x][5] = squares[2][2-x][1];
        //side effect
        squares[2][2][3] = squares[0][2][3];
        squares[2][1][3] = squares[1][2][3];
      }
      if (i == 2) {
        squares[2][x][1] = squares[2][x][4];
        //side effect
        squares[0][2][3] = squares[0][0][3];
        squares[1][2][3] = squares[0][1][3];
      }
      if (i == 3) {
        squares[2][x][4] = temps[2-x];
        //side effect
        squares[0][0][3] = tempCorner;
        squares[0][1][3] = tempEdge;
      }
    }
  }
  //side effect
}

// Making a counter-clockwise turn of the right face
void turnRp() {

  int[] temps = new int[3];
  int tempCorner = squares[2][0][3];
  int tempEdge = squares[1][0][3];

  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < 3; x++) {

      if (i == 0) {
        temps[x] = squares[2][x][0];
        squares[2][x][0] = squares[2][2-x][4];
        //side effect(blue)
        squares[2][0][3] = squares[0][0][3];
        squares[1][0][3] = squares[0][1][3];
      }
      if (i == 1) {
        squares[2][x][4] = squares[2][x][1];
        //side effect
        squares[0][0][3] = squares[0][2][3];
        squares[0][1][3] = squares[1][2][3];
      }
      if (i == 2) {
        squares[2][x][1] = squares[2][2-x][5];
        //side effect
        squares[0][2][3] = squares[2][2][3];
        squares[1][2][3] = squares[2][1][3];
      }
      if (i == 3) {
        squares[2][x][5] = temps[x];
        //side effect
        squares[2][2][3] = tempCorner;
        squares[2][1][3] = tempEdge;
      }
    }
  }
}

// Making a clockwise turn of the left face
void turnL() {

  // Changing the line of color
  int[] temps = new int[3];
  int tempCorner = squares[2][0][2];
  int tempEdge = squares[1][0][2];

  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < 3; x++) {

      if (i == 0) {
        temps[x] = squares[0][x][0];
        squares[0][x][0] = squares[0][2-x][4];
        //side effect(green)
        squares[2][0][2] = squares[0][0][2];
        squares[1][0][2] = squares[0][1][2];
      }
      if (i == 1) {
        squares[0][x][4] = squares[0][x][1];
        //side effect
        squares[0][0][2] = squares[0][2][2];
        squares[0][1][2] = squares[1][2][2];
      }
      if (i == 2) {
        squares[0][x][1] = squares[0][2-x][5];
        //side effect
        squares[0][2][2] = squares[2][2][2];
        squares[1][2][2] = squares[2][1][2];
      }
      if (i == 3) {
        squares[0][x][5] = temps[x];
        //side effect
        squares[2][2][2] = tempCorner;
        squares[2][1][2] = tempEdge;
      }
    }

    // Rotating the left face as a side effect
    // Edges
  }
}

// Making a counter-clockwise turn of the left face
void turnLp() {

  int[] temps = new int[3];
  int tempCorner = squares[2][0][2];
  int tempEdge = squares[1][0][2];


  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < 3; x++) {

      if (i == 0) {
        temps[x] = squares[0][x][0];
        squares[0][x][0] = squares[0][x][5];
        //side effect(green)
        squares[2][0][2] = squares[2][2][2];
        squares[1][0][2] = squares[2][1][2];
      }
      if (i == 1) {
        squares[0][x][5] = squares[0][2-x][1];
        //side effect
        squares[2][2][2] = squares[0][2][2];
        squares[2][1][2] = squares[1][2][2];
      }
      if (i == 2) {
        squares[0][x][1] = squares[0][x][4];
        //side effect
        squares[0][2][2] = squares[0][0][2];
        squares[1][2][2] = squares[0][1][2];
      }
      if (i == 3) {
        squares[0][x][4] = temps[2-x];
        //side effect
        squares[0][0][2] = tempCorner;
        squares[0][1][2] = tempEdge;
      }
    }
  }
}

void turnU() {
  int [] temps = new int[3];
  int tempCorner = squares[2][0][4];
  int tempEdge = squares[1][0][4];

  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < 3; x++) {
      if (i == 0) {
        temps[x] = squares[x][0][0];
        squares[x][0][0] = squares[2-x][0][3];
        //side effect(white)
        squares[2][0][4] = squares[2][2][4];
        squares[1][0][4] = squares[2][1][4];
      }
      if (i==1) {
        squares[x][0][3] = squares[x][0][1];
        //side effect
        squares[2][2][4] = squares[0][2][4];
        squares[2][1][4] = squares[1][2][4];
      }
      if (i==2) {
        squares[x][0][1] = squares[2-x][0][2];
        //side effect
        squares[0][2][4] = squares[0][0][4];
        squares[1][2][4] = squares[0][1][4];
      }
      if (i==3) {
        squares[x][0][2] = temps[x];
        //side effect
        squares[0][0][4] = tempCorner;
        squares[0][1][4] = tempEdge;
      }
    }
  }
}

void turnUp() {
  int[] temps = new int[3];
  int tempCorner = squares[2][0][4];
  int tempEdge = squares[1][0][4];

  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < 3; x++) {
      if (i==0) {
        temps[x] = squares[x][0][0];
        squares[x][0][0] = squares[x][0][2];
        //side effect(white)
        squares[2][0][4] = squares[0][0][4];
        squares[1][0][4] = squares[0][1][4];
      }
      if (i==1) {
        squares[x][0][2] = squares[2-x][0][1];
        //side effect
        squares[0][0][4] = squares[0][2][4];
        squares[0][1][4] = squares[1][2][4];
      }
      if (i==2) {
        squares[x][0][1] = squares[x][0][3];
        //side effect
        squares[0][2][4] = squares[2][2][4];
        squares[1][2][4] = squares[2][1][4];
      }
      if (i==3) {
        squares[x][0][3] = temps[2-x];
        //side effect
        squares[2][2][4] = tempCorner;
        squares[2][1][4] = tempEdge;
      }
    }
  }
}
void turnD() {
  int[] temps = new int[3];
  int tempCorner = squares[2][0][5];
  int tempEdge = squares[1][0][5];

  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < 3; x++) {
      if (i==0) {
        temps[x] = squares[x][2][0];
        squares[x][2][0] = squares[x][2][2];
        //side effect(yellow)
        squares[2][0][5] = squares[0][0][5];
        squares[1][0][5] = squares[0][1][5];
      }
      if (i==1) {
        squares[x][2][2] = squares[2-x][2][1];
        //side effect
        squares[0][0][5] = squares[0][2][5];
        squares[0][1][5] = squares[1][2][5];
      }
      if (i==2) {
        squares[x][2][1] = squares[x][2][3];
        //side effect
        squares[0][2][5] = squares[2][2][5];
        squares[1][2][5] = squares[2][1][5];
      }
      if (i==3) {
        squares[x][2][3] = temps[2-x];
        //side effect
        squares[2][2][5] = tempCorner;
        squares[2][1][5] = tempEdge;
      }
    }
  }
}
void turnDp() {
  int [] temps = new int[3];
  int tempCorner = squares[2][0][5];
  int tempEdge = squares[1][0][5];
  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < 3; x++) {
      if (i == 0) {
        temps[x] = squares[x][2][0];
        squares[x][2][0] = squares[2-x][2][3];
        //side effect(yellow)
        squares[2][0][5] = squares[2][2][5];
        squares[1][0][5] = squares[2][1][5];
      }
      if (i==1) {
        squares[x][2][3] = squares[x][2][1];
        //side effect
        squares[2][2][5] = squares[0][2][5];
        squares[2][1][5] = squares[1][2][5];
      }
      if (i==2) {
        squares[x][2][1] = squares[2-x][2][2];
        //side effect
        squares[0][2][5] = squares[0][0][5];
        squares[1][2][5] = squares[0][1][5];
      }
      if (i==3) {
        squares[x][2][2] = temps[x];
        //side effect
        squares[0][0][5] = tempCorner;
        squares[0][1][5] = tempEdge;
      }
    }
  }
}

void turnF() {
  int[] temps = new int[3];
  int tempCorner = squares[2][0][0];
  int tempEdge = squares[1][0][0];

  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < 3; x++) {
      if (i == 0) {
        temps[x] = squares[x][0][4];
        squares[x][0][4] = squares[2][2-x][2];
        //side effect(red)
        squares[2][0][0] = squares[0][0][0];
        squares[1][0][0] = squares[0][1][0];
      }
      if (i==1) {
        squares[2][x][2] = squares[x][0][5];
        //side effect
        squares[0][0][0] = squares[0][2][0];
        squares[0][1][0] = squares[1][2][0];
      }
      if (i==2) {
        squares[x][0][5] = squares[2][2-x][3];
        //side effect
        squares[0][2][0] = squares[2][2][0];
        squares[1][2][0] = squares[2][1][0];
      }
      if (i==3) {
        squares[2][x][3] = temps[x];
        //side effect
        squares[2][2][0] = tempCorner;
        squares[2][1][0] = tempEdge;
      }
    }
  }
}

void turnFp() {
  int[] temps = new int[3];
  int tempCorner = squares[2][0][0];
  int tempEdge = squares[1][0][0];

  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < 3; x++) {
      if (i == 0) {
        temps[x] = squares[x][0][4];
        squares[x][0][4] = squares[2][x][3];
        //side effect(red)
        squares[2][0][0] = squares[2][2][0];
        squares[1][0][0] = squares[2][1][0];
      }
      if (i==1) {
        squares[2][x][3] = squares[2-x][0][5];
        //side effect
        squares[2][2][0] = squares[0][2][0];
        squares[2][1][0] = squares[1][2][0];
      }
      if (i==2) {
        squares[x][0][5] = squares[2][x][2];
        //side effect
        squares[0][2][0] = squares[0][0][0];
        squares[1][2][0] = squares[0][1][0];
      }
      if (i==3) {
        squares[2][x][2] = temps[2-x];
        //side effect
        squares[0][0][0] = tempCorner;
        squares[0][1][0] = tempEdge;
      }
    }
  }
}

void turnB() {
  int[] temps = new int[3];
  int tempCorner = squares[2][0][1];
  int tempEdge = squares[1][0][1];
  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < 3; x++) {
      if (i == 0) {
        temps[x] = squares[x][2][4];
        squares[x][2][4] = squares[0][x][3];
        //side effect(orange)
        squares[2][0][1] = squares[2][2][1];
        squares[1][0][1] = squares[2][1][1];
      }
      if (i==1) {
        squares[0][x][3] = squares[2-x][2][5];
        //side effect
        squares[2][2][1] = squares[0][2][1];
        squares[2][1][1] = squares[1][2][1];
      }
      if (i==2) {
        squares[x][2][5] = squares[0][x][2];
        //side effect
        squares[0][2][1] = squares[0][0][1];
        squares[1][2][1] = squares[0][1][1];
      }
      if (i==3) {
        squares[0][x][2] = temps[2-x];
        //side effect
        squares[0][0][1] = tempCorner;
        squares[0][1][1] = tempEdge;
      }
    }
  }
}

void turnBp() {
  int[] temps = new int[3];
  int tempCorner = squares[2][0][1];
  int tempEdge = squares[1][0][1];

  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < 3; x++) {
      if (i == 0) {
        temps[x] = squares[x][2][4];
        squares[x][2][4] = squares[0][2-x][2];
        //side effect(orange)
        squares[2][0][1] = squares[0][0][1];
        squares[1][0][1] = squares[0][1][1];
      }
      if (i==1) {
        squares[0][x][2] = squares[x][2][5];
        //side effect
        squares[0][0][1] = squares[0][2][1];
        squares[0][1][1] = squares[1][2][1];
      }
      if (i==2) {
        squares[x][2][5] = squares[0][2-x][3];
        //side effect
        squares[0][2][1] = squares[2][2][1];
        squares[1][2][1] = squares[2][1][1];
      }
      if (i==3) {
        squares[0][x][3] = temps[x];
        //side effect
        squares[2][2][1] = tempCorner;
        squares[2][1][1] = tempEdge;
      }
    }
  }
}

void scramble() {
  for (int i = 0; i < 25; i++) {
    int chance = (int)(Math.random() * 12);
    if (chance == 0) {
      turnR();
    }
    if (chance == 1) {
      turnRp();
    }
    if (chance == 2) {
      turnL();
    }
    if (chance == 3) {
      turnLp();
    }
    if (chance == 4) {
      turnU();
    }
    if (chance == 5) {
      turnUp();
    }
    if (chance == 6) {
      turnD();
    }
    if (chance == 7) {
      turnDp();
    }
    if (chance == 8) {
      turnF();
    }
    if (chance == 9) {
      turnFp();
    }
    if (chance == 10) {
      turnB();
    }
    if (chance == 11) {
      turnBp();
    }
  }
}
