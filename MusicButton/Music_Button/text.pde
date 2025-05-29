//Global Variables
color viridian = #43BF7A;
PFont appFont;
float fontSize;
//
void textSetup1() {
  /* Fonts from OS
   println("Start of Console");
   String[] fontList = PFont.list(); //To list all fonts available on system
   printArray(fontList); //For listing all possible fonts to choose, then createFont
   */
  fontSize = shorterSide;
  appFont = createFont("Times New Roman", fontSize);
  //if you press "ok" you will explode
  stringVarsEntry();
  //
} //End Text Setup
//
void stringVarsEntry() {
  string[0] = "this is short text";
  string[1] = "this is some much longer text";
} //End stringVarsEntry
//
void textSetup2() {
  fontSize = shorterSide;
  for ( int i=0; i<rectDIVHeight.length; i++ ) {
    if ( fontSize > rectDIVHeight[i] ) fontSize = rectDIVHeight[i];
  }
  float timesNewRomanAspectRatio = 1;
  fontSize = fontSize * timesNewRomanAspectRatio;
  //println("Aspect Ratio:", timesNewRomanAspectRatio)
  //
  for ( int i=0; i<rectDIVHeight.length; i++ ) {
    if ( textWidth( string[i] ) > rectDIVWidth[i] ) {
      while ( textWidth( string[i] ) > rectDIVWidth[i]  ) {
  }

  //println("Aspect Ratio:", timesNewRomanAspectRatio);
  textFont(appFont, fontSize);
  float fontSize_temp=shorterSide;
  for ( int i=0; i<rectDIVWidth.length; i++ ) {
    if ( textWidth( string[i] ) > rectDIVWidth[i] ) {
      while ( textWidth( string[i] ) > rectDIVWidth[i] ) {
        fontSize_temp = fontSize*0.99;
        textFont(appFont, fontSize_temp);
      }
      fontSize = fontSize_temp;
    }
    textFont(appFont, fontSize);
  }
}

  } //End Text Setup
//
//End Text Subprogram
