//this is everything about the Bouncer.

class Bouncer {

  int x;
  int y;
  float vx; // CHNAGED 
  float vy; // CHNAGED 
  int size;
  color fillColor;
  color defaultColor;
  color hoverColor;
  float red ; //ADDED
  float green; //ADDED
  float blue; //ADDED


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

      red = random(50, 100); // CHANGED MADE THE COLOR OF THE BALL TO RANDOM WHEN IT HIT THE WALL 
      green = random(25, 200);
      blue = random(30, 100);
      defaultColor = color(red, green, blue);
    }

    //< less than || OR and > greater than
    if (y - size/2 < 0 || y + size/2 > height) {
      vy = -vy;

  
    }  

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

 //CHANGED / ADDED THIS 
  void mouseClicked() {
    if (dist(mouseX, mouseY, x, y) < size) {
      println("Click!");
      vx = vx * 5; //MADE THE SPEED 5 TIME FAST EACH TIME YOU CLICK THE BALL. THE SPEED WILL GO UP BY 5 EACH TIME  
      vy = vy * 5;
    }
  }




  //the shape and the color of the balls
  void draw() {
    noStroke();
    fill(fillColor);
    ellipse(x, y, size, size);
  }
}