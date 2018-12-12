//In minim we use AudioPlayer ,AudioRecorder and AudioInput. 
//AudioPlayer is Mono and Stereo playback of WAV, AIFF,AU,SND AND MP3 files.(Briefly, if we want to input music, we should use it in our code.)
//AudioRecorder used to record either Mono and Stereo audio.
//AudioInput is Mono and Stereo input monitoring.
//Combining AudioRecorder and AudioInput, we can record the music we make.

//Leap motion is a computer hardware sensor device that supports hand and finger motions as input, analogous to a mouse, but require no hand contact or touching.
import ddf.minim.*;

int NUMSHAPES = 200; // the number of flying pyramids
float MAXSPEED = 30; // the maximum speed at which a pyramid may move

ArrayList <Pyramid> shapes = new ArrayList <Pyramid> ();
ArrayList<Particle> pts;// arrayList to store all the shapes
PFont f;

boolean bLights, bWhitebackground; // booleans for toggling lights and background

import de.voidplus.leapmotion.*; 
LeapMotion leap; 
ArrayList<PVector> points; 
PVector fpp; 
PVector fp;

Minim minim;

AudioInput in;
AudioRecorder recorder;
AudioPlayer BGM;
AudioSample play1;
AudioSample play2;
AudioSample play3;
AudioSample play4;
AudioSample play5;
AudioSample play6;
AudioSample play7;
AudioSample play8;
AudioSample play9;
AudioSample play10;
AudioSample play11;
AudioSample play12;
AudioSample play13;
AudioSample play14;
AudioSample play15;
AudioSample play16;
AudioSample play17;
AudioSample play18;
AudioSample play19;
AudioSample play20;
//AudioOutput  out;


AudioPlayer ambient;

void setup() {
  size(2560, 1440, P3D); // use the P3D OpenGL renderer
  noStroke(); // turn off stroke (for the rest of the sketch)
  smooth(6); // set smooth level 6 (default is 2)
  // create all the shapes with a certain radius and height
  for (int i=0; i<NUMSHAPES; i++) {
    float r = random(25, 200);
    float f = random(2, 5);
    shapes.add( new Pyramid(f*r, r) );
  }
  leap = new LeapMotion(this);

  pts = new ArrayList<Particle>();

  minim = new Minim(this);
  
  
  play1 = minim.loadSample( "32.mp3"); 
  play2 = minim.loadSample( "7.mp3");
  play3 = minim.loadSample( "8.mp3");
  play4 = minim.loadSample( "9.mp3");
  play5 = minim.loadSample( "10.mp3");
  play6 = minim.loadSample( "1.mp3");
  play7 = minim.loadSample( "2.mp3");
  play8 = minim.loadSample( "3.mp3");
  play9 = minim.loadSample( "4.mp3");
  play10 = minim.loadSample( "5.mp3");
  play11 = minim.loadSample( "10.mp3");
  play12 = minim.loadSample( "9.mp3");
  play13 = minim.loadSample( "8.mp3");
  play14 = minim.loadSample( "7.mp3");
  play15 = minim.loadSample( "6.mp3");
  play16 = minim.loadSample( "31.mp3"); 
  play17 = minim.loadSample( "12.mp3");
  play18 = minim.loadSample( "13.mp3");
  play19 = minim.loadSample( "14.mp3");
  play20 = minim.loadSample( "16.mp3");
  
  ambient = minim.loadFile("BGM9.mp3");
ambient.loop();

  in = minim.getLineIn();
  // create a recorder that will record from the input to the filename specified
  // the file will be located in the sketch's root folder.
  recorder = minim.createRecorder(in, "myselfmusic.wav");
 
}



