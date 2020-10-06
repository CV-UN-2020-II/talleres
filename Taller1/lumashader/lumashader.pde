import processing.video.*;
Movie myMovie;
PImage img;

PShader lumaShader;

void setup() {
  size(800,400,P3D);    
  myMovie = new Movie(this, "bailehb.mp4");  
  img = myMovie.get();
  myMovie.loop();  
  lumaShader = loadShader("lumashader.glsl");
}

void draw() {
  background(100);
  shader(lumaShader); 
  if (myMovie.available()) {   
    background(255);
    myMovie.read();    
    img = myMovie.get(); 
    image(img, 450, 0,350,400);
    resetShader();
  }
  image(img, 0, 0,350,400);
  print("Frame Rate:  ");
  println(frameRate); 

}