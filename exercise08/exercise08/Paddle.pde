// Paddle
//
// A class that defines a paddle that can be moved up and down on the screen
// using keys passed through to the constructor.

class Paddle {

  /////////////// Properties ///////////////

  // Default values for speed and size
  int SPEED = 5;
  int HEIGHT = 70;
  int WIDTH = 16;
  int horizontalPaddle;

  // The position and velocity of the paddle (note that vx isn't really used right now)
  int x;
  int y;
  int vx;
  int vy;


  // The fill color of the paddle
  color paddleColor = color(255);

  // The characters used to make the paddle move up and down, defined in constructor
  char upKey;
  char downKey;

  char leftKey;
  char rightKey;
  float theta;


  /////////////// Constructor ///////////////

  // Paddle(int _x, int _y, char _upKey, char _downKey)
  //
  // Sets the position and controls based on arguments,
  // starts the velocity at 0

  //BASIC AND BLUE PONG
  Paddle(int _x, int _y, char _upKey, char _downKey) { //Constructor
    x = _x;
    y = _y;
    vx = 0;
    vy = 0;

    upKey = _upKey;
    downKey = _downKey;
  }


  //10 PONG PADDLE 
  Paddle(int _x, int _y, char _leftKey, char _rightKey, int _w, int _h) { //Constructor
    x = _x;
    y = _y;
    vx = 0;
    vy = 0;
    HEIGHT = _h;
    WIDTH = _w;

    leftKey = _leftKey;
    rightKey = _rightKey;
  }
  
   //ROTATE PONG
  Paddle(int _x, int _y, char _leftKey, char _rightKey, int _w, int _h , char _upKey, char _downKey) { //Constructor
    x = _x;
    y = _y;
    vx = 0;
    vy = 0;
    HEIGHT = _h;
    WIDTH = _w;

    leftKey = _leftKey;
    rightKey = _rightKey;
    
    upKey = _upKey;
    downKey = _downKey;
  }

  /////////////// Methods ///////////////

  // update()
  //
  // Updates position based on velocity and constraints the paddle to the window

  void update() {
    // Update position with velocity (to move the paddle)
    x += vx;
    y += vy;

    // Constrain the paddle's y position to be in the window
    y = constrain(y, 0 + HEIGHT/2, height - HEIGHT/2);
  }

  void updatehorizontal() {
    // Update position with velocity (to move the paddle)
    x += vx;
    y += vy;

    // Constrain the paddle's y position to be in the window
    x = constrain(x, 0 + WIDTH/2, width - WIDTH/2);

    //FOR 10 PONG AND ROTATING PADDLE PONG
    x += vx;
    y += vy;
  }

  // display()
  //
  // Display the paddle at its location

  void display() {
    // Set display properties
    noStroke();
    fill(paddleColor);
    rectMode(CENTER);

    // Draw the paddle as a rectangle
    rect(x, y, WIDTH, HEIGHT);
  }

  void displayRotatingPong() {
    // Set display properties
    noStroke();
    pushMatrix();
    translate(x, y);
    rotate(theta);
    rectMode(CENTER);
    //rect(0,0,100,100);
    //rect(16,16,100,100);
    
    theta += 0.01;
    fill(paddleColor);
   // Draw the paddle as a rectangle
    rect(0, 0, WIDTH, HEIGHT);
    popMatrix();
  }

  void reset() {
    vx = 0;
    vy = 0;
    y = height/2;
  }

  // keyPressed()
  //
  // Called when keyPressed is called in the main program

  void keyPressed() {
    // Check if the key is our up key
    if (key == upKey) {
      // If so we want a negative y velocity
      vy = -SPEED;
    } // Otherwise check if the key is our down key 
    else if (key == downKey) {
      // If so we want a positive y velocity
      vy = SPEED;
    }

    //TEN PONG
    // Check if the key is our up key
    if (key == leftKey) {
      // If so we want a negative y velocity
      vx = -SPEED;
    } // Otherwise check if the key is our down key 
    else if (key == rightKey) {
      // If so we want a positive y velocity
      vx = SPEED;
    }
  }

  // keyReleased()
  //
  // Called when keyReleased is called in the main program

  void keyReleased() {
    // Check if the key is our up key and the paddle is moving up
    if (key == upKey && vy < 0) {
      // If so it should stop
      vy = 0;
    } // Otherwise check if the key is our down key and paddle is moving down 
    else if (key == downKey && vy > 0) {
      // If so it should stop
      vy = 0;
    }

    if (key == leftKey && vx < 0) {
      // If so it should stop
      vx = 0;
    } // Otherwise check if the key is our down key and paddle is moving down 
    else if (key == rightKey && vx > 0) {
      // If so it should stop
      vx = 0;
    }
  }
}