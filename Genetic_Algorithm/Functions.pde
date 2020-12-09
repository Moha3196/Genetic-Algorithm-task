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
  int[] matingPool = new int[2];
  int choseParent1 = 0;
  int choseParent2 = 0;
  float randomParent1 = (float)random(0, 100);
  float randomParent2 = (float)random(0, 100);
  float fitnessScales = 0;
  for (int i = 0; i < population; i++) {    
    fitnessScales += getScaledFitness(i, population, chosenArray);
    if (randomParent1 <= fitnessScales && choseParent1 == 0) {
      matingPool[0] = i;
      choseParent1++;
    } else if (randomParent2 <= fitnessScales && choseParent2 == 0) {
      matingPool[1] = i;
      choseParent2++;
    } else if (choseParent1 == 1 && choseParent2 == 1) {
      break;
    }
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
  //While loop the keeps producing babies till the number of babies equals number of population
  while (babiesProduced < population) {
    int[] matingPool = chooseParent(oldGen);
    int parent1 = matingPool[0];
    int parent2 = matingPool[1];
    int randomSplit = (int)random(1, 23);
    for (int x = 0; x < randomSplit; x++) {
      testingBabies[0][x] = oldGen[parent1][x];
    }
    for (int x = randomSplit; x < 24; x++) {
      testingBabies[0][x] = oldGen[parent2][x];
    }
    mutate(0, testingBabies);

    if (getWeight(0, testingBabies) < 5001) {
      for (int x = 0; x < 24; x++) {
        newGen[babiesProduced][x] = testingBabies[0][x];
      }
      babiesProduced++;
    }
  }
  currentGeneration++;
  babiesProduced = 0;
}
