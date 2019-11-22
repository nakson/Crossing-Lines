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

![scdvgj](/pic/Captdsdsd.PNG)

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
	diff = abs(brightness(p[i]) - brightness(p[neighbor]));
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

![scdvgj](/pic/scdvgj.jpg)

## Blog #4  Canny edge 

![wdad23](/pic/c1.png)

![wdad23](/pic/ccat.png)



## Blog #5 Two layers of lines

![wdad23](/pic/wdad23.jpg)

![ikhugu7](/pic/ikhugu7.jpg)

![wdad23](/pic/asadefreg.jpg)

![wdad23](/pic/5tjguh.jpg)





## Blog #6 Added two diagonal layers

Now there are 5 layers of lines: edge + horizontal + vertical + two diagonal

![wdad23](/pic/b111.png)



![wdad23](/pic/c111.jpg)



![wdad23](/pic/h111.png)



![wdad23](/pic/m111.jpg)



![wdad23](/pic/s111.jpg)



#### Things that still need to be done:

- In the grayscale image, some vertical parts (small ranges of brightness) are not smooth transition.
- In the cat image, there are a few redundant / lines.
- The skin (face, hand, etc.) of character is not clear, because most faces are very bright. 





## Blog #7 Next stage plan

#### More testing images:

![wdad23](/pic/brid.jpg)

![wdad23](/pic/hj.jpg)

![wdad23](/pic/phone.jpg)

![wdad23](/pic/gh.jpg)



#### Outline of the Report

**Format:** 

> Font: Times New Roman, 12
>
> Line Spacing: double

- **Cover page** 	
  - Name of the Project: Crossing Lines
  - Student name: Yang Na, Supervisor name: David Mould, Submit date: Dec 13, 2019

- **Abstract 	(1/2 page)**
  
  -  A small summary of what this report is about
    - image processing, cross hatching, what the program does (input, output)
  
- **Introduction 	(2 pages + 1/2 images)**
  
  - intro to cross-hatching (+images, hand drawing)
    - definition of hatching and cross-hatching  
    - the history of cross-hatching technique
    - explanations, what it should look like, why is it encountered by artist
  - aims/motivation of the project
    - the importance of cross-hatching
    - looks beautiful. It is a basic and classical way to stylish an image
    - it is a very logical way of drawing, figuring out the math behind this kind of sketch is interesting
  - problem statement
    - the most important (/interesting) parts of the project
      - simulating and achieve the cross-hatching style of hand drawing using code 
    - the design choices 
      - drawing in layers
      - this is easier to analysis and design, and will be easy to test each layer of crossing
    - the most difficult part
      - how to cover different areas with different brightness
        - how to decide which layer of lines to cover which area
        - the key points is density of lines and how to find the appropriate end points of each line
    - why was it difficult
      - sometimes it is easy for human eyes to figure, however it is not easy for a computer
  - overview
    - what was achieved in this project
      - 5 layers of drawing (edge layer, horizontal and vertical layers, and two diagonal layers)
      - lines in darker area are more intensive than lines in brighter area 
      - the darker area covers more layers of lines
    - any discovery during the project
      - image vectorizer 
      - some bright area like human face need special treatment, otherwise it will be vague
    - what did I learn
  
- **Background 	(2 pages + 1 images)**
  
  - how to draw cross-hatching by hand (+images of each layers)
  
    - hatching: lines, shadows and perspective
    - cross-hatching: layers of hatching, usually each two layers are perpendicular
  
  - software
  
    - processing: 
      - designed to code within the context of the visual arts
      - many useful build in libraries
  
  - what problem am I solving technically, and why solving it
  
    - digital images are stored as an array of pixels in computer
    - each pixel has it's index, so we can control and make changes to the image by modify pixels
    - drawing lines in processing is actually finding the appropriate two end points of each line
    - each pixel from an image has it's brightness, and it is a number from 0 to 255
  
  - existing work
    - tone matching (+images)
    - canny edge detection (+images)
    - other background research (+images)
    - how does this relate to other work in this area
    
    
  