void draw() {
  background(0); 
  colorMode(HSB);
  rectMode(CENTER);
  if (bLights) { lights(); } // if true, use lights()
  perspective(PI/3.0, (float) width/height, 1, 1000000); // perspective to see close shapes
  // update and display all the shapes
  for (Pyramid p : shapes) {
    p.update();
    p.display();
  }
  
  int fps = leap.getFrameRate();
  frameRate(fps);
  for (Hand hand : leap.getHands()) {
        fpp = hand.getPosition(); 
  for (Finger finger : hand.getFingers()) {
  fp = finger.getPosition(); 


   fill(255);
   Particle newP = new Particle(fp.x, fp.y, constrain(fp.z, 10, 20), constrain(fp.z, 10, 20));
   pts.add(newP);

  }
 
  for (int i=0; i<pts.size(); i++) {
    Particle p = pts.get(i);
    p.update();
    p.display();
  }
 
  for (int i=pts.size()-1; i>-1; i--) {
    Particle p = pts.get(i);
    if (p.dead) {
      pts.remove(i);
    }
  } 
  
 if(fpp.x > 0 && fpp.x < displayWidth/5 && fpp.y > 0 && fpp.y < displayHeight/4 ){
  play1.trigger();
 }
 if(fpp.x > displayWidth/5 && fpp.x < displayWidth/5*2 && fpp.y > 0 && fpp.y < displayHeight/4 ){
  play2.trigger();
}
 if(fpp.x > displayWidth/5*2 && fpp.x < displayWidth/5*3 && fpp.y > 0 && fpp.y < displayHeight/4 ){
  play3.trigger();
}
 if(fpp.x > displayWidth/5*3 && fpp.x < displayWidth/5*4 && fpp.y > 0 && fpp.y < displayHeight/4 ){
  play4.trigger();
}
 if(fpp.x > displayWidth/5*4 && fpp.x < displayWidth && fpp.y > 0 && fpp.y < displayHeight/4 ){
  play5.trigger();
}
 if(fpp.x > 0 && fpp.x < displayWidth/5 && fpp.y > displayHeight/4 && fpp.y < displayHeight/2 ){
  play6.trigger();
}
 if(fpp.x > displayWidth/5 && fpp.x < displayWidth/5*2 && fpp.y > displayHeight/4 && fpp.y < displayHeight/2 ){
  play7.trigger();
}
 if(fpp.x > displayWidth/5*2 && fpp.x < displayWidth/5*3 && fpp.y > displayHeight/4 && fpp.y < displayHeight/2 ){
  play8.trigger();
}
 if(fpp.x > displayWidth/5*3 && fpp.x < displayWidth/5*4 && fpp.y > displayHeight/4 && fpp.y < displayHeight/2 ){
  play9.trigger();
}
 if(fpp.x > displayWidth/5*4 && fpp.x < displayWidth && fpp.y > displayHeight/4 && fpp.y < displayHeight/2 ){
  play10.trigger();
}


 if(fpp.x > 0 && fpp.x < displayWidth/5 && fpp.y > displayHeight/2 && fpp.y < displayHeight/4*3 ){
  play11.trigger();
 }
 if(fpp.x > displayWidth/5 && fpp.x < displayWidth/5*2 && fpp.y > displayHeight/2 && fpp.y < displayHeight/4*3 ){
  play12.trigger();
}
 if(fpp.x > displayWidth/5*2 && fpp.x < displayWidth/5*3 && fpp.y > displayHeight/2 && fpp.y < displayHeight/4*3 ){
  play13.trigger();
}
 if(fpp.x > displayWidth/5*3 && fpp.x < displayWidth/5*4 && fpp.y > displayHeight/2 && fpp.y < displayHeight/4*3 ){
  play14.trigger();
}
 if(fpp.x > displayWidth/5*4 && fpp.x < displayWidth && fpp.y > displayHeight/2 && fpp.y < displayHeight/4*3 ){
  play15.trigger();
}
 if(fpp.x > 0 && fpp.x < displayWidth/5 && fpp.y > displayHeight/4*3 && fpp.y < displayHeight ){
  play16.trigger();
}
 if(fpp.x > displayWidth/5 && fpp.x < displayWidth/5*2 && fpp.y > displayHeight/4*3 && fpp.y < displayHeight ){
  play17.trigger();
}
 if(fpp.x > displayWidth/5*2 && fpp.x < displayWidth/5*3 && fpp.y > displayHeight/4*3 && fpp.y < displayHeight ){
  play18.trigger();
}
 if(fpp.x > displayWidth/5*3 && fpp.x < displayWidth/5*4 && fpp.y > displayHeight/4*3 && fpp.y < displayHeight ){
  play19.trigger();
}
 if(fpp.x > displayWidth/5*4 && fpp.x < displayWidth && fpp.y > displayHeight/4*3 && fpp.y < displayHeight ){
  play20.trigger();
}
//We define 20 different pixel block. When the indicator of the hand move to the aera of the pixel block, the 20 different music will be play. 
}
}
void keyReleased()
{
  if ( key == 'r' ) 
  {
    // to indicate that you want to start or stop capturing audio data, you must call
    // beginRecord() and endRecord() on the AudioRecorder object. You can start and stop
    // as many times as you like, the audio data will be appended to the end of the buffer 
    // (in the case of buffered recording) or to the end of the file (in the case of streamed recording). 
    if ( recorder.isRecording() ) 
    {
      recorder.endRecord();
    }
    else 
    {
      recorder.beginRecord();
    }
  }
  if ( key == 's' )
  {
    // we've filled the file out buffer, 
    // now write it to the file we specified in createRecorder
    // in the case of buffered recording, if the buffer is large, 
    // this will appear to freeze the sketch for sometime
    // in the case of streamed recording, 
    // it will not freeze as the data is already in the file and all that is being done
    // is closing the file.
    // the method returns the recorded audio as an AudioRecording, 
    // see the example  AudioRecorder >> RecordAndPlayback for more about that
    recorder.save();
    println("Done saving.");
  }
}
