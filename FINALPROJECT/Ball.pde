/// Ball
//
// A class that defines a ball that can move around in the window, bouncing
// of the top and bottom, and can detect collision with a paddle and bounce off that.

class Ball {

  /////////////// Properties ///////////////

  // Default values for speed and size
  int SPEED = 5;
  int SIZE = 16;
  Ball ball;
  Ball[] Balls= new Ball[9]; // added this for the array

  String shape = "rect";

  // The location of the ball
  int x;
  int y;


  // The velocity of the ball
  //int vx;
  //int vy;

  // The colour of the ball
  color ballColor = color(255);
  int pongId;
  int ballId;

  //for the other ones 
  float vx = random(10);
  float vy = random(30);


  /////////////// Constructor ///////////////

  // Ball(int _x, int _y)
  //
  // The constructor sets the variable to their starting values
  // x and y are set to the arguments passed through (from the main program)
  // and the velocity starts at SPEED for both x and y 
  // (so the ball starts by moving down and to the right)
  // NOTE that I'm using an underscore in front of the arguments to distinguish
  // them from the class's properties

  //BALL FOR BASIC AND BLUE PONG
  Ball(int _x, int _y, int _pongId, int _ballId) {
    x = _x;
    y = _y;
    vx = SPEED;
    vy = SPEED;
    pongId = _pongId;
    ballId = _ballId;
  }

  //BALL FOR 10 PONG
  Ball(int _x, int _y, int _vx, int _vy, int _pongId, int _ballId) {
    pongId = _pongId;
    SPEED = _vx;
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    ballId =_ballId;
    if (pongId ==3)
    {
      if (ballId ==0)
      {
        ballColor = color(255, 0, 0);
      } else
      {
        ballColor = color(0);
      }
    }
  }

  /////////////// Methods ///////////////

  // update()
  //
  // This is called by the main program once per frame. It makes the ball move
  // and also checks whether it should bounce of the top or bottom of the screen
  // and whether the ball has gone off the screen on either side.

  void update() {
    // First update the location based on the velocity (so the ball moves)
    x += vx;
    y += vy;

    // Check if the ball is going off the top of bottom
    if (y - SIZE/2 < 0 || y + SIZE/2 > height) {
      // If it is, then make it "bounce" by reversing its velocity
      vy = -vy;
    }
  }

  // reset()
  //
  // Resets the ball to the centre of the screen.
  // Note that it KEEPS its velocity

  void reset() {
    x = width/2;
    y = height/2;
  }

  // isOffScreen()
  //
  // Returns true if the ball is off the left or right side of the window
  // otherwise false
  // (If we wanted to return WHICH side it had gone off, we'd have to return
  // something like an int (e.g. 0 = not off, 1 = off left, 2 = off right)
  // or a String (e.g. "ON SCREEN", "OFF LEFT", "OFF RIGHT")

  boolean isOffScreen() {
    return (x + SIZE/2 < 0 || x - SIZE/2 > width);
  }

  // collide(Paddle paddle)
  //
  // Checks whether this ball is colliding with the paddle passed as an argument
  // If it is, it makes the ball bounce away from the paddle by reversing its
  // x velocity

  void collide(Paddle paddle) {
    // Calculate possible overlaps with the paddle side by side
    boolean insideLeft = (x + SIZE/2 > paddle.x - paddle.WIDTH/2);
    boolean insideRight = (x - SIZE/2 < paddle.x + paddle.WIDTH/2);
    boolean insideTop = (y + SIZE/2 > paddle.y - paddle.HEIGHT/2);
    boolean insideBottom = (y - SIZE/2 < paddle.y + paddle.HEIGHT/2);

    // Check if the ball overlaps with the paddle
    if (insideLeft && insideRight && insideTop && insideBottom) {
      // If it was moving to the left
      if (vx < 0) {
        // Reset its position to align with the right side of the paddle
        x = paddle.x + paddle.WIDTH/2 + SIZE/2;
      } else if (vx > 0) {
        // Reset its position to align with the left side of the paddle
        x = paddle.x - paddle.WIDTH/2 - SIZE/2;
      }
      // And make it bounce
      vx = -vx;



      if (ballId ==0)
      {
        println("red ball hit");
        paddle.score++; // for the 10 ball pong
      }
    }

    // if the ball id is 0 then we change the score othrwise do nothing
  }

  // display()
  //
  // Draw the ball at its position

  void display() {
    // Set up the appearance of the ball (no stroke, a fill, and rectMode as CENTER)
    //THE BASIC AND BLUE PONG 
    noStroke();
    fill(ballColor);
    rectMode(CENTER);

    // THIS IS FOR TEH RAdo
    if (shape.equals("rect")) {
      rect(x, y, SIZE, SIZE);
      //fill(255);
    } else if (shape.equals("ellipse")) {
      ellipse(x, y, SIZE, SIZE);
    } else if (shape.equals("triangle")) {
      triangle(x, y-SIZE, x+SIZE/2, y, x-SIZE/2, y);
    } else if (shape.equals("star")) {
      star(0, 0, 30, 70, 5);
    }
//DARW THE SHAPES FOR THE RANDOM PONG  
}

  void star(float x, float y, float radius1, float radius2, int npoints) {
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      vertex(sx, sy);
      sx = x + cos(a+halfAngle) * radius1;
      sy = y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }

  //THE 10 PONG BALL 
  void displayTenPong() {
    // Set up the appearance of the ball (no stroke, a fill, and rectMode as CENTER)
    noStroke();
    fill(ballColor);
    rectMode(CENTER);
    ellipse(x, y, SIZE, SIZE);
  }

  //rotating ball
  void displayRotatingPong() {
    // Set up the appearance of the ball (no stroke, a fill, and rectMode as CENTER)
    noStroke();
    fill(ballColor);
    rectMode(CENTER);
    ellipse(x, y, SIZE, SIZE);
  }
}