- **Algorithm 	(5 pages + 2 images)**

  - problem analysis
    - the main features to implement:
      1. A base layer that detects edges  from input image 
      2. For every other layer, lines are parallel to each other  
      3. Lines should cover dark areas and avoid  light areas  
      4. Lines on different layers should find a proper angle  to cross other layer’s lines 
      5. Allow users to choose a local image file and save the output image.  
    - for each features, problems need to solve
      1. the edges layer should has a clear view of the main objects of the image
      2. lines are parallel in same layer
      3. the density of parallel lines depend on the brightness where the lines are covering
      4. the horizontal lines and vertical lines are perpendicular to each other. The two oblique lines layers may not be perpendicular, they need to be in the direction of diagonals of rectangles that created by first two layers
      5. pop-up window to choose input image from local directory
  - solution design (+images, output illustration)
    
    1. canny edge detection is used for the edge layer, since it can smooth the image with a Gaussian filter to reduce noise and unwanted details and textures
    
       - this step can be achieved by using existing work of others
    
    2. the length of each line should also depends on the brightness, so the lines are longer in darker areas, and shorter in brighter areas
    
       - this step can be achieved by setup a counter that count how many pixels should be included in current line
       - should avoid overlapping lines, although it is the same visually
    
    3. the gaps between parallel lines is more smaller, when the area is more darker
    
       - this step can be achieved through dividing the brightness into ranges, then let the line gaps in different ranges different value
       - in order to make the output looks more natural, need to add a little randomness to the gap
    
    4. the oblique lines need to be parallel to the diagonals, but it is not necessary on diagonals
    
    5. make the program as a simple executable application
    
       - small button, pop-up window, run on Windows or Linux
    
       - this step is easy to implement with in processing
  - how the method works (+images, draft result after implemented parts of methods)
    - methods in details
      1. canny edge detection (pseudocode, explain, +image)
      2. set a fixed maximum value, when the counter sum up the brightness of pixels and reach the maximum value, that is the length of the line (pseudocode, explain, also explain how to avoid overlapping) 
      3. density of lines (pseudocode, explain, +image)
      4. the layers of oblique lines (similarities and differences with horizontal and vertical lines)
    - explain how they work together
      - put all layers together (+image)
  - justify steps
    - how the program was verified 
      - check if it meets all the features that required
    - put images of each layer of results  (+images)

- **Results 	(2 pages + 5 images)**
  
  - various test cases (+images)
    
    - grayscale images
    - clear background
    - single object like car
    - animals hair
    - streets and buildings
    - drake night
    - natural images
    - low resolution image
    - high resolution image
    - comic book image
    - portrait 
    - image with text
  - result and discussion
    - how the results look with all kinds of inputs
    - 
  
  - evaluation
    
    - the overall clarity
    - 
    
  - successes, limitations 
    
    - successes: all layers of crossing lines as expected
    
      ​                    it works fine with hairs because short hairs look like lines
    
      ​				    it works well with indoor images with natural lights that contain a lot of objects
    
    - limitations: not very clear with low pixels image and human skins
    
      ​					 running time is slow when the input image is big
  
- **Conclusion 	(1 page) **
  
  - main result
    - A base layer that detects edges  from input image 
    2. For every other layer, lines are parallel to each other  
    3. Lines should cover dark areas and avoid  light areas  
    4. Lines on different layers should find a proper angle  to cross other layer’s lines 
    5. Allow users to choose a local image file and save the output image.  
  - future work
    - optimize algorithm, better run time
    - instead of using straight lines, cross-hatching with curves
- advice to future students
  
- **References**





#### Code Issues

- Let — lines and | lines stop when they hit an edge
- Remove redundant lines that shouldn't appear (ex. / lines in cat image)
- Make the grayscale image smooth transition
- Let the density of lines more flexible (add some randomness)
- Make the coverage of each layers dynamically (ex. depends on the direction of nearby edges)
- For the part that is in bright area but still need more details (ex. face), force down the brightness to draw more lines (usually this kind of areas are inside of a closed edges)
- Image vectorizer 



