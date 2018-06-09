ArrayList<Integer> scores = new ArrayList<Integer>();
int numScores = 0;

void addTime (int time) {
  scores.add(time);
  added = true;
  if (numScores < 6) {
    numScores++;
  }
}

void scoreboard() {
  if (scores.size() > 1) {
    printTimes(sort(scores));
  }
}

void printTimes(ArrayList<Integer> arr) {
  println("Top 5 Scores");
  for (int i = 1; i < numScores; i++) {
    print(arr.get(i)/(1000*60*60) % 24 + ":" + (arr.get(i)/(1000*60) % 60)/10 + (arr.get(i)/(1000*60) % 60)%10 + ":" + (arr.get(i)/1000 % 60)/10 + (arr.get(i)/1000 % 60)%10);
    print(", ");
  }
  print("\n");
}
