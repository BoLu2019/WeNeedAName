// color signatures for the six colors used
color red = color(255, 0, 0);
color orange = color(255, 110, 0);
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

PFont digital;

int startTime = 0;
int endTime = 0;
boolean runningTime = false;

int seconds = 0;
int minutes = 0;
int hours = 0;

void setup() {
  size (750, 750, P3D); //to fit the 1024*768 requirements

  // initial state of the colors --> a solved cube
  for (int wid = 0; wid < w; wid++) {
    for (int hei = 0; hei < h; hei++) {
      for (int face = 0; face < numColors; face++) {
        squares[wid][hei][face] = face;
      }
    }
  }

  digital = createFont("DS-DIGI.TTF", 100);
}

void draw() {
  background(150);

  timer();
  if (isSolved()) {
    stopTimer();
  }

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
  if (key == 'u') {
    turnU();
  }
  if (key == 'U') {
    turnUp();
  }
  if (key == 'd') {
    turnD();
  }
  if (key == 'D') {
    turnDp();
  }
  if (key == 'f') {
    turnF();
  }
  if (key == 'F') {
    turnFp();
  }
  if (key == 'b') {
    turnB();
  }
  if (key == 'B') {
    turnBp();
  }
  if (key == 'x') {
    turnX();
  }
  if (key == 'X') {
    turnXp();
  }
  if (key == 'y') {
    turnY();
  }
  if (key == 'Y') {
    turnYp();
  }
  if (key == 's') { //mixes the cube up
    scramble();
  }
  if (key == ' ') {
    reset();
  }
  if (key == 'c') {
    println("Solved? " + isSolved());
  }
  if (key == '!') {
    superFlip();
  }
  if (key == '@') {
    checkerBoard();
  }
  if (key == '#') {
    cubeInCube();
  }
  if (key == '$') {
    cubeInCubeInCube();
  }
  if (key == '%') {
    sixDots();
  }
}

/* METHODS FOR EACH TURN*/



void scramble() {

  startTimer();

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

//"solves" the cube
void reset() {
  for (int a = 0; a < 3; a++) {
    for (int b = 0; b < 3; b++) {
      for (int c = 0; c < 6; c++) {
        squares[a][b][c] = c;
      }
    }
  }
}

boolean isSolved() {
  boolean solved = true;
  for (int a = 0; a < 3; a++) {
    for (int b = 0; b < 3; b++) {
      for (int c = 0; c < 6; c++) {
        if (squares[a][b][c] != squares[1][1][c]) {
          solved = false;
        }
      }
    }
  }
  return solved;
}
