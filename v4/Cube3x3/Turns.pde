//holds the different
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

void turnM() {
  int[] temps = new int[3];

  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < 3; x++) {

      if (i == 0) {
        temps[x] = squares[1][x][0];
        squares[1][x][0] = squares[1][x][5];
      }
      if (i == 1) {
        squares[1][x][5] = squares[1][2-x][1];
      }
      if (i == 2) {
        squares[1][x][1] = squares[1][x][4];
      }
      if (i == 3) {
        squares[1][x][4] = temps[2-x];
      }
    }
  }
}

void turnMp() {
  int[] temps = new int[3];

  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < 3; x++) {

      if (i == 0) {
        temps[x] = squares[1][x][0];
        squares[1][x][0] = squares[1][2-x][4];
      }
      if (i == 1) {
        squares[1][x][4] = squares[1][x][1];
      }
      if (i == 2) {
        squares[1][x][1] = squares[1][2-x][5];
      }
      if (i == 3) {
        squares[1][x][5] = temps[x];
      }
    }
  }
}

void turnY() {
  int [] temps = new int[3];

  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < 3; x++) {
      if (i == 0) {
        temps[x] = squares[x][1][0];
        squares[x][1][0] = squares[2-x][1][3];
      }
      if (i==1) {
        squares[x][1][3] = squares[x][1][1];
      }
      if (i==2) {
        squares[x][1][1] = squares[2-x][1][2];
      }
      if (i==3) {
        squares[x][1][2] = temps[x];
      }
    }
  }
  turnU();
  turnDp();
}

void turnYp() {

  int[] temps = new int[3];

  for (int i = 0; i < 4; i++) {
    for (int x = 0; x < 3; x++) {
      if (i==0) {
        temps[x] = squares[x][1][0];
        squares[x][1][0] = squares[x][1][2];
      }
      if (i==1) {
        squares[x][1][2] = squares[2-x][1][1];
      }
      if (i==2) {
        squares[x][1][1] = squares[x][1][3];
      }
      if (i==3) {
        squares[x][1][3] = temps[2-x];
      }
    }
  }

  turnUp();
  turnD();
}

void turnX() {
  turnR();
  turnM();
  turnLp();
}

void turnXp() {
  turnMp();
  turnRp();
  turnL();
}
