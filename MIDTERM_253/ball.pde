// Ball
////RED BALL IS PLAYER ONE
//BLUE BALL IS PLAYER TWO
// A class that defines a ball that can move around in the window, bouncing
// of the top and bottom, and can detect collision with a paddle and bounce off that.

class Ball {

  /////////////// Properties ///////////////

  // Default values for speed and size
  int SPEED = 10; //CHANGED THE SPPED OF THE BALLS
  int SIZE = 35;

  // The starting location of the ball
  int startLocationX;
  int startLocationY;

  // The location of the ball
  int x;
  int y;

  // The velocity of the ball
  int vx; 
  int vy;  


  // The colour of the ball
  color ballColor = color(255,0,0); //RED
  //color ballcolor2 = color(0,0,255); //BLUE
  int ballId; //ADDED THE ID TO LINK BALL TO PADDLE

  /////////////// Constructor ///////////////

  // Ball(int _x, int _y)
  //
  // The constructor sets the variable to their starting values
  // x and y are set to the arguments passed through (from the main program)
  // and the velocity starts at SPEED for both x and y 
  // (so the ball starts by moving down and to the right)
  // NOTE that I'm using an underscore in front of the arguments to distinguish
  // them from the class's properties

 Ball(int _x, int _y, int id, color ballC) {
    startLocationX = _x;
    startLocationY = _y;
    x = startLocationX;
    y = startLocationY;
    vx = SPEED;
    vy = SPEED;
    ballColor = ballC; //ADDED
    ballId = id; //ADDED
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
    if (y - SIZE*3 < 0 || y + SIZE*3 > height) {           //CHANGED /2 T *3
      // If it is, then make it "bounce" by reversing its velocity
      vy = -vy;
    }
  }

  // reset()
  //
  // Resets the ball to the centre of the screen.
  // Note that it KEEPS its velocity

  void reset() {
    //x = startLocationX;
     x = (int)random(width);
    println(x);
    //y = startLocationY;
     y = (int)random(width);
     //println(y);
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
      paddleScore(paddle);
    }
  }

  // display()
  //
  // Draw the ball at its position

  void display() {
    // Set up the appearance of the ball (no stroke, a fill, and rectMode as CENTER)
    noStroke();
    fill(ballColor);
    ellipseMode(CENTER);

    // Draw the ball
    ellipse(x, y, SIZE, SIZE);
    ellipse(x, y, SIZE, SIZE); //BALL 2
  }

//ADDED THIS FUNCTION FOR THE SCORE
  void paddleScore(Paddle p)
  {
    if(ballId == p.playerId)
      {
        p.score = p.score+1;
      }
      else
      {
         p.score = p.score-1;
      }
      //println(p.playerId+"  score:: "+p.score);
  }

}

 