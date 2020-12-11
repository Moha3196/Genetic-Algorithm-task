//The following 4 functions are pretty short and easily understood without tons of comments

//Returns the total value of an itemList/combination
int getValue(int combinations, int[][] chosenArray) {
  int value = 0;
  for (int i = 0; i < 24; i++) {
    Items item = itemList[i];
    int v = item.value;  //the value of the specified item
    value += v * chosenArray[combinations][i];
  }
  return value;
}


//Returns the total weight of an itemList/combination
int getWeight(int combinations, int[][] chosenArray) {
  int weight = 0;
  for (int i = 0; i < 24; i++) {
    Items item = itemList[i];
    int w = item.weight;
    weight += w * chosenArray[combinations][i];
  }
  return weight;
}


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
  float scaledFitness = map(fitness, 0, totalFitness, 0, 100);  //to map the fitness (which is what actually scales it)
  return scaledFitness;
}


//Returns a mating-pool of chosen parents
int[] chooseParent(int[][] chosenArray) {
  int[] matingPool = new int[chooseParentSize];  //where the chosen parents are stored
  int[] chooseParent = new int[chooseParentSize];  //keeps track of which parents have been chosen
  float[] randomParent = new float[chooseParentSize];
  int parentsTotal = 0;  //to make sure the amount of chosen parents is reset

  for (int i = 0; i < chooseParentSize; i++) {
    chooseParent[i] = 0;
    randomParent[i] = (float)random(100);  //randomly chooses a parent-candidate
  }

  float fitnessScales = 0;
  for (int i = 0; i < population; i++) {    
    fitnessScales += getScaledFitness(i, population, chosenArray);
    for (int x = 0; x < chooseParentSize; x++) {
      if (randomParent[x] <= fitnessScales && chooseParent[x] == 0) {  //checks if a randomly chosen parent is good enough (has high enough fitness)
        matingPool[x] = i;  //if so, then adds the parent to the mating-pool
        chooseParent[x] = 1;  //adds the chosen parents to the array that keeps track of chosen and rejected parents
        parentsTotal++;  //updates the counter, so we know when we have enough parents
      } else if (parentsTotal == chooseParentSize) {  //if we've reached our desired amount of parents
        break;  //if so, stops the loop so we don't try to find more parents, that won't be used
      }
    }
  }
  return matingPool;  //returns the (now full) mating-pool
}


//Function that mutates the items in bag
void mutate(int index, int[][] chosenArray) {
  for (int x = 0; x < 24; x++) {  //to loop through the entire combination
    if (random(1) < mutationRate) {
      if (chosenArray[index][x] == 0) {  //if-else statement to switch the value of a part of a combination, to it's opposite value
        chosenArray[index][x] = 1;
      } else {
        chosenArray[index][x] = 0;
      }
    }
  }
}


//Function that makes crossovers (produces babies for the next generation)
void crossover(int[][] oldGen, int[][] newGen) {
  int[][] testingBabies = new int[1][24];
  int[][] tempNewGen = new int[population][24];  //temporary storage of the babies, before they are added/copioed to the new generation
  int[] matingPool = new int[chooseParentSize];
  int parentChooser = 0;

  int parent1 = 0;  //for choosing parents
  int parent2 = 0;  //"
  
  //While loop the keeps producing babies till the number of babies equals number of population
  while (babiesProduced < population) {
    if (parentChooser == 0) {
      matingPool = chooseParent(oldGen);
    }

    parent1 = matingPool[parentChooser];  //picks a parent from the mating-pool
    parent2 = matingPool[parentChooser + 1];  //picks the next parent in line

    int randomSplit = (int)random(1, 23);  //randomly split a parent-combination. Then takes first part from parent1 and the rest from parent2

    for (int x = 0; x < randomSplit; x++) {
      testingBabies[0][x] = oldGen[parent1][x];
    }
    for (int x = randomSplit; x < 24; x++) {
      testingBabies[0][x] = oldGen[parent2][x];
    }

    if (parentChooser == chooseParentSize - 2) {
      parentChooser = 0;
    } else {
      parentChooser += 2;  //advances the parentChooser so we can continue and in the end go through all the parents
    }

    //mutate(0, testingBabies);  //for some reason we get consistantly better result *without* mutation (typically around 800-900 with and about 900-950+ without)

    if (getWeight(0, testingBabies) < 5001) {  //gets the weight of the produced babies. If they are valid (at or under 5000 g of weight) then continues
      for (int x = 0; x < 24; x++) {
        tempNewGen[babiesProduced][x] = testingBabies[0][x];  //adds the babies to an array for temporary storage
      }
      babiesProduced++; //update the amount of babies produced so the next baby is added to the next index in the temporary storage
    }
  }
  for (int i = 0; i < population; i++) {
    for (int x = 0; x < 24; x++) {
      newGen[i][x] = tempNewGen[i][x];  //add/copy the babies from the temporary storage, to the actual new generation
    }
  }

  currentGeneration++;  //advances the current generation, since the new generation was just created
  babiesProduced = 0;  //resets the amount of produced babies
}
