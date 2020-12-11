void frame() {
  fill(0);
  
  if (generationsCreated >= 10 && generationsCreated < 20) {
    scaledZoom /= 10;
  }
  
  for (int i = 0; i < width; i += zoomX) {
    stroke(0);
    line(0, height/2, width, height/2);  //Creates x-asix
    line(width/2, 0, width/2, height);   //Creates y-axis

    //x-axis
    text(round(i/zoomX), 5 + i, -2);  //Positive x-axis numbers

    //grid
    stroke(70);
    line(0, -i, width, -i);         //Horizontal lines above x-axis
    
  }
  for (int i = 0; i < width; i += zoomY) {
    line(i, 0, i, -height);              //Verticle lines on the right of y-axis
    text(round(i/zoomY)*100, 5, -i - 2);  //Positive y-axis numbers
  }
}


void graphFirst(float rectHeight) {
  stroke(0);
  //line(0, 0, currentGeneration * zoom, (-(getTotalFitness(population, validItemCombis)/population)));
  rectHeight = map(rectHeight, 0, 1200, 0, height);
  rect(width/2, 0, 50, rectHeight);
}

void graphSecond() {
  
}

void graphRemaining() {
}
