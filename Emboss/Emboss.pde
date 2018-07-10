/*Kernel Emboss*/
float[][] kernel = {{ -2, -1, 0}, 
                    { -1,  1, 1}, 
                    { 0, 1, 2}};
                    
                    
PImage img;

void setup() { 
  /*Carrega a imagem original*/
  size(1024, 500);
  img = loadImage("foto2.jpg");
  noLoop();
}

void draw() {
  /*Mostra a Imagem Original*/
  image(img, 0, 0);
  /*Carrega os pixels da imagem original*/
  img.loadPixels();
  /*Cria uma Copia da Imagem original*/
  PImage mFilter = createImage(img.width, img.height, RGB);
  /*Percorre os pixeis com o kernel x - 1 e y - 1*/
  for (int y = 1; y < img.height - 1; y++) {
    for (int x = 1; x < img.width - 1; x++) {
      float r = 0;
      float g = 0;
      float b = 0;
      
      /*Passa o Kernel*/
      for(int ky = 0; ky < kernel.length; ky++){
        for(int kx = 0; kx < kernel.length; kx++){
          int loc = (ky + (y-1))*img.width + (kx+(x-1));
          //Verifica se nao saiu da imagem
          loc = constrain(loc,0,img.pixels.length-1);
            r += red(img.pixels[loc]) * kernel[kx][ky];
            g += green(img.pixels[loc])* kernel[kx][ky];
            b += blue(img.pixels[loc]) *kernel[kx][ky];
        }
      
      }
      
      mFilter.pixels[y*img.width + x] = color(r, g, b);
      
    }
  }
  // State that there are changes to edgeImg.pixels[]
  mFilter.updatePixels();
  image(mFilter, width/2, 0); // Draw the new image
  mFilter.save("mFilter.jpg");
}