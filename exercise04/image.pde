class Hab {
 //MY NEW CLASS
  // properties
  int x;
  int y;
  int vx;
  int vy;
  PImage img;


  // constructor
  Hab(int newX, int newY, int newVX, int newVY) {
    x = newX;
    y = newY;
    vx = newVX;
    vy = newVY;
    img = loadImage("Montreal.png");
  }

  //where i can get the image to bounce off the edge of the screen
  void move() {
    x += vx;
    y += vy;

    //< less than || OR, > greater than
    if (x - img.width/2 < 0 || x + img.width/2 > width) {
      vx = -vx;
    }

    //< less than || OR and > greater than
    if (y - img.height/2 < 0 || y + img.height/2 > height) {
      vy = -vy;
    }
  }


  void draw() {
    imageMode(CENTER);
    image(img, x, y);
  }
}