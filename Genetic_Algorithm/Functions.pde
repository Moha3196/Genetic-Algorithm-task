//Returns the total value of an itemList
int getValue(int combinations, int[][] chosenArray) {
  int value = 0;
  for (int i = 0; i < 24; i++) {
    Items item = itemList[i];
    int v = item.value;
    value += v * chosenArray[combinations][i];
  }
  return value;
}

//Returns the total weight of an itemList
int getWeight(int combinations, int[][] chosenArray) {
  int weight = 0;
  for (int i = 0; i < 24; i++) {
    Items item = itemList[i];
    int w = item.weight;
    weight += w * chosenArray[combinations][i];
  }
  return weight;
}

////Returns the fitness
//float getFitness(int combinations, int[][] chosenArray) {
//  float value = getValue(combinations, chosenArray);
//  float fitness = value;
//  return fitness;
//}

//Returns the total fitness
float getTotalFitness(int combinations, int[][] chosenArray) {
  float totalFitness = 0; 
  for (int i = 0; i < combinations; i++) {
    totalFitness += getValue(i, chosenArray);
  }
  return totalFitness;
}

//Returns the scaled fitness
float getScaledFitness(int currentCombination, int totalCombinations, int[][] chosenArray) {
  float totalFitness = getTotalFitness(totalCombinations, chosenArray);
  float fitness = getValue(currentCombination, chosenArray);
  float scaledFitness = map(fitness, 0, totalFitness, 0, 100);
  return scaledFitness;
}

//Returns a chosen parent
int[] chooseParent(int[][] chosenArray) {
  int chooseParentSize = 16; 
  int[] matingPool = new int[chooseParentSize];
  int[] chooseParent = new int[chooseParentSize];
  float[] randomParent = new float[chooseParentSize];

  for (int i = 0; i < chooseParentSize; i++) {
    chooseParent[i] = 0;
    randomParent[i] = (float)random(100);
  }

  float fitnessScales = 0;
  for (int i = 0; i < population; i++) {    
    fitnessScales += getScaledFitness(i, population, chosenArray);
    for (int x = 0; x < chooseParentSize; x++) {
      if (randomParent[x] <= fitnessScales && chooseParent[x] == 0) {
        matingPool[x] = i;
        chooseParent[x] = 1;
      } else if (chooseParent[chooseParentSize - (chooseParentSize - x)] == 1) {
        break;
      }
    }
    //if (randomParent1 <= fitnessScales && chooseParent1 == 0) {
    //  matingPool[0] = i;
    //  chooseParent1 = 1;
    //} else if (randomParent2 <= fitnessScales && chooseParent2 == 0) {
    //  matingPool[1] = i;
    //  chooseParent2 = 1;
    //} else if (randomParent3 <= fitnessScales && chooseParent3 == 0) {
    //  matingPool[2] = i;
    //  chooseParent3 = 1;
    //} else if (randomParent4 <= fitnessScales && chooseParent4 == 0) {
    //  matingPool[3] = i;
    //  chooseParent4 = 1;
    //} else if (randomParent5 <= fitnessScales && chooseParent5 == 0) {
    //  matingPool[4] = i;
    //  chooseParent5 = 1;
    //} else if (randomParent6 <= fitnessScales && chooseParent6 == 0) {
    //  matingPool[5] = i;
    //  chooseParent6 = 1;
    //} else if (randomParent7 <= fitnessScales && chooseParent7 == 0) {
    //  matingPool[6] = i;
    //  chooseParent7 = 1;
    //} else if (randomParent8 <= fitnessScales && chooseParent8 == 0) {
    //  matingPool[7] = i;
    //  chooseParent8 = 1;
    //} else if (chooseParent1 == 1 && chooseParent2 == 1 && chooseParent3 == 1 && chooseParent4 == 1 &&
    //  chooseParent5 == 1 && chooseParent6 == 1 && chooseParent7 == 1 && chooseParent8 == 1) {
    //  break;
    //}
  }
  return matingPool;
}

//Function that mutates the items in bag
void mutate(int index, int[][] chosenArray) {
  for (int x = 0; x < 24; x++) {
    if (random(1) < mutationRate) {
      if (chosenArray[index][x] == 0) {
        chosenArray[index][x] = 1;
      } else {
        chosenArray[index][x] = 0;
      }
    }
  }
}

//Function that makes crossovers/produces babies for the next generation
void crossover(int[][] oldGen, int[][] newGen) {
  int[][] testingBabies = new int[1][24];
  int[][] tempNewGen = new int[population][24];
  int[] matingPool = new int[8];
  int parentChooser = 0;
  int parent1 = 0;
  int parent2 = 0;
  //While loop the keeps producing babies till the number of babies equals number of population
  while (babiesProduced < population) {
    if (parentChooser == 0) {
      matingPool = chooseParent(oldGen);
    }
    if (parentChooser == 0) {
      parent1 = matingPool[0];
      parent2 = matingPool[1];
    } else if (parentChooser == 1) {
      parent1 = matingPool[2];
      parent2 = matingPool[3];
    } else if (parentChooser == 2) {
      parent1 = matingPool[4];
      parent2 = matingPool[5];
    } else if (parentChooser == 3) {
      parent1 = matingPool[6];
      parent2 = matingPool[7];
    }
    int randomSplit = (int)random(1, 23);

    for (int x = 0; x < randomSplit; x++) {
      testingBabies[0][x] = oldGen[parent1][x];
    }
    for (int x = randomSplit; x < 24; x++) {
      testingBabies[0][x] = oldGen[parent2][x];
    }
    if (parentChooser == 0) {
      parentChooser = 1;
    } else if (parentChooser == 1) {
      parentChooser = 2;
    } else if (parentChooser == 2) {
      parentChooser = 3;
    } else if (parentChooser == 3) {
      parentChooser = 0;
    }

    //mutate(0, testingBabies);

    if (getWeight(0, testingBabies) < 5001) {
      for (int x = 0; x < 24; x++) {
        //newGen[babiesProduced][x] = testingBabies[0][x];
        tempNewGen[babiesProduced][x] = testingBabies[0][x];
      }
      babiesProduced++;
    }
  }
  for (int i = 0; i < population; i++) {
    for (int x = 0; x < 24; x++) {
      newGen[i][x] = tempNewGen[i][x];
    }
  }

  currentGeneration++;
  babiesProduced = 0;
}
