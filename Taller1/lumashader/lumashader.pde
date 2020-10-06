import processing.video.*;
Movie myMovie;
PImage image;

PShader lumaShader;

void setup() {
  size(800,400, P3D);    
  myMovie = new Movie(this, "baile.mp4");  
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
    image(image, 450, 0,350,400);
    resetShader();
  }
  image(image, 0, 0,350,400);
  print("Frame Rate:  ");
  println(frameRate); 

}