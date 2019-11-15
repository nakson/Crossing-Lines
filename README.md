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
  - Name of the Project
  - Student name, Supervisor name, Date

- **Abstract** 	(1/2 page)
  - a small summary of what this report is about.

- **Introduction** 	(2 pages + 1/2 images)
  - intro what is cross-hatching
  - aims/motivation of the project
  - problem statement
    - the most important (/interesting) parts of the project
    - the design choices (drawing separated layers of lines)
    - the most difficult part
    - why was it difficult
  - overview
    - what was achieved
    - any discovery during the project
    - what did I learn
- **Background** 	(2 pages + 1 images)
  - how to draw cross-hatching by hand (+images)
  - what problem am I solving technically, and why solving it
  - existing work
    - tone matching (+images)
    - canny edge detection (+images)
    - other background research (+images)
    - how does this relate to other work in this area
  - software
    - why use processing
- **Algorithm** 	(5 pages + 2 images)
  - problem analysis
    - what are main features to implement
    - for each features, problems need to solve
  - solution design (+images, output illustration)
    - short answer of each problems above
  - how the method works (+images, draft result after implemented parts of methods)
    - methods in details, separate by layers and features
    - code details (pseudocode of key parts)
    - explain why chose this way
    - explain how they work together
  - justify steps
    - how the program was verified 
    - put images of each layer of results  (+images)
- **Results** 	(4 pages + 3 images)
  - various test cases (+images)
    - different kinds of input images
  - result and discussion
  - evaluation
    - how the results look with different kind of inputs
  - successes, limitations 
    - what parts did implemented, which parts is not good enough and why
- **Conclusion** 	(1 page)
  - main result
  - future work
  - advice to future students

- **References**



#### Code Issues

- Let "—" lines and "|" lines stop when they hit an edge
- Remove redundant lines that shouldn't appear (ex. / lines in cat image)
- Make the grayscale image smooth transition
- Let the density of lines more flexible (add some randomness)
- Make the coverage of each layers dynamically (ex. depends on the direction of nearby edges)
- For the part that is in bright area but still need more details (ex. face), force down the brightness to draw more lines (usually this kind of areas are inside of a closed edges)
- Image vectorizer 

