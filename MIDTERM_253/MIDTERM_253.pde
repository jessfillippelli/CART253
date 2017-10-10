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

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;
Ball ball2; //ADDED THIS 

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;
int numCircle = 20;
//int i = 0;
// The background colour during play (black)
color backgroundColor = color(0,255,0); //CHANGED THE BACKGROUND COLOR
color circleColor = color(0,0,255,127); //ADDED THIS 
color ballcolor2 = color(255,0,0); //ADDED THIS
int circleSize = 30; //ADDED THIS //THE BLUE BACKGROUND CIRCLES
//int Counter =0;
int score =0;


// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // the size o
  size(550, 500);

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  
  leftPaddle = new Paddle(PADDLE_INSET, height/2, '1', 'q');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');
  
  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/3);
  ball2 = new Ball(width/2, 2*height/3); //ADDED THIS 
}

//not sure about this MAYBE FOR THE SCORE
//for (int i = 0; i < 10; i ++) {
  //println( "The Value of i is" +i);
//}


// ADDED THIS 
void drawCircle() {
  for (int i = 0; i < numCircle; i++) {
   float x = random(0,width);
   float y = random(0,height);
   fill(circleColor);
   ellipse(x,y,circleSize,circleSize);
  }

  textSize(32);
  fill(255,0,0);
  text("score: " + score, 10, 30);



}


// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  // Fill the background each frame so we have animation
  background(backgroundColor);
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

    
    //text(counter, width/2, height/2);
    //counter++;
    //textsize(100);
    //textalign(CENTER, CENTER);

}

// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  //ADDED THIS NOT SURE ABOUT IT THO 
  //if (key == "0" && "p") {
  //  rightPaddle.keyPressed(-10);
  //} else if (key == "1" && "q") {
  // leftPaddle.keyPressed(10);
  //}
  
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