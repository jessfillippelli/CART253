color backgroundColor = color(0);

int numStatic = 1000;
int staticSizeMin = 1;
int staticSizeMax = 3;
color staticColor = color(200);
int circleSize = 27; //ADDED
color circleColor = color(255,105,180,127); //ADDED
int numCircle = 500; //ADDED 

//this all the info about the two paddles. how fast it will go, size, colour
int paddleX;
int paddleY;
int paddleVX;
int paddleSpeed = 10;
int paddleWidth = 128;
int paddleHeight = 16;
color paddleColor = color(255);
//color ballcolor; //CHANGED

//this is the info about the ball. how fast it will go, size, colour
int ballX; 
int ballY;
int ballVX;
int ballVY;
int ballSpeed = 5;
int ballSize = 16;
color ballColor = color(255);
int newBallSpeed = 30; //ADDED

void setup() {
  size(640, 480);
  
  setupPaddle();
  setupBall();
}

void setupPaddle() {
  paddleX = width/2;
  paddleY = height - paddleHeight;
  paddleVX = 0;
}

void setupBall() {
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}

void draw() {
  background(backgroundColor);

  drawStatic();

  updatePaddle();
  updateBall();
  
  
  
  drawPaddle();
  drawBall();
drawCircle();
}


//info about the static
void drawStatic() {
  for (int i = 0; i < numStatic; i++) {
   float x = random(0,width);
   float y = random(0,height);
   float staticSize = random(staticSizeMin,staticSizeMax);
   fill(staticColor);
   rect(x,y,staticSize,staticSize);
  }
}

//THE LOOP I CREATED
void drawCircle() {
  for (int i = 0; i < numCircle; i++) {
   float x = random(0,width);
   float y = random(0,height);
   fill(circleColor);
   ellipse(x,y,circleSize,circleSize);
  }
}



void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX,0+paddleWidth/2,width-paddleWidth/2);
}

void updateBall() {
  ballX += ballVX;
  ballY += ballVY;
  
  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();
  handleBallOffScreen();
  
}

void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}

void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
}

void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
    //ballColor = color(255,0,0); //CHANGED #1
ballColor = color(random(255),0,0);//CHANGED #2 I MADE IT RANDOME SHADE OF RED EVERYTIME IT HIT PADDLE 
//float ballcolor = random(0,100);
//float ballcolor = random(0,100);
//background(red,green,blue);

  }
}

//void ballHitsPaddle(){
//  if (ballHitsPaddle()) {
//    ballY = paddleY - paddleHeight/5 - ballSize/5; 
//    ballVY = -ballVY;
//    color; (255,0,0);
//  }
//}


//NEW FUNCTION I MADE
void handleBallOffScreen(){
  if (ballHitsTheRightSide()){
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
    newBallSpeed = 30;
  }
}


//NEW FUNCTION I MADE
boolean ballHitsTheRightSide(){
    if (ballX - ballSize/5 > paddleX - paddleWidth/5 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/5) {
      return true;
    }
  }
  return false;
}


boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
}

void handleBallOffBottom() {
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
  }
}

boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}

void handleBallHitWall() {
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }
  
  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
  }
}

// without these you cannot move the paddle right or left 
void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
}

void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
}