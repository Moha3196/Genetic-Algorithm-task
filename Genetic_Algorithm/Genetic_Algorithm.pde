//Mohammad and Niklas DDU. Genetic Algorithm Project

//Amount of Combinations to be done
int CombAmount = 200;
int correctCombinations = 0;
boolean TestCombiCheck;

//Array for itemList
Items[] itemList = new Items[24];
int[][] validItemCombis = new int[50][24];
int[][] matingPool = new int[50][24];
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
        TestCombi.printCombi();
        println("Value: " + TestCombi.getValue());
        println("Weight: " +  TestCombi.getWeight());
        TestCombiCheck = true;

        //Stores the correct combinations into a new array with the name validItemCombis.
        for (int x = 0; x < 24; x++) {
          validItemCombis[correctCombinations][x] = TestCombi.combination[x];
        }
        println();  //used throughout the code to create a little space between elements in the console
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
    println("Value: " + getValue(i));
    println("Weight: " + getWeight(i));
    println("Fitness is: " + getFitness(i));
    println(getFitness(i)/getTotalFitness(correctCombinations));
    println();
  }
  println("Total Fitness: " + getTotalFitness(correctCombinations));

  //println(chooseParent());
  //println(correctCombinations);
}



void draw() {
  //temporarily blank, because we've not reached the point of making a graph for anything yet
}

//Returns the total value of an itemList
int getValue(int combinations) {
  int value = 0;
  for (int i = 0; i < 24; i++) {
    Items item = itemList[i];
    int v = item.value;
    value = value + v * validItemCombis[combinations][i];
  }
  return value;
}

//Returns the total weight of an itemList
int getWeight(int combinations) {
  int weight = 0;
  for (int i = 0; i < 24; i++) {
    Items item = itemList[i];
    int w = item.weight;
    weight = weight + w * validItemCombis[combinations][i];
  }
  return weight;
}

//Returns the fitness
float getFitness(int combinations) {
  float weight = getWeight(combinations);
  float value = getValue(combinations);
  float fitness = value/weight;
  return fitness;
}

//Returns the total fitness
float getTotalFitness(int combinations) {
  float totalFitness = 0; 
  for (int i = 0; i < combinations; i++) {
    totalFitness += getFitness(i);
  }
  return totalFitness;
}

//Returns the scaled fitness
float getScaledFitness(int currentCombination, int totalCombinations) {
  float totalFitness = getTotalFitness(totalCombinations);
  float fitness = getFitness(currentCombination);
  float scaledFitness = fitness/totalFitness;
  return scaledFitness;
}

//Returns a chosen parent
int chooseParent() {
  int finalIndex = 0;
  float randomNumber = (float)random(0, 1);
  float fitnessScales = 0;
  for (int i = 0; i < correctCombinations; i++) {    
    fitnessScales += getScaledFitness(i, correctCombinations);
    if (randomNumber <= fitnessScales) {
      finalIndex = i;
      break;
    }
  }
  return finalIndex;
}

//int crossover(){
  
    //int parent1 = chooseParent();
    //int parent2 = chooseParent();
  
  //for (int x = 0; x < 24; x++) {
    //  print(validItemCombis[parent1][x]);
    //  //println();
    //}

    //for (int x = 0; x < 24; x++) {
    //  print(validItemCombis[parent2][x]);
    //  //println();
    //}

    //for (int x = 0; x < 12; x++) {
    //  print(validItemCombis[parent1][x]);
    //  //println();
    //}
    //for (int x = 12; x < 24; x++) {
    //  print(validItemCombis[parent2][x]);
    //  //println();
    //}
    
    //println();
    //println();
  
  
//}
