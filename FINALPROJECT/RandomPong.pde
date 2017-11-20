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
// THE FRAME RATE FOR THE RANDOM SHAPES
    if (frameCount % 800 > 800 ) {
      ball.SIZE = 75;
      ball.ballColor = color(230,187,173);
      paddleColor = color(
      ball.shape = "rect";
      leftPaddle.HEIGHT = 15;
      rightPaddle.WIDTH = 27;
      backgroundColor = color(173, 216, 230); //light blue 
    }
    else if (frameCount % 800 > 700) {
      ball.SIZE = 27;
      ball.shape = "ellipse";
      rightPaddle.WIDTH = 35;
      leftPaddle.HEIGHT = 80;
      backgroundColor = color(240, 128, 128); // light Coral
    }
  else if (frameCount % 800 > 600) {
      ball.SIZE = 50;
      ball.shape = "triangle";
      rightPaddle.WIDTH = 50;
      leftPaddle.HEIGHT = 100;
      backgroundColor = color(250, 250, 210); //light yellow
    }
    
     else if (frameCount % 800 > 500) {
      ball.SIZE = 100; 
     // println("IN IMAGE");
      ball.shape = "image";
      rightPaddle.WIDTH = 50;
      leftPaddle.HEIGHT = 100;
      backgroundColor = color(250, 0, 0);  //red
      //text("Dryal Dixon ain't nobody's bitch.");
    }
    
    else if (frameCount % 800 > 400) {
      ball.SIZE = 25;
      ball.shape = "ellipse";
      rightPaddle.WIDTH = 40;
      leftPaddle.HEIGHT = 200;
      backgroundColor = color(144, 238, 144); //light green
    }
    
 else if (frameCount % 800 > 300) {
      ball.SIZE = 115;
      ball.shape = "rect";
      rightPaddle.WIDTH = 46;
      leftPaddle.HEIGHT = 99;
      backgroundColor = color(255, 182, 193); //light pink
    }

 else if (frameCount % 800 > 200) {
      ball.SIZE = 118;
      ball.shape = "triangle";
      rightPaddle.WIDTH = 40;
      leftPaddle.HEIGHT = 100;
      backgroundColor = color(255, 160, 122); //light orange
    }

 else if (frameCount % 800 > 100) {
      ball.SIZE = 60;
      ball.shape = "star";
      ball.ballColor = color(230,187,173);
      rightPaddle.WIDTH = 69;
      leftPaddle.HEIGHT = 40;
      backgroundColor = color(32, 178, 170); //light sea green
    }
    
     else if (frameCount % 800 > 0) {
       println("image2");
      ball.SIZE = 60;
      ball.shape = "image2";
      rightPaddle.WIDTH = 69;
      leftPaddle.HEIGHT = 40;
      backgroundColor = color(32, 178, 170); //light sea green
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