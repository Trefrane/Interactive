import ddf.minim.*;
 
ArrayList<Particle> pts;
boolean onPressed, cleanUp;
PFont f;

import de.voidplus.leapmotion.*; 
LeapMotion leap; 
ArrayList<PVector> points; 
PVector fpp; 
PVector fp;

//SinOsc sine;
//float freq=400;
//float amp=0.5;
//float pos;

Minim minim;
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


  void setup() {
  fullScreen();
// size(displayWidth, displayHeight, P3D);
// size(1280, 700, P3D);
  smooth();
  colorMode(HSB);
  rectMode(CENTER);
  leap = new LeapMotion(this);

  pts = new ArrayList<Particle>();
 
  cleanUp = true;
 
  background(255);

    minim = new Minim(this);
    
 //   BGM = minim.loadFile("marcus_kellis_theme.mp3");
//BGM.loop();
  play1 = minim.loadSample( "1.aif");
  play2 = minim.loadSample( "2.aif");
  play3 = minim.loadSample( "3.aif");
  play4 = minim.loadSample( "4.aif");
  play5 = minim.loadSample( "5.aif");
  play6 = minim.loadSample( "6.aif");
  play7 = minim.loadSample( "7.aif");
  play8 = minim.loadSample( "8.aif");
  play9 = minim.loadSample( "9.aif");
  play10 = minim.loadSample( "10.aif");




}
 
void draw() {
  background(255);
  int fps = leap.getFrameRate();
  frameRate(fps);
  for (Hand hand : leap.getHands()) {
        fpp = hand.getPosition(); 
  for (Finger finger : hand.getFingers()) {
  fp = finger.getPosition(); 


   fill(0);
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
  // Map mouseY from 0.0 to 1.0 for amplitude
// amp=map(fpp.y, 0, height, 1.0, 0.0);
 // BGM.amp(amp);
 

 
  // Map mouseX from -1.0 to 1.0 for left to right zuoyouhuibianhua!!
 // pos=map(fp.y, 0, width, -1.0, 1.0);
  //BGM.pan(pos);
  
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
 if(fpp.x > 0 && fpp.x < displayWidth/5 && fpp.y > 4 && fpp.y < displayHeight/2 ){
  play6.trigger();
}
 if(fpp.x > displayWidth/5 && fpp.x < displayWidth/5*2 && fpp.y > 4 && fpp.y < displayHeight/2 ){
  play7.trigger();
}
 if(fpp.x > displayWidth/5*2 && fpp.x < displayWidth/5*3 && fpp.y > 4 && fpp.y < displayHeight/2 ){
  play8.trigger();
}
 if(fpp.x > displayWidth/5*3 && fpp.x < displayWidth/5*4 && fpp.y > 4 && fpp.y < displayHeight/2 ){
  play9.trigger();
}
 if(fpp.x > displayWidth/5*4 && fpp.x < displayWidth && fpp.y > 4 && fpp.y < displayHeight/2 ){
  play10.trigger();
}


}
}
