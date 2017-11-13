class RandomPong {

  // Variables to store the main objects in the game (the paddles and ball)
  Paddle leftPaddle;
  Paddle rightPaddle;
  Ball ball;

  // The distance from the edge of the window a paddle should be
  int PADDLE_INSET = 8;

  // The background colour during play (black)
  color backgroundColor = color(255, 179, 71);

  // A boolean to track whether we should return to the menu
  boolean returnToMenu = false;

  // BasicPong()
  //
  // Creates the paddles and ball

  RandomPong() {
    // Create a paddle on either side of the screen
    leftPaddle = new Paddle(PADDLE_INSET, height/2, '1', 'q');
    rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');

    // Create the ball at the centre of the screen
    ball = new Ball(width/2, height/2, 0, 0);
  }

  // update()
  //
  // Handles all the magic of making the paddles and ball move, checking
  // if the ball has hit a paddle, and displaying everything.

  void update() {
    // Fill the background each frame so we have animation
    background(backgroundColor);

    if (frameCount % 300 > 200 ) {
      ball.SIZE = 75;
      ball.shape = "rect";
      leftPaddle.HEIGHT = 15;
      rightPaddle.WIDTH = 27;
      backgroundColor = color(173, 216, 230); //light blue 
    }
    else if (frameCount % 300 > 100) {
      ball.SIZE = 27;
      ball.shape = "ellipse";
      rightPaddle.WIDTH = 35;
      leftPaddle.HEIGHT = 80;
      backgroundColor = color(240, 128, 128); // light Coral
    }
  else if (frameCount % 300 > 0) {
      ball.SIZE = 50;
      ball.shape = "triangle";
      rightPaddle.WIDTH = 50;
      leftPaddle.HEIGHT = 100;
      backgroundColor = color(224, 255, 255); //light cyan
    }







    // Update the paddles and ball by calling their update methods
    leftPaddle.update();
    rightPaddle.update();
    ball.update();

    // Check if the ball has collided with either paddle
    ball.collide(leftPaddle);
    ball.collide(rightPaddle);

    // Check if the ball has gone off the screen
    if (ball.isOffScreen()) {
      // If it has, reset the ball
      ball.reset();
    }

    // Display the paddles and the ball
    leftPaddle.display(); //trying to get the paddle to get random with this function  
    rightPaddle.display();


    ball.display();
  }



  // reset()
  //
  // Resets the game by resetting the ball and paddles and setting
  // returnToMenu to false

  void reset() {
    ball.reset();
    leftPaddle.reset();
    rightPaddle.reset();
    returnToMenu = false;
  }

  // keyPressed()
  //
  // The paddles need to know if they should move based on a keypress
  // so when the keypress is detected in the main program we need to
  // tell the paddles

  void keyPressed() {
    // Just call both paddles' own keyPressed methods
    leftPaddle.keyPressed();
    rightPaddle.keyPressed();

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
    leftPaddle.keyReleased();
    rightPaddle.keyReleased();
  }
}