/*Kernel */
float[][] kernel = {{ -1, -1, -1}, 
                    { -1,  9, -1}, 
                    { -1, -1, -1}};
                    
PImage img;

void setup() { 
  /*Carrega a imagem original*/
  size(1024, 500);
  img = loadImage("foto2.jpeg");
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
      for(int ky = y - 1; ky <= y + 1; ky++){
        for(int kx = x - 1; kx <= x + 1; kx++){
          int loc = ky*img.width + kx;
          //Verifica se nao saiu da imagem
          loc = constrain(loc,0,img.pixels.length-1);
            r += (red(img.pixels[loc]));
            g += (green(img.pixels[loc]));
            b += (blue(img.pixels[loc]));
        }
      
      }
      r = r/9;
      g = g/9;
      b = b/9;
      
      mFilter.pixels[y*img.width + x] = color(r, g, b);
      
    }
  }
  // State that there are changes to edgeImg.pixels[]
  mFilter.updatePixels();
  //biFilter.pixels[img.width] = color(0, 0, 0);
  image(mFilter, width/2, 0); // Draw the new image
}