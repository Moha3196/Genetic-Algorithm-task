void frame() {
  fill(0);
  
  if (generationsCreated >= 10 && generationsCreated < 100) {
    scaledAxisNumbers = 5;
  }
  if (generationsCreated >= 100 && generationsCreated < 200) {
    scaledAxisNumbers = 10;
  }
  if (generationsCreated >= 200 && generationsCreated < 500) {
    scaledAxisNumbers = 25;
  }
  if (generationsCreated >= 500 && generationsCreated < 1000) {
    scaledAxisNumbers = 50;
  }
  if (generationsCreated >= 1000 && generationsCreated < 2000) {
    scaledAxisNumbers = 100;
  }
  if (generationsCreated > 2000) {
    scaledAxisNumbers = 500;
  }
  
  
  for (int i = 0; i < width; i += zoomX) {
    stroke(0);
    line(0, height/2, width, height/2);  //Creates x-asix
    line(width/2, 0, width/2, height);   //Creates y-axis

    //x-axis
    text(round(i/zoomX * scaledAxisNumbers), (5 + i * scaledAxisNumbers) +3, -5);  //Positive x-axis numbers

    //grid
    stroke(0);
    line(5 + i * scaledAxisNumbers, 0, 5 + i * scaledAxisNumbers, -height);              //Verticle lines on the right of y-axis
    
  }
  for (int i = 0; i < width; i += zoomY) {
    line(0, -i, width, -i);         //Horizontal lines above x-axis
    if (!((i/zoomX)*100 == 0)) {  //so we don't write two zero's on the axes
      text(round(i/zoomY)*100, 5, -i - 2);  //Positive y-axis numbers
    }
  }
}


void graphFirst(float rectHeight) {  //rectHeight will be the height of the rect, and is therefore the average fitness
  rectHeight = map(rectHeight, 0, 1220, 0, height);  //we say "1220" because it seems to draw about 20 pixels over 1200
  fill(100);
  rect(0, 0, rectWidth, rectHeight);
}

void graphSecond(float rectHeight) {
  rectHeight = map(rectHeight, 0, 1220, 0, height);
  fill(100);
  rect(rectWidth, 0, rectWidth, rectHeight);
}

void graphRemaining(float rectPosX, float rectHeight) {
  rectHeight = map(rectHeight, 0, 1220, 0, height);
  stroke(70);
  fill(100);
  rect(rectPosX, 0, rectWidth, rectHeight);
}
