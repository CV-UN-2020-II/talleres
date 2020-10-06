import processing.video.*;
Movie myMovie;
PImage img;

void setup() {
  size(800,400);
  myMovie = new Movie(this, "bailehb.mp4");
  img = myMovie.get();
  myMovie.loop();
}

void draw() {
  if (myMovie.available()) {
    myMovie.read();
    luma();
    image(img,450,0,350,400);
  }
  image(myMovie, 0, 0,350,400);
  print("Frame Rate:  ");
  println(frameRate);  
}

void luma(){
  img = myMovie.get();
  for (int i = 0; i < img.pixels.length; i++) {
    color c = img.pixels[i];
    img.pixels[i] = color((red(c)*0.2126+green(c)*0.7152+blue(c)*0.0722));
  }
}
