//Mohammad and Niklas DDU. Genetic Algorithm Project

//Amount of Combinations to be done
int CombAmount = 200;
int correctCombinations = 0;
int babiesProduced = 0;
int currentGeneration = 1;
boolean TestCombiCheck;

//Array for itemList
Items[] itemList = new Items[24];
int[][] validItemCombis = new int[50][24];
int[][] matingPool = new int[50][24];
int[][] testingBabies = new int[50][24];
float[] fitness = new float[50];
//Items[] validItemCombis = new Items[0];


//Name of the item objects (there are a lot, and they all have unique values, like their names, so we have to make each one)
Items Map;
Items Compas;
Items Water;
Items Sandwich;
Items Sugar;
Items Cannedfood;
Items Banana;
Items Apple;
Items Cheese;
Items Beer;
Items Sunscreen;
Items Camera;
Items TShirt;
Items Pants;
Items Parasol;
Items WaterproofPants;
Items WaterproofOuterwear;
Items Wallet;
Items Sunglasses;
Items Towel;
Items Socks;
Items Book;
Items Notebook;
Items Tent;

void setup() {
  //Constructing the items with Name, Weight and Value
  Map = new Items("Map", 90, 150);
  itemList[0] = Map;

  Compas = new Items("Compas", 130, 35);
  itemList[1] = Compas;

  Water =  new Items("Water", 1530, 200);
  itemList[2] = Water;

  Sandwich = new Items("Sandwich", 500, 160);
  itemList[3] = Sandwich;

  Sugar = new Items("Sugar", 150, 60);
  itemList[4] = Sugar;

  Cannedfood = new Items("Cannedfood", 680, 45);
  itemList[5] = Cannedfood;

  Banana = new Items("Banana", 270, 60);
  itemList[6] = Banana;

  Apple = new Items("Apple", 390, 40);
  itemList[7] = Apple;

  Cheese = new Items("Cheese", 230, 30);
  itemList[8] = Cheese;

  Beer = new Items("Beer", 520, 10);
  itemList[9] = Beer;

  Sunscreen = new Items("Sunscreen", 110, 70);
  itemList[10] = Sunscreen;

  Camera = new Items("Camera", 320, 30);
  itemList[11] = Camera;

  TShirt = new Items("TShirt", 240, 15);
  itemList[12] = TShirt;

  Pants = new Items("Pants", 480, 10);
  itemList[13] = Pants;

  Parasol = new Items("Parasol", 730, 40);
  itemList[14] = Parasol;

  WaterproofPants = new Items("WaterproofPants", 420, 70);
  itemList[15] = WaterproofPants;

  WaterproofOuterwear = new Items("WaterproofOuterwear", 430, 75);
  itemList[16] = WaterproofOuterwear;

  Wallet = new Items("Wallet", 220, 80);
  itemList[17] = Wallet;

  Sunglasses = new Items("Sunglasses", 70, 20);
  itemList[18] = Sunglasses;

  Towel = new Items("Towel", 180, 12);
  itemList[19] = Towel;

  Socks = new Items("Socks", 40, 50);
  itemList[20] = Socks;

  Book = new Items("Book", 300, 10);
  itemList[21] = Book;

  Notebook = new Items("Notebook", 900, 1);
  itemList[22] = Notebook;

  Tent = new Items("Tent", 2000, 150);
  itemList[23] = Tent;

  TestCombiCheck = false;


  //For Loop that runs multiple Combinations according to the CombAmount set

  for (int i = 0; i < CombAmount; i++) {
    Combinations TestCombi = new Combinations(0);

    //Prints all the correct combinations where weight is below the limit
    if (correctCombinations < 24) {
      if (TestCombi.getWeight() < 5001) { 
        //TestCombi.printCombi();
        //println("Value: " + TestCombi.getValue());
        //println("Weight: " +  TestCombi.getWeight());
        TestCombiCheck = true;

        //Stores the correct combinations into a new array with the name validItemCombis.
        for (int x = 0; x < 24; x++) {
          validItemCombis[correctCombinations][x] = TestCombi.combination[x];
        }
        //println();  //used throughout the code to create a little space between elements in the console
        correctCombinations++;
      }
    }

    //Doesnt print anything if the weight over the limit
    if (TestCombi.getWeight() > 5000) {
      TestCombiCheck = false;
    }
  }


  //Prints all combinations inside the array validItemCombis
  //Also prints the Value, Weight, Fitness and the Fitness ratio
  for (int i = 0; i < correctCombinations; i++) {
    for (int x = 0; x < 24; x++) {
      print(validItemCombis[i][x]);
      //println();
    }
    println();
    println("Value: " + getValue(i, validItemCombis));
    println("Weight: " + getWeight(i, validItemCombis));
    println("Fitness is: " + getFitness(i, validItemCombis));
    println(getFitness(i, validItemCombis)/getTotalFitness(correctCombinations, validItemCombis));
    println();
  }
  println();
  println();
  println();
  println();
  println();
  println();
  println();
  println();
  println();
  println();
  
  //Prints the Generation number and the total fitness
  println("Current Generation: " + currentGeneration);
  println("The total fitness for Current Generation: " + getTotalFitness(24,validItemCombis));
  println();
  crossover(validItemCombis, matingPool);
  println("Current Generation: " + currentGeneration);
  println("The total fitness for Current Generation: " + getTotalFitness(24,matingPool));
  println();
  crossover(matingPool, matingPool);
  println("Current Generation: " + currentGeneration);
  println("The total fitness for Current Generation: " + getTotalFitness(24,matingPool));
  println();
  crossover(matingPool, matingPool);
  println("Current Generation: " + currentGeneration);
  println("The total fitness for Current Generation: " + getTotalFitness(24,matingPool));
  println();
  crossover(matingPool, matingPool);
  println("Current Generation: " + currentGeneration);
  println("The total fitness for Current Generation: " + getTotalFitness(24,matingPool));
  println();
  crossover(matingPool, matingPool);
  println("Current Generation: " + currentGeneration);
  println("The total fitness for Current Generation: " + getTotalFitness(24,matingPool));
  println();
  crossover(matingPool, matingPool);
  println("Current Generation: " + currentGeneration);
  println("The total fitness for Current Generation: " + getTotalFitness(24,matingPool));
  println();
  crossover(matingPool, matingPool);
  println("Current Generation: " + currentGeneration);
  println("The total fitness for Current Generation: " + getTotalFitness(24,matingPool));
  
  println();
  
  //Prints all combinations inside the array matingPool
  //Also prints the Value, Weight, Fitness and the Fitness ratio
  for (int i = 0; i < correctCombinations; i++) {
    for (int x = 0; x < 24; x++) {
      print(matingPool[i][x]);
      //println();
    }
    println();
    println("Value: " + getValue(i, matingPool));
    println("Weight: " + getWeight(i, matingPool));
    println("Fitness is: " + getFitness(i, matingPool));
    println(getFitness(i, matingPool)/getTotalFitness(correctCombinations, matingPool));
    println();
  }  
  println("Total Fitness: " + getTotalFitness(correctCombinations, validItemCombis));
  println("Current Generation: " + currentGeneration);
  //println(chooseParent());
  //println(correctCombinations);
}



