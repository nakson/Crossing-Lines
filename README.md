## Description

- **MAIN OBJECTIVES**

  - Crosshatching is a traditional drawing technique that have been used by
    artists for centuries. It is a way to present a picture by drawing layers of
    dense lines in different angles. The main objectives are implementing the image processing from a general image to a crosshatching image, and furthermore a curve version of crosshatching.

- **EQUIPMENT REQUIREMENTS**

  - [Processing](https://processing.org/)

- **EXPECTED DELIVERABLES**

  - Main features to implement:
    - A base layer that detects edges from input image
    - For every other layer, lines are parallel to each other
    - Lines on different layers should find a proper angle to cross other layer’s lines
    - Lines should cover dark areas and avoid light areas
    - Allow users to choose a local image file and save the output image
  - Possible additional features:
    - A better user interfaces.
    
    - Use curve instead of only straight lines to optimize the output image.
    
      

| **BI-WEELY SECHEDULE**                                       |
| :----------------------------------------------------------- |
| **Sep. 23   -   Oct.   7**                                   |
|  - Finish the edge detection layer  <br>                                                                                                  -  Designing an algorithm for drawing lines      <br>                                                                                    -  Finish the second layer which draws parallel lines in one   direction     <br>                                                        -  Making more specific implementation   plans         <br>                                                                              -  Meet with   supervisor to discuss the progress |
| **Oct.** **7**     **-   Oct. 21**                           |
| -  Developing software            <br>                                                                                                   -  Evaluating   implementations, testing       <br>                                                                                     -  Improving algorithm                 <br>                                                                                             -  Drawing additional   layers of lines in different directions   <br>                                                                   -  Meet with supervisor to discuss the progress |
| **Oct. 21   -   Nov. 4**                                     |
| -  Evaluating implementations, testing,   and polishing <br>                                                                             -  Finish the main features                                 <br>                                                                         -  Meet with supervisor to discuss the progress |
| **Nov. 4   -   Nov. 18**                                     |
| -  Working on additional features (curve crosshatching, UI, other feasible features)   <br>                                             -  Meet with supervisor to discuss the progress |
| **Nov. 18   -     Dec. 2**                                   |
| -  Working on project report           <br>                                                                                             -  First draft of final report   (due Nov 29)         <br>                                                                               -  Submit final report (due Dec 13) |



## Blog #1 Crosshatching

#### How to draw crosshatching by hand?

<p align="center">
  <img style="zoom: 50%;" src="/pic/Captdsdsd.PNG">
</p>

- Drawing five layers of closely spaced parallel lines in different angles
  - Layer 0: outline the edges. The following layers are inside of this layer.
  - Layer 1: closely spaced parallel lines in one detection
  - Layer 2: closely spaced parallel lines at 90 degree angle to layer_1
  - Layer 3: closely spaced parallel lines at 45 degree angle to layer_1
  - Layer 4: closely spaced parallel lines at 90 degree angle to layer_3

![meitu_0](/pic/meitu_0.jpg)



#### My plan of drawing crosshatching using Processing

- Also five layers of closely spaced parallel lines in different angles
  - The base layer detects the edges of the input image
  - For other four layers of lines:
    - lines should be inside of the edges
    - the density and length of lines should depend on the brightness of the input image





## Blog #2 Edge Detector

![hondaTypeR](/pic/hondaTypeR.jpg)

#### Algorithm

- Comparing the brightness of each pixel with it's eight neighbors
- If the difference of  brightness is too big, then this pixel is a part of edges

``` java
for each pixel p[i] of the image:
	diff = brightness(p[i]) - brightness(p[neighbor]);
	if(diff > 20):
		update p[i] to a black pixel
	else
		update p[i] to a white pixel
```

###### When the difference of brightness is > 15:

![15](/pic/15.jpg)

###### When the difference of brightness is > 40:

![40](/pic/40.jpg)

![meitu_1](/pic/meitu_1.jpg)





## Blog #3 Try one layer of lines

#### Things that need to figure out:

- How to make sure the lines do not appear in white space outside of edges?
- How to control the length of the lines?
  - maybe optimize the edge-layer
- How to control the density of lines according to dark and bright areas?
  - need to load both the edge-layer and original input image

<img src="/pic/scdvgj.jpg" alt="scdvgj" style="zoom:50%;" />
