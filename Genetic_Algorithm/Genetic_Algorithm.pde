//This project was made using code from other sources (some used as inspiration and some was copied over):

/* We have used CodeBullet's code for making a genetic algorithm. 
 * Here is a link to the video he posted about it, along with a link to the GitHub-repo:
 * Video Link: https://www.youtube.com/watch?v=BOZfhUcNiqk
 * Repo Link: https://github.com/Code-Bullet/Smart-Dots-Genetic-Algorithm-Tutorial
 * 
 *
 * We have also used code from Mohammad's brother, who also had done this project once before.
 * His code can be found in a folder located in our GitHub repository
 * The folders name is "Mohammads Brors kode"
*/ 


Population[] pop;

int itemAmount = 24;  //we have 24 unique items to play around with
int generationsAmount = 50;  //set the amount of generations the program will go through

void setup() {
  pop = new Population[generationsAmount];  //1 population per generation, therefore as many populations, as we have geneerations
  
  size(500, 500);
  background(255);
  
  
}


void draw() {
  background(255);
  
}
