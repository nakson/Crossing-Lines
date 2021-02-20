# Crossing Lines


## Intro

Crosshatching is a traditional drawing technique that had been used by artists for centuries. It is a way to present a picture by drawing layers of dense parallel lines from different angles. The idea is to show the form, dimension, and shadow of an image only by lines. The main objective of this project is to implement the process of taking an image as input, then producing a crosshatching style image as output. 

## Installation  
### Prebuilt release  
Go to [Release Page](https://github.com/nakson/Crossing-Lines/releases).  

good start for future improvements.



## Examples

**Original image**                                                                 **Output image**

![hall](https://img2020.cnblogs.com/blog/2292583/202102/2292583-20210220192445975-735800093.png)

![peach](https://img2020.cnblogs.com/blog/2292583/202102/2292583-20210220192441798-1403833573.png)

![beach](https://img2020.cnblogs.com/blog/2292583/202102/2292583-20210220192438229-596549540.png)

![citybeach](https://img2020.cnblogs.com/blog/2292583/202102/2292583-20210220192428567-1213759285.png)

![city](https://img2020.cnblogs.com/blog/2292583/202102/2292583-20210220192423029-1586098834.png)

![bird](https://img2020.cnblogs.com/blog/2292583/202102/2292583-20210220192417844-1001581944.png)



## Solution design

The solution design can be split into five steps, which are separated by the five layers. One edge layer and four other layers that based on halftoning.

**#1 the edge-layer** ( [CannyEdgeDetector by Müller, 2018](https://github.com/Milchreis/processing-imageprocessing))

![layer01](https://img2020.cnblogs.com/blog/2292583/202102/2292583-20210220192406668-1586679503.jpg)

**#2 horizontal lines.** Lines in this layer must be parallel to each other, and only in one direction. Also, the lines should cover dark areas and avoid bright areas. And the density of lines depends on the brightness of the current area. 

![layer02](https://img2020.cnblogs.com/blog/2292583/202102/2292583-20210220192405391-827283098.png)

**#3 vertical lines.** Lines in this layer are the same as horizontal lines, except the direction of this layer is perpendicular to the horizontal layer. 

![layer03](https://img2020.cnblogs.com/blog/2292583/202102/2292583-20210220192405095-1017041114.png)

**#4 oblique lines.** bottom-left to top-right.

![layer04](https://img2020.cnblogs.com/blog/2292583/202102/2292583-20210220192404634-920060671.png)

**#5 oblique lines.** top-left to bottom-right.

![layer05](https://img2020.cnblogs.com/blog/2292583/202102/2292583-20210220192403566-2029563505.png)

