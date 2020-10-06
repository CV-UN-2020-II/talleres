import processing.video.*;
Movie myMovie;
PImage image2;

void setup() {
  size(325, 245);
  myMovie = new Movie(this, "video1.mp4");
  image2 = myMovie.get();
  myMovie.loop();
}

void draw() {
  if (myMovie.available()) {
    myMovie.read();
    processFrame();
  }
  image(image2, 0, 0);
  print("framerate  ");
  print(myMovie.frameRate);  
  print(" framecount  ");
  println(frameCount);
}

void processFrame(){
  image2 = myMovie.get();
  for (int i = 0; i < image2.width * image2.height; i++) {
    color c = image2.pixels[i];
    image2.pixels[i] = color((red(c)+green(c)+blue(c))/3);
  }
}
