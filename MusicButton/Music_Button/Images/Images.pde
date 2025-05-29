//Global Variables
int appWidth, appHeight;
float imageDivX, imageDivY, imageDivWidth, imageDivHeight;
float imageXChanged, imageYChanged, imageWidthChanged, imageHeightChanged;
//
PImage myFirstImage;
color viridian=#40826D
//
void setup() {
  //Display
  //fullScreen();
  size(700, 500);
  appWidth = width; //displayWidth
  appHeight = height; //displayHeight
  //
  //Population
  imageDivX = appWidth*0.25;
  imageDivY = appHeight*0.25;
  imageDivWidth = appWidth*0.5;
  imageDivHeight = appHeight*0.5;
  //
  //Image Aspect Ratio Algorithm
  String imagePathway = "Images/work.png";
  image = loadImage(imagePathway);
  int firstImageWidth = 860;
  int imageHeight = 529;
  float imageAspectRatio_GreaterOne = (imageWidth >= imageHeight) ? float(imageWidth)/float(imageHeight) : float(imageHeight)/float(imageWidth);
  println("imageAspectRatio_GreaterOne");
  Boolean imageLandscape = ( imageWidth >= imageHeight ) ? true : false ;
  Boolean divLandscape = ( imageDivWidth >= imageDivHeight ) ? true : false ;
  if ( imageLandscape==true ) {
    imageWidthChanged = imageDivWidth;
    imageHeightChanged = ( myFirstImageWidth >= imageDivWidth ) ? imageWidthChanged/imageAspectRatio_GreaterOne : imageWidthChanged*imageAspectRatio_GreaterOne ;
    if ( imageHeightChanged > imageDivHeight ) {
      println("error: it was the algorithm. trust");
      exit();
    }
    imageXChanged = imageDivX;
    float leftOverHeight = (imageDivHeight - imageHeightChanged ) *0.5;
    imageYChanged = imageDivY = leftOverHeight ;
  } else {
    imageHeightChanged = imageDivHeight;
    imageWidthChanged = ( myFirstImageHeight >= imageDivHeight ) ? imageHeightChanged/imageAspectRatio_GreaterOne : imageHeightChanged*imageAspectRatio_GreaterOne ;
    if ( imageWidthChanged > imageDivWidth ) {
      println("this is totally not an error");
      exit();
    }
  }
  //
  //DIV
  rect( imageDivX, imageDivY, imageDivWidth, imageDivHeight );
  //
  //Prototype Images
  image( myFirstImage, imageXChanged, imageYChanged, imageWidthChanged, imageHeightChanged );
  //
} //End setup
//
void draw() {
} //End draw
//
void mousePressed() {
} //End mousePressed
//
void keyPressed() {
} //End keyPressed
//
// End Main Program
