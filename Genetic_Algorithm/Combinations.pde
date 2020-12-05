class Combinations {
  int[] combination = new int[24];  
  
  //Contructor to get into the class
  Combinations() {
    for (int i=0; i <24; i++) {
      combination[i] = combination[i];
    }
  }
  
  //Loop to generate Yes(1) and No(0) numbers for each item in the itemList
  Combinations(int f) {
    for (int i=0; i <24; i++) {
      combination[i] = (int)(random(2));
    }
  }

  //Returns the total value of an itemList
  int getValue() {
    int value=0;
    for (int i=0; i <24; i++) {
      Items item = itemList[i];
      int v =item.value;
      value = value + v*combination[i];
    }
    return value;
  }

  //Returns the total weight of an itemList
  int getWeight() {
    int weight=0;
    for (int i=0; i <24; i++) {
      Items item = itemList[i];
      int w =item.weight;
      weight = weight + w*combination[i];
    }
    return weight;
  }

  //Prints the Combination
  void printCombi() {
    for (int i=0; i <24; i++) {
      print(combination[i]);
    }
    println();
  }
}
