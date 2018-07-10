
PImage img;

void setup(){
  size(442, 247);
  img = loadImage("cibed1.jpg");
}


void draw() {  

  loadPixels();
  for (int x = 0; x < img.pixels.length; x++) {
      // Get the R,G,B values from image
      float r = red   (img.pixels[x]);
      float g = green (img.pixels[x]);
      float b = blue  (img.pixels[x]);
      // Calculate an amount to change brightness 
      // based on proximity to the mouse
      
      // Constrain RGB to between 0-255
      r = 255 - r;
      g = 255 - g;
      b = 255 - b;
      // Make a new color and set pixel in the window
      color c = color(r,g,b);
      img.pixels[x] = c;
      
  }
  updatePixels();
  img.save("cib.jpg");
  image(img, 0, 0);
  

}