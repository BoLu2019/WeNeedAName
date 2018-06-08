ArrayList<Integer> merge(ArrayList<Integer> a, ArrayList<Integer> b) {

  ArrayList<Integer> merged = new ArrayList<Integer>();
  int indexA = 0;
  int indexB = 0;

  while (indexA < a.size() && indexB < b.size()) { // stop when all the cards of one of the decks are gone
    // find the smaller number and add to merged
    // increment the index of the array that the number came from
    if (a.get(indexA) < b.get(indexB)) {
      merged.add(a.get(indexA));
      indexA++;
    } else {
      merged.add(b.get(indexB));
      indexB++;
    }
  }

  // find out which array is now "empty" and just add the rest of the other array to the end of merged
  if (indexA == a.size()) {
    for (int i = indexB; i < b.size(); i++) {
      merged.add(b.get(i));
    }
  } else {
    for (int i = indexA; i < a.size(); i++) {
      merged.add(a.get(i));
    }
  }

  return merged;
}

ArrayList<Integer> sort( ArrayList<Integer> arr ) {
  if (arr.size() == 1) {
    return arr;
  }
  else {
    int half = arr.size() / 2;
    ArrayList<Integer> half1 = new ArrayList<Integer>();
    ArrayList<Integer> half2 = new ArrayList<Integer>();
    
    for (int i = 0; i < arr.size(); i++) {
      if (i < half) {
        half1.add(arr.get(i));
      }
      else {
        half2.add(arr.get(i));
      }
    }
    return merge(sort(half1), sort(half2));
  }
}
