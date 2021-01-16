/*
  This is a edge detector metod by 
  comparing the difference of brightness
  between a pixel and its 8 neighbours.
  
  Usage: PImage edge = edgeDetector(image);
*/
//Edge detection
PImage edgeDetector(PImage img){
  PImage output = createImage(img.width, img.height, RGB);
  
  //img.pixels.length
  img.loadPixels();
  //loadPixels(); 
  for (int x=0; x < img.width; x++){
    for (int y=0; y < img.height; y++){
      //get the brightness of the current location
      int curr = x + y*img.width;
      float b1 = brightness(img.pixels[curr]);
      
       //replace the pixels on four bounds
      if(x==0 || y==0 || x==img.width-1 || y==img.height-1 ){
        output.pixels[curr] = color(255);
      }
      //find edges 
      else{
        //get the brightness of the pixel above the curr
        int up    = x + (y-1)*img.width;
        float bUp = brightness(img.pixels[up]);
        //get the brightness of the pixel under the curr
        int down = x + (y+1)*img.width;
        float bDown = brightness(img.pixels[down]);
        //get the brightness of the left pixel of curr
        int left = (x-1) + y*img.width;
        float bLeft = brightness(img.pixels[left]);
        //get the brightness of the right pixel of curr
        int right = (x+1) + y*img.width;
        float bRight = brightness(img.pixels[right]);
        
        //get the brightness of the upleft pixel
        int upLeft = (x-1) + (y-1)*img.width;
        float bUpLeft = brightness(img.pixels[upLeft]);
        //get the brightness of the upright pixel
        int upRight = (x+1) + (y-1)*img.width;
        float bUpRight = brightness(img.pixels[upRight]);
        //get the brightness of the downright pixel
        int downRight = (x-1) + (y+1)*img.width;
        float bDownRight = brightness(img.pixels[downRight]);
        //get the brightness of the downleft pixel
        int downLeft = (x+1) + (y+1)*img.width;
        float bDownLeft = brightness(img.pixels[downLeft]);
        
        //the differences of brightness between curr pixel and neighbours
        float diffU  = abs(b1-bUp);
        float diffD  = abs(b1-bDown);
        float diffL  = abs(b1-bLeft);
        float diffR  = abs(b1-bRight);
        float diffUL = abs(b1-bUpLeft);
        float diffUR = abs(b1-bUpRight);
        float diffDL = abs(b1-bDownLeft);
        float diffDR = abs(b1-bDownRight);
        final float di = 5;
     //   if(diffU > di || diffD > di || diffL > di || diffR > di ||
     //      diffUL > di || diffUR > di || diffDL > di || diffDR > di){
        if(diffU > di){
          output.pixels[curr] = color(50);
        }  else{
          output.pixels[curr] = color(255);
        }
      }
      
    }
  }

  img.updatePixels();

  return output;
}
