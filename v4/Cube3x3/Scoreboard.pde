ArrayList<Integer> scores = new ArrayList<Integer>();

void addTime (int time) {
  scores.add(time);
  added = true;
}

void scoreboard() {
  printTimes(sort(scores));
}

void printTimes(ArrayList<Integer> arr) {
  for (int time:arr) {
    println("Best scores: ");
    print(time/(1000*60*60) % 24 + ":" + (time/(1000*60) % 60)/10 + (time/(1000*60) % 60)%10 + ":" + (time/1000 % 60)/10 + (time/1000 % 60)%10);
    print(", ");
  }
  print("\n");
  //println(sort(scores));
}
