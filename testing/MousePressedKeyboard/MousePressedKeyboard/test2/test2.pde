/**
  * This sketch demonstrates how to play a file with Minim using an AudioPlayer. <br />
  * It's also a good example of how to draw the waveform of the audio. Full documentation 
  * for AudioPlayer can be found at http://code.compartmental.net/minim/audioplayer_class_audioplayer.html
  * <p>
  * For more information about Minim and additional features, 
  * visit http://code.compartmental.net/minim/
  */

import ddf.minim.*;




Minim minim;
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

AudioPlayer ambient;


void setup()
{
size(displayWidth, displayHeight, P3D);

  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);
  
  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
  play1 = minim.loadSample("1.mp3");
  play2 = minim.loadSample("2.mp3");
  play3 = minim.loadSample("3.mp3");
  play4 = minim.loadSample("4.mp3");
  play5 = minim.loadSample("5.mp3");
  play6 = minim.loadSample("6.mp3");
  play7 = minim.loadSample("7.mp3");
  play8 = minim.loadSample("8.mp3");
  play9 = minim.loadSample("9.mp3");
  play10 = minim.loadSample("10.mp3");
  

  
ambient = minim.loadFile("BGM7.mp3");
ambient.loop();

}

void draw()
{
 background(255);
    fill(255,150,0);
 rect(0,0,512,350);
 
    fill(0,150,255);
 rect(512,0,512,350);
 
    fill(255,150,0);
 rect(1024,0,512,350);
 
    fill(0,150,255);
 rect(1536,0,512,350);
 
    fill(255,150,0);
 rect(2048,0,512,350);
 
    fill(0,150,255);
 rect(0,350,512,350);
 
    fill(255,150,0);
 rect(512,350,512,350);
 
    fill(0,150,255);
 rect(1024,350,512,350);
 
    fill(255,150,0);
 rect(1536,350,512,350);
 
    fill(0,150,255);
 rect(2048,350,512,350);
 
    fill(255,150,0);
 rect(0,700,512,350);
 
    fill(0,150,255);
 rect(512,700,512,350);
 
    fill(255,150,0);
 rect(1024,700,512,350);
 
    fill(0,150,255);
 rect(1536,700,512,350);
 
    fill(255,150,0);
 rect(2048,700,512,350);
 
    fill(0,150,255);
 rect(1536,700,512,350);
 
    fill(255,150,0);
 rect(0,1050,512,350);
 
    fill(0,150,255);
 rect(512,1050,512,350);
 
    fill(255,150,0);
 rect(1024,1050,512,350);
 
    fill(0,150,255);
 rect(1536,1050,512,350);
 
    fill(255,150,0);
 rect(2048,1050,512,350);
 

}


void mousePressed(){
  if(mouseX > 0 && mouseX < displayWidth/5 && mouseY > 0 && mouseY < displayHeight/4) {
  play1.trigger();
}
 if(mouseX > displayWidth/5 && mouseX < displayWidth/5*2 && mouseY > 0 && mouseY < displayHeight/4 ){
  play2.trigger();
}
 if(mouseX > displayWidth/5*2 && mouseX < displayWidth/5*3 && mouseY > 0 && mouseY < displayHeight/4 ){
  play3.trigger();
}
 if(mouseX > displayWidth/5*3 && mouseX < displayWidth/5*4 && mouseY > 0 && mouseY < displayHeight/4 ){
  play4.trigger();
}
 if(mouseX > displayWidth/5*4 && mouseX < displayWidth && mouseY > 0 && mouseY < displayHeight/4 ){
  play5.trigger();
}
 if(mouseX > 0 && mouseX < displayWidth/5 && mouseY >displayHeight/4 && mouseY < displayHeight/2 ){
  play6.trigger();
}
 if(mouseX > displayWidth/5 && mouseX < displayWidth/5*2 && mouseY >displayHeight/4 && mouseY < displayHeight/2 ){
  play7.trigger();
}
 if(mouseX > displayWidth/5*2 && mouseX < displayWidth/5*3 && mouseY > displayHeight/4 && mouseY < displayHeight/2 ){
  play8.trigger();
}
 if(mouseX > displayWidth/5*3 && mouseX < displayWidth/5*4 && mouseY > displayHeight/4 && mouseY < displayHeight/2 ){
  play9.trigger();
}
 if(mouseX > displayWidth/5*4 && mouseX < displayWidth && mouseY > displayHeight/4 && mouseY < displayHeight/2 ){
  play10.trigger();
}
}
