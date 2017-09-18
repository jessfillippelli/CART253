final int RECT_SPEED = 10;
final color NO_CLICK_FILL_COLOR = color(250, 100, 100);
final color CLICK_FILL_COLOR = color(100, 100, 250);
final color BACKGROUND_COLOR = color(250, 150, 150);
final color STROKE_COLOR = color(250, 150, 150);
final int RECT_SIZE = 50;

int rectX;
int rectY;
int rectVX;
int rectVY;

void setup() {
  size(640, 480); //size of the screen
  rectX = width/5; //width of the circle and i CHANGED it from 2 to 5 
  rectY = height/5; //how tall is the circleand and i CHANGED it from 2 to 5 
  rectVX = RECT_SPEED; //how fast the circle X will go 
  rectVY = RECT_SPEED; //how fast the circle Y will go 
  stroke(STROKE_COLOR);
  fill(255,0,0);// CHANGED teh color to red 
  background(BACKGROUND_COLOR);
}

void draw() {
    if (dist(mouseX, mouseY, rectX, rectY) < RECT_SIZE/2) {
      //fill(255,0,0) ;
  }
  else {
   //fill(255,0,0);
  }

float red = random(100,300); // CHANGED MADE TEH COLUR RANDOM 
float green = random(100,300);
float blue = random(100,300);
fill(red,green,blue);
  
  // if you dont have this than theres no point, it would just be a pink screen 
  rect(rectX, rectY, RECT_SIZE, RECT_SIZE);
  rectX += rectVX;
  rectY += rectVY;

  //if you do not have this piece of code the circle will bounce off the bottom right hit the right side and just keep going and you wont ever see it again.  
  if (rectX + RECT_SIZE/2 > width || rectX - RECT_SIZE/2 < 0) {
    rectVX = -rectVX;
  }
  
  
  //if you take this piece of code out the circle will not bounce off the right side of the screen 
  if (rectY + RECT_SIZE/2 > height || rectY - RECT_SIZE/2 < 0) {
    rectVY = -rectVY;
  }



}

void mousePressed() {
  background(BACKGROUND_COLOR);
}