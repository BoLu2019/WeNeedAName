boolean added = false;

void timer() {
  textAlign(CENTER);
  textFont(digital);
  fill(255);
  textSize(75);
  text(hours() +":"+ minutes()/10 + minutes() % 10 +":"+ seconds()/10 + seconds() % 10, width/2, 75);
}

void startTimer() {
  startTime = millis();
  runningTime = true;
  added = false;
}

void stopTimer() {
  if (runningTime) {
    endTime = millis();
  }
  runningTime = false;
  if (!added) {
    addTime(elapsed());
    added = true;
    scoreboard();
  }
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
