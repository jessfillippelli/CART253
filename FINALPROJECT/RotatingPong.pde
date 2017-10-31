class RotatingPong {

  //Paddle2 leftPaddle;
  //Paddle2 rightPaddle;
  Paddle horizontaleftPaddle; 
  Paddle horizontalrightPaddle;
  Ball ball;

  // The distance from the edge of the window a paddle should be
  //int PADDLE_INSET = 8;

  // The background colour during play (black)
  color backgroundColor = color(147, 112, 219);
  //color horizontaleftPaddle = color(255);

  // A boolean to track whether we should return to the menu
  boolean returnToMenu = false;

  RotatingPong() {
    // Create a paddle on either side of the screen
    horizontaleftPaddle = new Paddle(width/2, height/2, '2', 'r',70,16);
    horizontalrightPaddle = new Paddle(width/2, height/2,  '9', 'i');

    // Create the ball at the centre of the screen
    ball = new Ball(width/2, height/2);
  }

  void update(){
    // Fill the background each frame so we have animation
    background(backgroundColor);

    // Update the paddles and ball by calling their update methods
    horizontaleftPaddle.update();
    //horizontalrightPaddle.update();
    ball.update();

    // Check if the ball has collided with either paddle
    ball.collide(horizontaleftPaddle);
    ball.collide(horizontalrightPaddle);

    // Check if the ball has gone off the screen
    if (ball.isOffScreen()) {
      // If it has, reset the ball
      ball.reset();
    }

    // Display the paddles and the ball
    horizontaleftPaddle.display();
    horizontalrightPaddle.display();
    ball.displayRotatingPong();
  }

void reset() {
    ball.reset();
    horizontaleftPaddle.reset();
    horizontalrightPaddle.reset();
    returnToMenu = false;
  }


  void keyPressed() {
    // Just call both paddles' own keyPressed methods
    horizontaleftPaddle.keyPressed();
    horizontalrightPaddle.keyPressed();


    // Check if we should return to the menu
    if (key == 'm' || key == 'M') {
      returnToMenu = true;
    }
  }

  // keyReleased()
  //
  // As for keyPressed, except for released!

  void keyReleased() {
    // Call both paddles' keyReleased methods
    horizontaleftPaddle.keyReleased();
    horizontalrightPaddle.keyReleased();
  }

 

}