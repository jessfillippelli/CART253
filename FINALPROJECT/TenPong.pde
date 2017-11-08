//BALL ID 0 = BALL CAN BE HIT = YOU GET A POINT (SCORE CAN GET HIGHTER)
// BALL ID = 1 = CAN NOT GET HIT = NO POINT
//KEYS TO PLAY THE GAME "q" and "p" MAKE SURE CAP LOCK IS OFF
class TenPong {

  Paddle middlePaddle;
  Ball[] tenBalls;

  // The distance from the edge of the window a paddle should be

  int tenHeight = 50;
  PImage img;  //FOR THE OVEROVER PIC 

  // The background colour during play 
  color backgroundColor = color(255, 182, 193);

  // A boolean to track whether we should return to the menu
  boolean returnToMenu = false;
  int numberOfPointsToWin = 1;




  TenPong()
  {
    middlePaddle = new Paddle(width/2, height - tenHeight, 'q', 'p', 70, 16); //70 AND 16 IS THE SIZE OF THE PADDLE

    tenBalls = new Ball [10];
    for (int i = 0; i < tenBalls.length; i++) {
       int xspeed = (int)random(-10,10);
       int yspeed = (int)random(5,8);
      // variable 1 =x
      // variable 2 =y pos
      // variable 3 is xspeed
      // variable 4 is yspeed
      //variable 5 is ponggame id
      // variable 6 is ball id (0 if can be hit, 1 if not)
      if (i==0)
      {
        tenBalls[i] = new Ball((int) random(width), (int) random(height), xspeed, yspeed, 3, 0);
      } else
      {
        tenBalls[i] = new Ball((int) random(width), (int) random(height), xspeed, yspeed, 3, 1); //CHNAGED THE LOACTION TO RANDOM for array
      }
    }
  }

  void update()
  {
    // Fill the background each frame so we have animation
    background(backgroundColor);
    // Update the paddles and ball by calling their update methods
    middlePaddle.updatehorizontal();
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
    middlePaddle.display();
    for (int i = 0; i < tenBalls.length; i++) {
      tenBalls[i].displayTenPong();
    }

    //ELEMENT FOR THE SCORE (TEN PONG)
    textSize(32);
    fill(0); 
    text(middlePaddle.score, middlePaddle.x, middlePaddle.y );


    //this is after you win
    if (middlePaddle.score >= numberOfPointsToWin) {
      background(255, 182, 193);
      img = loadImage("game_over.jpg");
      image(img, 154,20,width/2, height/2);
      textSize(27);
      fill(255);
      text("Congrats you won!!", width/2, 300);
    }
    
    displayInstructions();
  }
  
  //TEXT FOR THE 10 PONG
  void displayInstructions() {   
    textSize(20);
    fill(255);
    text("M = menu! :) ", width/2, 3*height/4);
    text("q and p to play",width/2, 388);
    fill(255);
    
  }



  void keyPressed() {
    // Just call both paddles' own keyPressed methods
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
    middlePaddle.keyReleased();
  }

  void reset() {
    for (int i = 0; i < tenBalls.length; i++) {
      tenBalls[i].reset();
    }
    middlePaddle.reset();
    middlePaddle.y = height - tenHeight;
    returnToMenu = false;
    
  
  }
}