void draw() {
  //temporarily blank, because we've not reached the point of making a graph for anything yet
}

//Returns the total value of an itemList
int getValue(int combinations, int[][] chosenArray) {
  int value = 0;
  for (int i = 0; i < 24; i++) {
    Items item = itemList[i];
    int v = item.value;
    value = value + v * chosenArray[combinations][i];
  }
  return value;
}

//Returns the total weight of an itemList
int getWeight(int combinations, int[][] chosenArray) {
  int weight = 0;
  for (int i = 0; i < 24; i++) {
    Items item = itemList[i];
    int w = item.weight;
    weight = weight + w * chosenArray[combinations][i];
  }
  return weight;
}

//Returns the fitness
float getFitness(int combinations, int[][] chosenArray) {
  float weight = getWeight(combinations, chosenArray);
  float value = getValue(combinations, chosenArray);
  float fitness = value/weight;
  return fitness;
}

//Returns the total fitness
float getTotalFitness(int combinations, int[][] chosenArray) {
  float totalFitness = 0; 
  for (int i = 0; i < combinations; i++) {
    totalFitness += getFitness(i, chosenArray);
  }
  return totalFitness;
}

//Returns the scaled fitness
float getScaledFitness(int currentCombination, int totalCombinations, int[][] chosenArray) {
  float totalFitness = getTotalFitness(totalCombinations, chosenArray);
  float fitness = getFitness(currentCombination, chosenArray);
  float scaledFitness = fitness/totalFitness;
  return scaledFitness;
}

//Returns a chosen parent
int chooseParent(int[][] chosenArray) {
  int finalIndex = 0;
  float randomNumber = (float)random(0, 1);
  float fitnessScales = 0;
  for (int i = 0; i < correctCombinations; i++) {    
    fitnessScales += getScaledFitness(i, correctCombinations, chosenArray);
    if (randomNumber <= fitnessScales) {
      finalIndex = i;
      break;
    }
  }
  return finalIndex;
}

//Function that makes crossovers/produces babies for the next generation
void crossover(int[][] oldGeneration, int[][] newGeneration) {
  //While loop the keeps producing babies till the number of babies equals 24
  while (babiesProduced < 24) {
    for (int x = 0; x < 12; x++) {
      testingBabies[0][x] = oldGeneration[chooseParent(oldGeneration)][x];
    }
    for (int x = 12; x < 24; x++) {
      testingBabies[0][x] = oldGeneration[chooseParent(oldGeneration)][x];
    }

    if (getWeight(0, testingBabies) < 5001) {
      TestCombiCheck = true;

      for (int x = 0; x < 12; x++) {
        newGeneration[babiesProduced][x] = testingBabies[chooseParent(testingBabies)][x];
      }
      for (int x = 12; x < 24; x++) {
        newGeneration[babiesProduced][x] = testingBabies[chooseParent(testingBabies)][x];
      }
      babiesProduced++;
    }
  }
  currentGeneration++;
  babiesProduced = 0;
}
