class TenPong {

  Paddle middlePaddle;
  //TenBall ball;
  Ball[] tenBalls;

  // The distance from the edge of the window a paddle should be
  int PADDLE_INSET = 8;

  // The background colour during play (black)
  color backgroundColor = color(255, 182, 193);

  // A boolean to track whether we should return to the menu
  boolean returnToMenu = false;

  TenPong()
  {
    middlePaddle = new Paddle(width/2, height/2, 'a', 'g',70,16); //70 AND 16 IS THE SIZE OF THE PADDLE

    tenBalls = new Ball [10];
    for (int i = 0; i < tenBalls.length; i++) {
      tenBalls[i] = new Ball((int) random(width), (int) random(height), 2, 2); //CHNAGED THE LOACTION TO RANDOM for array
    }
  }

  void update()
  {
    // Fill the background each frame so we have animation
    background(backgroundColor);

    // Update the paddles and ball by calling their update methods
    //leftPaddle.update();
    middlePaddle.update();
    for (int i = 0; i < tenBalls.length; i++) {
      tenBalls[i].update();
    }

    // Check if the ball has collided with either paddle
    for (int i = 0; i < tenBalls.length; i++) {
      tenBalls[i].collide(middlePaddle);
    }

    // Check if the ball has gone off the screen
    for (int i = 0; i < tenBalls.length; i++) {
      if (tenBalls[i].isOffScreen()) {
        // If it has, reset the ball
        tenBalls[i].reset();
      }
    }
    // Display the paddles and the ball
    //leftPaddle.display();
    middlePaddle.display();
    for (int i = 0; i < tenBalls.length; i++) {
      tenBalls[i].displayTenPong();
    }
  }



  void keyPressed() {
    // Just call both paddles' own keyPressed methods
    //leftPaddle.keyPressed();
    //rightPaddle.keyPressed();
    middlePaddle.keyPressed();

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
    //leftPaddle.keyReleased();
    middlePaddle.keyReleased();
  }
  
  void reset() {
  for (int i = 0; i < tenBalls.length; i++) {
      tenBalls[i].reset();
    }
    middlePaddle.reset();
    returnToMenu = false;
  }
}