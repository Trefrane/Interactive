
/*

 Custom 3D Geometry by Amnon Owed (May 2013)
 https://github.com/AmnonOwed
 http://vimeo.com/amnon
 
 Creating custom 3D shapes (pyramids) using vertices, beginShape & endShape.
 For more information about Shapes see: http://processing.org/reference/beginShape_.html
 This example also displays OpenGL's automatic color interpolation between vertices.

 LEFT MOUSE BUTTON = toggle between black/white background
 RIGHT MOUSE BUTTON = toggle the use of lights()
 
 Built with Processing 2.0b8 / 2.0b9 / 2.0 Final
 
*/
import ddf.minim.*;

int NUMSHAPES = 120; // the number of flying pyramids
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
 play1 = minim.loadSample( "060.mp3");
  play2 = minim.loadSample( "062.mp3");
  play3 = minim.loadSample( "070.mp3");
  play4 = minim.loadSample( "075.mp3");
  play5 = minim.loadSample( "078.mp3");
  play6 = minim.loadSample( "035.mp3");
  play7 = minim.loadSample( "040.mp3");
  play8 = minim.loadSample( "045.mp3");
  play9 = minim.loadSample( "050.mp3");
  play10 = minim.loadSample( "051.mp3");
  play11 = minim.loadSample( "010.mp3");
  play12 = minim.loadSample( "015.mp3");
  play13 = minim.loadSample( "020.mp3");
  play14 = minim.loadSample( "022.mp3");
  play15 = minim.loadSample( "021.mp3");
  play16 = minim.loadSample( "010.mp3");
  play17 = minim.loadSample( "08.mp3");
  play18 = minim.loadSample( "06.mp3");
  play19 = minim.loadSample( "04.mp3");
  play20 = minim.loadSample( "02.mp3");
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


 if(fpp.x > 0 && fpp.x < displayWidth/5 && fpp.y > 0 && fpp.y < displayHeight/2 ){
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


}
}
