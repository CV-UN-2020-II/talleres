import processing.video.*;
Movie myMovie;
PImage img;
PFont f;  

float [][] matrix;

void setup() {
  size(800,550);  
   f = createFont("Arial",16,true);
    textFont(f,16);                  
  //fill(0);                         
  text("Elegir b para blur effect o e para deteccion de bordes ",10,15); 
  myMovie = new Movie(this, "baile.mp4");  
  img = myMovie.get();
  myMovie.loop();
}

void draw() {
 
 if(matrix!=null){
   if (myMovie.available()) {   
    myMovie.read();
    mask();    
    image(img, 450, 50, 350,400);
  }
  image(myMovie, 0, 50, 350,400);  
  print("framecount  ");
  print(frameCount);
  print("  framerate  ");
  println(frameRate);
 }
    
}

void mask(){   
  
  int matrixsize = 3; 
  img = myMovie.get();
  
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      int loc = x + y*img.width;
      color c;  
      c = convolution(x, y, matrix, matrixsize, img);
      img.pixels[loc] = c;
       
    }
  }
}

color convolution(int x, int y, float[][] matrix, int matrixsize, PImage img)
{
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  int offset = matrixsize / 2;
  for (int i = 0; i < matrixsize; i++){
    for (int j= 0; j < matrixsize; j++){
      int xloc = x+i-offset;
      int yloc = y+j-offset;
      int loc = xloc + img.width*yloc;
      loc = constrain(loc,0,img.pixels.length-1);
      rtotal += (red(img.pixels[loc]) * matrix[i][j]);
      gtotal += (green(img.pixels[loc]) * matrix[i][j]);
      btotal += (blue(img.pixels[loc]) * matrix[i][j]);      
    }
  }
  rtotal = constrain(rtotal,0,255);
  gtotal = constrain(gtotal,0,255);
  btotal = constrain(btotal,0,255);

  return color(rtotal, gtotal, btotal);
}

void keyPressed(){
  // Edge detection
  if(key == 'b'){    
    float[][] newmatrix = { { 0.11, 0.11, 0.11 },
                            { 0.11, 0.11, 0.11 },
                            { 0.11, 0.11, 0.11 } };
    matrix = newmatrix;
  }else if(key == 'e'){
    float[][] newmatrix = { { -6, 0, 0},
                            { 0, 6, 0 },
                            { 0, 0, -6 }};     
    matrix = newmatrix;
  }if(key == 'c'){    
    float[][] newmatrix = {{ -2, -2, -2},
                      { -2, 10, -2 },
                      { -2, -2, -2 }};
    matrix = newmatrix;
  }
}

