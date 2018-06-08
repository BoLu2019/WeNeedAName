void timer() {
  textAlign(CENTER);
  textFont(digital);
  fill(255);
  textSize(75);
  text(hours() +":"+ minutes() +":"+ seconds(), width/2, 75);
}

void startTimer() {
  startTime = millis();
  runningTime = true;
}

void stopTimer() {
  if (runningTime) {
    endTime = millis();
  }
  runningTime = false;
}

int elapsed() {
  if (runningTime) {
    return millis() - startTime;
  } else {
    return endTime - startTime;
  }
}

int seconds() {
  return (elapsed() / 1000) % 60;
}

int minutes() {
  return (elapsed() / (1000 * 60)) % 60;
}

int hours() {
  return (elapsed() / (1000 * 60 * 60)) % 24;
}
