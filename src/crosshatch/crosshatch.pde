import milchreis.imageprocessing.*;
import java.io.File;
import processing.svg.*;
/*
  --Cross-hacthing--
 Author: Yang Na
 Date: Fall 2019
 input: an image
 output: cross haching of the input
 */


PImage image;

void setup() {
  //load image
  selectInput("Select a file to process:", "fileSelected");
  while (image == null)  delay(100);
  //set canvas the same size as input image
  surface.setSize(image.width, image.height);
  smooth();
  /*Save a vectorizer version of output
    to use this, also uncomment the line endRecord();
    at the bottom, and comment image(cannyEdge, 0, 0);
    because the edge layer is made of plixes*/
  //beginRecord(SVG, "filename.svg");  
}

void draw() {
  background(255); 
  //PImage edge = edgeDetector(image);
  //import canny edge written in java by Milchreis: https://github.com/Milchreis/processing-imageprocessing/blob/master/src/milchreis/imageprocessing/CannyEdgeDetector.java
  PImage cannyEdge = CannyEdgeDetector.apply(image);
  int Psize = cannyEdge.width*cannyEdge.height;
  int brightSum = 0;
  // the origianl cannyEdge is white with black background, switch the balck and white
  for (int i = 0; i < Psize; i++) {
    brightSum += brightness(image.pixels[i]);
    if (cannyEdge.pixels[i] != color(255))
      cannyEdge.pixels[i] = color(255);
    else
      cannyEdge.pixels[i] = color(100);
  }
  //Drawing the edge layer------------
  image(cannyEdge, 0, 0);

  int imgSize = cannyEdge.width * cannyEdge.height;




  image.loadPixels();
  for (int y=0; y<image.height-1; y++) {
    int pushX = -1;
    int pushLX = -1;
    for (int x=0; x<image.width-1; x++) {
      int index = x + y*image.width;
      float b = brightness(image.pixels[index]);
      int pushY = -1; 

      final float maxBright = (image.width*image.height)/800;  
      float sumBrightX = 0;
      float sumBrightY = 0;
      float sumBrightL = 0; //lines from top_right to bottom_left
      float sumBrightR = 0; //lines from top_left to bottom_right

      int densityX = 10;
      int densityY = 10; 
      int prevDX = 10;
      int prevDY = 10;
      float densityL = 10;
      float densityR = 10;  

      boolean findingDX = true;
      boolean findingDY = true;
      boolean findingDL = true;
      boolean findingDR = true;

      //fix when the whole input image is bright
      int avgBright = brightSum/Psize;
      if (avgBright > 190 && b<225 ) {
        b -= (avgBright-100);
      }
      if (b<0) b=0;
      //if (x*y == 1) print("average brightness:"+ avgBright);

      //set the density of horizontal lines
      int detailX = 40;
      for (int i=0; i<255 && findingDX; i+=detailX) {
        if (b>=i && b<i+detailX) {
          prevDX = densityX;
          densityX = 4* ((i/detailX) + 1);
          findingDX = false;
        }
      }
      //set the density of vertical lines
      int detailY = 30;
      for (int i=0; i<255 && findingDY; i+=detailY) {
        if (b>=i && b<i+detailY) {
          prevDY = densityY;
          densityY = 2* ((i/detailY) + 1);
          findingDX = false;
        }
      }
      ////set the density for / lines
      //int detailL = 30;
      //for (int i=0; i<255-detailL && findingDL; i+=detailL) {
      //  if (b>=i && b<i+detailL) {
      //    densityL = 2* ((i/detailL) + 1);
      //    findingDL = false;
      //  }
      //}

      int tempX = 0;
      int tempY = 0;
      float dc = 1; //density controler
      int errorY = (detailY-1)%prevDY; //make the density smooth transition
      int errorX = (detailX-1)%prevDX; //make the density smooth transition




      //Drawing horizontal lines-----------------------------------------------------------
      if (y%densityX==0 && b<240 && x>=pushX) { //need to add edge


        float edgeBoundX = brightness(cannyEdge.pixels[y+x+tempX]);
        while (sumBrightX <= maxBright && tempX<image.width && edgeBoundX!=0) {
          if (brightness(cannyEdge.pixels[index+ tempX]) != 255)
            break;  //stop the line if it hits an edge

          if (brightness(image.pixels[index+ tempX]) > 200)
            break; //remove redundant lines that appear out of range

          sumBrightX += brightness(image.pixels[index+tempX]);
          tempX++;
        }
        //stroke(0);
        line(x, y, x+tempX, y); //the | line
        pushX = x+tempX; //avoid repeatedly drawing
      }


      //Drawing vertical lines--------------------------------------------------------------
      if ((x-errorY)%densityY==0  && b<210 && y>=pushY) { //need to add edge


        while (sumBrightY <= maxBright && index+ (tempY*image.width)<image.height) {
          if (brightness(cannyEdge.pixels[index+ (tempY*image.width)]) != 255)
            break;  //stop the line if it hits an edge

          if (brightness(image.pixels[index+ (tempY*image.width)]) > 150)
            break; //remove redundant lines that appear out of range

          sumBrightY += brightness(image.pixels[index+ (tempY*image.width)]);
          tempY++;
        }   
        //stroke(0);
        line(x, y, x, y+tempY); //the —— line
        pushY = y+tempY; //avoid repeatedly drawing
      } 



      densityX *= dc;
      densityY *= dc;
      //int random = (int)(Math.random() * 5);

      //Drawing / lines--------------------------------------------------------------
      if (y%(densityX)==0 && (x-errorY)%(densityY)==0   && b<150 ) { //need to add edge

        //stroke(0,200,0);
        int aX = 0;
        int bY = 0;
        while ((aX<densityY || bY<densityX) && (index + bY*cannyEdge.width - aX) < imgSize) {
          if (brightness(cannyEdge.pixels[index + bY*cannyEdge.width - aX]) != 255)
            break;  //stop the line if it hits an edge

          if (brightness(image.pixels[index + bY*cannyEdge.width - aX]) > 230)
            break; //stop the line if it is out of range

          if (aX<densityY)
            aX++;
          if (bY<densityX)
            bY++;
        }
        line(x, y, x-aX, y+bY); //the / line
        //line(x-densityY/2, y, x-densityY*3/2, y+densityX);
        //pushY = y+tempL; //avoid repeatedly drawing
        //pushLX = x-tempL;
      } 


      //Drawing \ lines--------------------------------------------------------------
      if (y%(densityX)==0 && (x-errorY)%(densityY)==0    && b<100  ) { //need to add edge
        int aX = 0;
        int bY = 0;
        while ((aX<densityY || bY<densityX) && (index + bY*cannyEdge.width + aX) < imgSize) {
          if (brightness(cannyEdge.pixels[index + bY*cannyEdge.width + aX]) != 255)
            break;  //stop the line if it hits an edge

          if (brightness(image.pixels[index + bY*cannyEdge.width + aX]) > 230)
            break; //stop the line if it is out of range

          if (aX<densityY)
            aX++;
          if (bY<densityX)
            bY++;
        }

        //stroke(0,200,0);
        line(x, y, x+aX, y+bY); //the \ line
        //pushY = y+tempL; //avoid repeatedly drawing
        //pushLX = x-tempL;
      }
    }
  }
  image.updatePixels();

  //endRecord();
  save("output.jpg");
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    image = loadImage(selection.getAbsolutePath());
  }
}
