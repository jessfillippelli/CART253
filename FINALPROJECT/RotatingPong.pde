class RotatingPong {


  Paddle horizontalPaddle;
  Ball ball;
  

  // The distance from the edge of the window a paddle should be
  int  horizontalHeight = 16;
  
  // The background colour during play 
  color backgroundColor = color(147, 112, 219);


  // A boolean to track whether we should return to the menu
  boolean returnToMenu = false;

  RotatingPong() {
    // Create 2 PADDLES IN THE MIDDLE OF THE SCREEN
    horizontalPaddle = new Paddle(width/2, height - horizontalHeight, '2', 'r', 100, 16,'3','e');


    // Create the ball at the centre of the screen
    ball = new Ball(width/2, height/2, 2, 0);
  }

  void update() {
    // Fill the background each frame so we have animation
    background(backgroundColor);

    // Update the paddles and ball by calling their update methods
    horizontalPaddle.updatehorizontal();
    ball.update();
    
    //display the table

    // Check if the ball has collided with either paddle
    ball.collide(horizontalPaddle);

    // Check if the ball has gone off the screen
    if (ball.isOffScreen()) {
      // If it has, reset the ball
      ball.reset();
    }

    // Display the paddles and the ball
    horizontalPaddle.displayRotatingPong();
    ball.displayRotatingPong();
    leaderBoard.display();
  }

  void reset() {
    ball.reset();
    horizontalPaddle.reset();
    returnToMenu = false;
  }


  void keyPressed() {
    // Just call both paddles' own keyPressed methods
    horizontalPaddle.keyPressed();


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
    horizontalPaddle.keyReleased();
  }
}