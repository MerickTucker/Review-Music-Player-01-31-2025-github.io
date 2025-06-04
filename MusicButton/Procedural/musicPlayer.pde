//Global Variables
Boolean musicButton=false;
//
Minim minim;
int numberOfSongs = 1;
//int numberOfSoundEffects = ???
AudioPlayer[] playList = new AudioPlayer[ numberOfSongs ];
//AudioPlayer[] soundEffects = new AudioPlayer[ numberOfSoundEffects ];
int currentSong = numberOfSongs - numberOfSongs; //ZERO
//
float musicButtonX, musicButtonY, musicButtonWidth, musicButtonHeight;
float musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight;
//
color nightMode=#228822, dayMode=#B4DD13;
color resetDefaultColor=#B4DD13;
//
void musicPlayerSetup() {
  //Population
  musicButtonWidth = shorterSide*1/20;
  musicButtonX = appWidth - musicButtonWidth;
  musicButtonY = appHeight*0;
  musicButtonHeight = shorterSide*1/20;
  musicMenuX = appWidth*1/4;
  musicMenuY = appHeight*1/4;
  musicMenuWidth = appWidth*1/2;
  musicMenuHeight = appHeight*1/2;
  //
  //DIVs
  //rect(X, Y, Width, Height);
  //rect(musicButtonX, musicButtonY, musicButtonWidth, musicButtonHeight);
  //rect(musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight);
  //
}//End setup
//
void musicPlayerDraw() {
  println("YESSIR");
  //background();
  musicPlayerGUI( musicMenuX, musicMenuY, musicMenuWidth, musicMenuHeight );
}//End draw
//
void musicPlayerMousePressed() {
  if ( mouseX>musicButtonX && mouseX<musicButtonX+musicButtonWidth && mouseY>musicButtonY && mouseY<musicButtonY+musicButtonHeight ) {
    musicButtonSwitch();
  }
}//End mousePressed
//
void musicPlayerKeyPressed() {
  //Music Button Activation
  if ( key=='A' || key=='a' ) {
    musicButtonSwitch();
  }//Music Button Activation
  //
  if ( key=='B' || key=='b' ) playList[currentSong].loop(); //Simple Play, double tap possible
  //
  if ( key=='C' | key=='c' ) {
    if ( playList[currentSong].isPlaying() ) {
      playList[currentSong].pause(); //single tap
    } else {
      playList[currentSong].rewind(); //double tap
    }
  }
  if ( key=='D' || key=='d' ) playList[currentSong].loop(1);
  if ( key=='E' || key=='e' ) playList[currentSong].loop();
  if ( key=='F' || key=='f' ) playList[currentSong].skip( 10000 );
  if ( key=='G' || key=='g' ) playList[currentSong].skip( -10000 );
  if ( key=='H' || key=='h' ) {
    if ( playList[currentSong].isMuted() ) {
      playList[currentSong].unmute();
    } else {
      playList[currentSong].mute();
    }
  }
  if ( key=='I' || key=='i' ) {
    if ( playList[currentSong].isPlaying() ) {
      playList[currentSong].pause();
    } else {
      playList[currentSong].play();
    }
  }
  if ( key==CODED || keyCode==ESC ) exit(); //QUIT //UP
  //
  if ( key=='J' || key=='j' ) { //NEXT
    if ( playList[currentSong].isPlaying() ) {
      playList[currentSong].pause();
      playList[currentSong].rewind();
      if ( currentSong==numberOfSongs-1 ) {
        currentSong = 0;
      } else {
        currentSong++;
      }
      playList[currentSong].play();
    } else {
      //
      playList[currentSong].rewind();
      //
      if ( currentSong==numberOfSongs-1 ) {
        currentSong = 0;
      } else {
        currentSong++;
      }
    }
  }
}//End keyPressed
//
void musicPlayerGUI( float X, float Y, float Width, float Height ) {
  fill(nightMode);
  rect( X, Y, Width, Height );
  fill(resetDefaultColor);
}//End Music Player GUI
//
void musicButtonSwitch() {
  if ( musicButton==true ) {
      musicButton=false;
    } else {
      musicButton=true;
    }
}//End Music Button Switch
//
//End Subprogram Music Player
