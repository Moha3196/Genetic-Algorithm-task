void frame() {
  fill(0);
  
  if (generationsCreated >= 10 && generationsCreated < 20) {
    //scaledZoom /= 10;
  }
  
  for (int i = 0; i < width; i += zoomX) {
    stroke(0);
    line(0, height/2, width, height/2);  //Creates x-asix
    line(width/2, 0, width/2, height);   //Creates y-axis

    //x-axis
    text(round(i/zoomX), 5 + i, -2);  //Positive x-axis numbers

    //grid
    stroke(70);
    line(i, 0, i, -height);              //Verticle lines on the right of y-axis
    
  }
  for (int i = 0; i < width; i += zoomY) {
    line(0, -i, width, -i);         //Horizontal lines above x-axis
    text(round(i/zoomY)*100, 5, -i - 2);  //Positive y-axis numbers
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
  fill(100);
  rect(rectPosX, 0, rectWidth, rectHeight);
}
