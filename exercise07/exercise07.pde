import processing.sound.*;

//Started  exercise 07

int rectWidth;
SoundFile tone;

   
void setup() {
  size(640, 360);
  noStroke();
  background(0);
  rectWidth = width/4;
  tone = new SoundFile(this, "sounds/tone01.wav");
  
}

void draw() { 
  // keep draw() here to continue looping while waiting for keys
  textSize(15);
  fill(255);
  text("Press any key :) ", width/2, 3*height/4);
}

void keyPressed() {
  int keyIndex = -1;
  if (key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  }
  if (keyIndex == -1) {
    // If it's not a letter key, clear the screen
    background(0);
  } else { 
    // It's a letter key, fill a rectangle
    fill(millis() % 255);
    float x = map(keyIndex, 0, 25, 0, width - rectWidth);
    rect(x, 0, rectWidth, height);
  }
    if((key >= 'A' && key <='Z') || (key >= 'a' && key <= 'z') ){
    println("you working?");
    tone.play();
  }
 
}