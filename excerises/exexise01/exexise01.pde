final int CIRCLE_SPEED = 7;
final color NO_CLICK_FILL_COLOR = color(250, 100, 100);
final color CLICK_FILL_COLOR = color(100, 100, 250);
final color BACKGROUND_COLOR = color(250, 150, 150);
final color STROKE_COLOR = color(250, 150, 150);
final int CIRCLE_SIZE = 50;

int circleX;
int circleY;
int circleVX;
int circleVY;

void setup() {
  size(640, 480); //size of the screen
  circleX = width/2; //width of the circle 
  circleY = height/2; //how tall is the circle
  circleVX = CIRCLE_SPEED; //how fast the circle X will go 
  circleVY = CIRCLE_SPEED; //how fast the circle Y will go 
  stroke(STROKE_COLOR);
  fill(NO_CLICK_FILL_COLOR);
  background(BACKGROUND_COLOR);
}

void draw() {
    //if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2)
      fill(CLICK_FILL_COLOR);
  }
  else {
    fill(NO_CLICK_FILL_COLOR);
  }
  
  // if you dont have this than theres no point, it would just be a pink screen 
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);
  circleX += circleVX;
  circleY += circleVY;
  
  //if you do not have this piece of code the circle will bounce off the bottom right hit the right side and just keep going and you wont ever see it again.  
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {
    circleVX = -circleVX;
  }
  
  
  //if you take this piece of code out the circle will not bounce off the right side of the screen 
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {
    circleVY = -circleVY;
  }
}

void mousePressed() {
  background(BACKGROUND_COLOR);
}