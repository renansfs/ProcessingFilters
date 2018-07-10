
PImage[] img = new PImage[3];
  
void setup(){
  
   size(1600, 900);
   img[0] = loadImage("resultg.jpg");
   img[1] = loadImage("result2.jpg");
   img[2] = createImage(img[1].width,img[1].height,RGB);
   noLoop();
}

void draw(){

  image(img[0], 0,0 );
  image(img[1], img[0].width ,0);
  
  for(int i = 0; i < img[1].width * img[1].height; i++){
    
      float red = red(img[0].pixels[i]) - red(img[1].pixels[i]);
      float blue = blue(img[0].pixels[i]) - blue(img[1].pixels[i]);
      float green = green(img[0].pixels[i]) - green(img[1].pixels[i]);
  
    img[2].pixels[i] = color(red, green, blue);
  }
  img[2].updatePixels();
  img[2].save("cibsobel.jpg");
  image(img[2], img[0].width*2,0);
}