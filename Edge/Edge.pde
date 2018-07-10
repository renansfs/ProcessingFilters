/*Kernel Edge Detection*/
float[][] kernelx = {{ 1, 0, -1}, 
                    { 2,  0, -2}, 
                    { 1, 0, -1}};
                    
float[][] kernely = {{ 1, 2, 1}, 
                    { 0,  0, 0}, 
                    { -1, -2, -1}};
                    
PImage img;

void setup() { 
  /*Carrega a imagem original*/
  size(1024, 500);
  img = loadImage("resultg.jpg");
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
      float rx = 0;
      float gx = 0;
      float bx = 0;
      float ry = 0;
      float gy = 0;
      float by = 0;
      
      /*Passa o Kernel*/
      for(int ky = 0; ky < kernelx.length; ky++){
        for(int kx = 0; kx < kernelx.length; kx++){
          int loc = (ky + (y-1))*img.width + (kx+(x-1));
          //Verifica se nao saiu da imagem
          loc = constrain(loc,0,img.pixels.length-1);
            rx += red(img.pixels[loc]) * kernelx[kx][ky];
            gx += green(img.pixels[loc])* kernelx[kx][ky];
            bx += blue(img.pixels[loc]) *kernelx[kx][ky];
            ry += red(img.pixels[loc]) * kernely[kx][ky];
            gy += green(img.pixels[loc])* kernely[kx][ky];
            by += blue(img.pixels[loc]) *kernely[kx][ky];
        }
      
      }
      rx = sqrt((rx * rx ) + (ry * ry));
      gx = sqrt((gx * gx ) + (gy * gy));
      bx = sqrt((bx * bx ) + (by * by));
      mFilter.pixels[y*img.width + x] = color(rx, gx, bx);
    }
  }
  // State that there are changes to edgeImg.pixels[]
  mFilter.updatePixels();

  //image(mFilterx,width/2, 0);
  image(mFilter, width/2,0);
  mFilter.save("result2.jpg");
}