//this is everything about the Bouncer.

class Bouncer {

  int x;
  int y;
  int vx;
  int vy;
  int size;
  color fillColor;
  color defaultColor;
  color hoverColor;
  float red ;
  float green;
  float blue;


  //all the info about the bouncer
  Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) {
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    size = tempSize;
    defaultColor = tempDefaultColor;
    hoverColor = tempHoverColor;
    fillColor = defaultColor;
    //fillcolor (red,green,blue);
  }

  void update() {
    x += vx;
    y += vy;

    handleBounce();
    handleMouse();
  }

  //i think this is where the balls bounces of the sides of the screen 
  void handleBounce() { 

    //< less than || OR, > greater than
    if (x - size/2 < 0 || x + size/2 > width) {
      vx = -vx;
    }

    //< less than || OR and > greater than
    if (y - size/2 < 0 || y + size/2 > height) {
      vy = -vy;

      // && is AND
    } else if (x - size/2 < 0 || x + size/2 > width && y - size/2 < 0 || y + size/2 > height)

    red = random(50, 100); // CHANGED MADE THE COLOR OF THE BALL TO RANDOM WHEN IT HIT THE WALL 
    green = random(25, 200);
    blue = random(300, 100);
    fillColor = color(red, green, blue);

    x = constrain(x, size/2, width-size/2);
    y = constrain(y, size/2, height-size/2);
  }

  void handleMouse() {
    if (dist(mouseX, mouseY, x, y) < size/2) {
      fillColor = hoverColor;
    } else {
      fillColor = defaultColor;
    }
  }




  //the shape and the color of the balls
  void draw() {
    noStroke();
    fill(fillColor);
    ellipse(x, y, size, size);
  }
}