// color signatures for the six colors used
color red = color(255, 0, 0);
color orange = color(255, 128, 0);
color white = color(255);
color yellow = color(255, 255, 0);
color blue = color(0, 0, 255);
color green = color(0, 255, 0);

// size of the cube
float size = 250;

// number of pieces per edge
float w = 1;
float h = 1;

void setup() {
  size (800, 800, P3D);
  background(0);
}

void draw() {
  background(150);
  fill(0);
  stroke(white);
  strokeWeight(5);
  translate(width/2, height/2);
  rotateX(-mouseY * 2 * PI/width);
  rotateY(-mouseX * 2 * PI/height);
  box(size);

  // color filling

  // Am testing for just one square per side

  // red
  pushMatrix();
  translate(-width/2, -height/2, size/2 + 1);
  noStroke();
  fill(red);
  rectMode(CENTER);
  rect(width/2, height / 2, size * .9, size * .9);
  popMatrix();

  // orange
  pushMatrix();
  translate(-width/2, -height/2, -(size/2 + 1));
  noStroke();
  fill(orange);
  rectMode(CENTER);
  rect(width/2, height / 2, size * .9, size * .9);
  popMatrix();

  // green
  pushMatrix();
  rotateY(PI/2);
  translate(-width/2, -height/2, size/2 + 1);
  noStroke();
  fill(green);
  rectMode(CENTER);
  rect(width/2, height / 2, size * .9, size * .9);
  popMatrix();

  // blue
  pushMatrix();
  rotateY(PI/2);
  translate(-width/2, -height/2, -(size/2 + 1));
  noStroke();
  fill(blue);
  rectMode(CENTER);
  rect(width/2, height / 2, size * .9, size * .9);
  popMatrix();

  // white
  pushMatrix();
  rotateX(PI/2);
  translate(-width/2, -height/2, -(size/2 + 1));
  noStroke();
  fill(white);
  rectMode(CENTER);
  rect(width/2, height / 2, size * .9, size * .9);
  popMatrix();

  // yellow
  pushMatrix();
  rotateX(PI/2);
  translate(-width/2, -height/2, size/2 + 1);
  noStroke();
  fill(yellow);
  rectMode(CENTER);
  rect(width/2, height / 2, size * .9, size * .9);
  popMatrix();
}
