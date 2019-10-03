# Description

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
    -	A simple user interfaces.
    -	Use curve instead of only straight lines to optimize the output image.