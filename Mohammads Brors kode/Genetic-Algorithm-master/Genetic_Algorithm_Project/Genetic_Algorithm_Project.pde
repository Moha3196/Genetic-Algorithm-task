//Abdullah and Magnus DDU. Genetic Algorithm Project

//Amount of Combinations to be done
int CombAmount = 50;
boolean TestCombiCheck;
//ArrayList for itemList
Items[] itemList = new Items[24];
int[][] validItemCombis = new int[50][24];
//Items[] validItemCombis = new Items[0];


//Name of the item objects
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
  //Constructing the items objects with Name, Weight and Value
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

  int correctCombinations = 0;
  //For Loop that runs multiple Combinations according to the CombAmount set
  for (int i = 0; i < CombAmount; i++) {
    Combinations TestCombi = new Combinations();
    if (TestCombi.getWeight() < 5001) { 
      TestCombi.printCombi();
      println("Value:" + " " + TestCombi.getValue());
      println("Weight:" + " " +  TestCombi.getWeight());
      TestCombiCheck = true;

      //Stores the correct combinations into a new array with the name validItemCombis.
      for (int x = 0; x < 24; x++) {
        validItemCombis[correctCombinations][x] = TestCombi.combination[x];
        //print(validItemCombis[correctCombinations][TestCombi.combination[x]]);
      }
      println();
      correctCombinations++;
    }

    if (TestCombi.getWeight() > 5000) {
      TestCombiCheck = false;
    }
  }

  //Prints all combinations inside the array validItemCombis
  for (int i = 0; i < correctCombinations; i++) {
    println();
    for (int x = 0; x < 24; x++) {
      print(validItemCombis[i][x]);
      //println();
    }
  }
}

void draw() {
}
