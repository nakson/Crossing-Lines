import milchreis.imageprocessing.*;
PImage image;

void setup(){
  //load image
  image = loadImage("3.jpg");
  //set canvas the same size as input image
  surface.setSize(image.width, image.height);
  smooth();
  
}

void draw(){
  background(255);
  PImage edge = edgeDetector(image);
  PImage cannyEdge = CannyEdgeDetector.apply(image);
  for (int i = 0; i < cannyEdge.width*cannyEdge.height; i++) {
      if (cannyEdge.pixels[i] != color(255))
        cannyEdge.pixels[i] = color(255);
      else
        cannyEdge.pixels[i] = color(100);
  }
    
  if(mousePressed) {
    image(image, 0, 0);
  } else { 
   image(cannyEdge, 0, 0);
  }
  int imgSize = cannyEdge.width * cannyEdge.height;
  
   
  
  
  image.loadPixels();
  for(int y=0; y<image.height-1; y++){
    int pushX = -1;
    int pushLX = -1;
    for(int x=0; x<image.width-1; x++){
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
      float densityL = 10;
      float densityR = 10;  
      
      boolean findingDX = true;
      boolean findingDY = true;
      boolean findingDL = true;
      boolean findingDR = true;
      
      //set for density of horizontal lines
      int detailX = 40;
      for(int i=0; i<255-detailX && findingDX; i+=detailX){
        if(b>=i && b<i+detailX){
          densityX = 4* ((i/detailX) + 1);
          findingDX = false;
        }
      }
      //set for density of vertical lines
      int detailY = 30;
      for(int i=0; i<255-detailY && findingDY; i+=detailY){
        if(b>=i && b<i+detailY){
          densityY = 2* ((i/detailY) + 1);
          findingDX = false;
        }
      }
      //set density for / lines
      int detailL = 30;
      for(int i=0; i<255-detailL && findingDL; i+=detailL){
        if(b>=i && b<i+detailL){
          densityL = 10* ((i/detailL) + 1);
          findingDL = false;
        }
      }
      
      int tempX = 0;
      int tempY = 0;
      float dc = 1; //density controler


      //Drawing horizontal lines-----------------------------------------------------------
      if(y%densityX==0 && b<200 && x>=pushX){ //need to add edge
        
        
        float edgeBoundX = brightness(cannyEdge.pixels[y+x+tempX]);
        while(sumBrightX <= maxBright && tempX<image.width && edgeBoundX!=0){
          sumBrightX += brightness(image.pixels[index+tempX]);
          tempX++;
        }
        //stroke(0);
        line(x, y, x+tempX, y); //the | line
        pushX = x+tempX; //avoid repeatedly drawing
      }
        

      //Drawing vertical lines--------------------------------------------------------------
      if(x%densityY==0  && b<150 && y>=pushY){ //need to add edge
        
        
        while(sumBrightY <= maxBright && index+ (tempY*image.width)<image.height){
          sumBrightY += brightness(image.pixels[index+ (tempY*image.width)]);
          tempY++;
        }   
        //stroke(0);
        line(x, y, x, y+tempY); //the —— line
        pushY = y+tempY; //avoid repeatedly drawing
      } 
      
      
      
      densityX *= dc;
      densityY *= dc;
      
      //Drawing / lines--------------------------------------------------------------
      if(y%(densityX)==0 && x%(densityY)==0   && b<230 ){ //need to add edge

        //stroke(0,200,0);
        int aX = 0;
        int bY = 0;
        while((aX<densityY || bY<densityX) && (index + bY*cannyEdge.width - aX) < imgSize){
           if(brightness(cannyEdge.pixels[index + bY*cannyEdge.width - aX]) != 255)
             break;
           
           if(aX<densityY)
             aX++;
           if(bY<densityX)
             bY++;
        }
        line(x, y, x-aX, y+bY); //the / line
        //line(x-densityY/2, y, x-densityY*3/2, y+densityX);
        //pushY = y+tempL; //avoid repeatedly drawing
        //pushLX = x-tempL;
      } 
      
      
      //Drawing \ lines--------------------------------------------------------------
      if(y%(densityX)==0 && x%(densityY)==0    && b<100  ){ //need to add edge
        int aX = 0;
        int bY = 0;
        while((aX<densityY || bY<densityX) && (index + bY*cannyEdge.width + aX) < imgSize){
           if(brightness(cannyEdge.pixels[index + bY*cannyEdge.width + aX]) != 255)
             break;
           
           if(aX<densityY)
             aX++;
           if(bY<densityX)
             bY++;
        }

        //stroke(0,200,0);
        line(x, y, x+aX, y+bY); //the \ line
        //pushY = y+tempL; //avoid repeatedly drawing
        //pushLX = x-tempL;
      } 
       
      
        
    }
  }
  
  
  
  //save("output.jpg");
}


/*
stroke(#607F9C);
strokeWeight(10);
*/
