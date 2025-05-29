//Text: from Static to Procedural
//
//Global Variables
int shorterSide;
float titleX, titleY;
float footerX, footerY;
float[] rectDIVWidth;
float[] rectDIVHeight;
//
void setup() {
  //Display
  //fullScreen();
  size(700, 500);
  int appWidth = width;
  int appHeight = height;
  shorterSide = ( appWidth >= appHeight ) ? appHeight : appWidth ;
  //
  textSetup1();
  //
  //DIV for Text / Population
  titleX = appWidth*0.7;
  titleY = appHeight*0.2;
  rectDIVWidth[0] = appWidth*0.5;
  rectDIVHeight[0] = appHeight*0.15;
  footerX = appWidth*0.1;
  footerY = appHeight*0.5;
  rectDIVWidth[1] = appWidth*0.5;
  rectDIVHeight[1] = appHeight*0.1;
  rect(titleX, titleY, rectDIVWidth[0], rectDIVHeight[0]);
  rect(footerX, footerY, rectDIVWidth[1], rectDIVHeight[1]);
  //
  textSetup2();
  //
  //println(); //Skip a line
  //
  //Minimum lines of code for cool colours
  color viridian = #43BF7A;
  fill(viridian);
  textAlign (CENTER, CENTER);
  //
  textFont(appFont, fontSize);
  //Drawing Text
  text(string[0], titleX, titleY, rectDIVWidth[0], rectDIVHeight[0]);
  text(string[1], footerX, footerY, rectDIVWidth[1], rectDIVHeight[1]);
  color whiteInk = #FFFFFF;
  fill(whiteInk); //Reset
  //
  println( "Text Width:", textWidth(string[0]), "rectWidth:", rectDIVWidth[0] );
  println( "Text Height:", fontSize, "rectHeight:", rectDIVHeight[0] );
  println( "Times New Roman Aspect Ratio ( fontSize/rect(height) ):", fontSize/rectDIVHeight[0] );
  //
} //End setup
//
void draw() {
} //End draw
//
void mousePressed() {
} //End mousepressed
//
void keyPressed() {
} //End keyPressed
//
//End MAIN
