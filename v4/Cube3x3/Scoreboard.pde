ArrayList<Integer> scores = new ArrayList<Integer>();

void addTime (int time) {
  scores.add(time);
  sort(scores);
  added = true;
}

void scoreboard() {
  println(scores);
}
