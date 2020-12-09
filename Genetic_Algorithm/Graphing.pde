void frame() {
  fill(0);
  
  //if () {
    
  //}
  
  for (int i = 0; i < width; i += zoom) {
    stroke(0);
    line(0, height/2, width, height/2);  //Creates x-asix
    line(width/2, 0, width/2, height);   //Creates y-axis

    //x-axis
    text(i/zoom, 5 + i, -2);  //Positive x-axis numbers
    text(-i/zoom, 5 - i, -2); //Negative x-axis numbers

    //y-axis
    text(i/zoom, 5, -i - 2);  //Positive y-axis numbers
    text(-i/zoom, 5, i - 2);  //Negative y-axis numbers

    //grid
    stroke(70);
    //line(-i, -height, -i, height);  //Verticle lines on the left of y-axis
    line(0, -i, width, -i);    //Horizoomontal lines above x-axis
    line(i, 0, i, -height);    //Verticle lines on the right of y-axis
    //line(-width, i, width, i);      //Horizoomontal lines under x-axis
  }
}


void graphDevelopment() {
  
}
