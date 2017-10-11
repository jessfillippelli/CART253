// Pong
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.
//
// No scoring. (Yet!)
// No score display. (Yet!)
// Pretty ugly. (Now!)
// Only two paddles. (So far!)

//NEW KEYS
//PLAYER ONE HAS ---> Z AND X <---
//PLAYER TWO HAS ---> N AMD M <---


//INFO ABOUT THE SCORE 
//PLAYER ONE -> RIGHT PADDLE -> RED BALL
//PLAYER TWO -> LEFT PADDLE -> BLUE BALL 
//IF PLAYER HITS ITS OWN BALL = +1
//IF PLAYER HITS HIS OPINOTE BALL - 1
// FIRST TO 10 WINS 

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;
Ball ball2; //ADDED THIS 

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 20; // ADDED SOMESAPCE BETWEEN THE PADDLE AND THE WALL
int numCircle = 40;
//PImage img;  //FOR THE OVEROVER PIC 

// The background colour during play (black)
color backgroundColor = color(50, 205, 50); //CHANGED THE BACKGROUND COLOR
color circleColor = color(0, 127); //ADDED THIS FOR THE BACK GROUND BALLS
int circleSize = 30; //ADDED THIS //THE BLUE BACKGROUND CIRCLES

// setup()
//
// Sets the size and creates the paddles and ball

//ADDED INFO ABOUT THE SCORE 
int numberOfPointsToWin = 1; //NEED 10 POINTS TO WIN
boolean playGame = true;

void setup() {
  // the size 
  size(550, 500);
  //img = loadImage("gameover.png");

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)

  leftPaddle = new Paddle(PADDLE_INSET, height/2, 'z', 'x', 2);
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, 'n', 'm', 1);

  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/3, 1, color(255, 0, 0)); // ADDED THE COLOR OF THE BALL
  ball2 = new Ball(width/2, 2*height/3, 2, color(0, 0, 255)); //ADDED THIS
}



//THE BACKGROUND
// ADDED THIS TO THE BACKGROUND TO MAKE THE BALL HARDER TO SEE
void drawCircle() {
  for (int i = 0; i < numCircle; i++) {
    float x = random(0, width);
    float y = random(0, height);
    fill(circleColor);
    ellipse(x, y, circleSize, circleSize);
  }

  // THE TEXT FOR THE SCORE
  textSize(32);
  fill(0, 0, 255); //COLOR OF THE SCORE FOR LEFT PADDLE PLAYER 
  text(leftPaddle.score, width/2 -50, height-10);

  fill(255, 0, 0); //COLOR FOR THE SCORE FOR THE RIGHT PLAYER  
  text(rightPaddle.score, width/2+50, height-10);
}


// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  // Fill the background each frame so we have animation
  background(backgroundColor);
  if (playGame ==true)
  {
    drawCircle();

    // Update the paddles and ball by calling their update methods
    leftPaddle.update();
    rightPaddle.update();
    ball.update();
    ball2.update();

    // Check if the ball has collided with either paddle
    ball.collide(leftPaddle);
    ball.collide(rightPaddle);

    ball2.collide(leftPaddle);
    ball2.collide(rightPaddle);


    // Check if the ball has gone off the screen
    if (ball.isOffScreen()) {
      // If it has, reset the ball
      ball.reset();
    }

    if (ball2.isOffScreen()) {
      // If it has, reset the ball
      ball2.reset();
    }

    // Display the paddles and the ball
    leftPaddle.display();
    rightPaddle.display();
    ball.display();
    ball2.display();

    //function to check score
    checkScore();
  }

  // playGame is true
  // if game is won means playGame ==false
  //ALL THE ELEMENTS WHEN THE GAME IS OVER 
  else
  {
    background(0);
    //img = loadImage("gameover.png");
    //image(img, 0, 0);
    //image(img, 0, 0, width/2, height/2);
    text("GAME OVER", width/4.5, height/4);
    textSize(32);
    fill(255);

    if (leftPaddle.score == numberOfPointsToWin) {
      textSize(32);
      fill(0, 0, 255);
      text("BLUE BALL PLAYER WINS", width/2, height/2);
    }

    if (rightPaddle.score == numberOfPointsToWin) {
      textSize(32);
      fill(255, 0, 0);
      text("RED BALL PLAYER WINS", width/2, height/2);
    }
  }
}

// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  rightPaddle.keyPressed();
  leftPaddle.keyPressed();
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}

void checkScore()
{
  if ((leftPaddle.score ==numberOfPointsToWin)||(rightPaddle.score ==numberOfPointsToWin))
  {
    playGame =false;
  }
}