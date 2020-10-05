import processing.video.*;
Movie myMovie;
PImage image;

boolean toggle;
PShader lumaShader;
boolean luma;

void setup() {
  size(1840,720, P3D);    
  myMovie = new Movie(this, "chaves.mp4");  
  image = myMovie.get();
  myMovie.loop();  
  lumaShader = loadShader("lumashader.glsl");
}

void draw() {
  background(100); 
    shader(lumaShader); 
  if (myMovie.available()) {   
    background(255);
    myMovie.read();    
    image = myMovie.get(); 
    image(image, 952, 0);
    resetShader();
  }
  image(image, 0, 0);
  print(" framecount  ");
  println(frameCount);
  print("framerate  ");
  print(frameRate);  
}