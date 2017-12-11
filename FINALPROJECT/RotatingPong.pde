//THIS GAME IS CALLED ROTATING PONG
//ARROW KEYS MAKE THE PADDLE MOVE 
// THERES NO WAY TO LET THE PLAYER FIND OUT HOW THE GAME ENDS 
// THATS WHATS FUN ABOUT THE GAME, THE PLAYER NEVER KNOWS WHEN ITS "GAME OVER" 
// ITS REALLY GAME OVER WHEN THE PLYER DOES NOT TOUCH THE PADDLE TO THE BALL FOR AT LEATS 10 SECONDS 
class RotatingPong {


  Paddle horizontalPaddle;
  Ball ball;


  // The distance from the edge of the window a paddle should be
  int  horizontalHeight = 16;
  PImage img;

  // The background colour during play 
  color backgroundColor = color(147, 112, 219);


  // A boolean to track whether we should return to the menu
  boolean returnToMenu = false;

  long startTimer;
  long timePassed; 
  long stopGame = 10000;
  boolean gameOverRotatePong =false;

  RotatingPong() {
    // Create 2 PADDLES IN THE MIDDLE OF THE SCREEN
    horizontalPaddle = new Paddle(width/2, height - horizontalHeight, '2', 'r', 100, 16, '3', 'e');


    // Create the ball at the centre of the screen
    ball = new Ball(width/2, height/2, 2, 0);
    startTimer =millis();
  }

  void update() {

    // update amount of time Passed::

    timePassed = millis() - startTimer;
    if (timePassed > stopGame )
    {
      println("gameOver");
      gameOverRotatePong =true;
    }

    // Fill the background each frame so we have animation
    background(backgroundColor);

    // Update the paddles and ball by calling their update methods
    horizontalPaddle.updatehorizontal();
    ball.update();

    //display the table

    // Check if the ball has collided with either paddle
    boolean wasHit  = ball.collideRotate(horizontalPaddle);
    // println(wasHit);
    if (wasHit == true)
    {
      // reset timer
      startTimer = millis();
      timePassed =0;
    }

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
    horizontalPaddle.resetHorizontalPaddle(horizontalHeight);
    gameOverRotatePong = false;
    startTimer = millis();
    returnToMenu = false;
    leaderBoard.s=0;
    leaderBoard.m=0;
  }

  //EVERYTHING YOU WANT ON THE GAME OVER SCREEN
  void displayGameOverScreen()
  {

    textSize(35);
    text("TIME", 244, 360); 
    textSize(35);
    img = loadImage("gameover.png");
    image(img, 154, 20, 350, 400);
    text(leaderBoard.m+":"+leaderBoard.s, 395, 360);
    text("YOU SUCK AT THIS GAME", width/2, 300);
    textSize(25);
    text("Press M to Return to Menu", width/2, 330);
  }





  void keyPressed() {
    // Just call both paddles' own keyPressed methods
    horizontalPaddle.keyPressedRotatePong();


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
    //println("KEY RELEASED");
    horizontalPaddle.keyReleasedRotatePong();
  }
}