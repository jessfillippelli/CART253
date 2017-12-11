// PONG EXTRAVAGANZA
// by JESSICA FILIPPELLI

// ARTIST'S STATEMENT
//What I think is interesting about the program I created is the different kind of Pong games I created. 
//What I mean by this is that I’ve never seen these types of Pong games before and it gives the players 
//a different feeling while playing, I guess I can say a feeling of excitement while playing a new style of Pong,
//because playing the same type of Pong all the time would be a bit boring in my opinion.
//The creative accept would be the way I incorporated the paddles and balls in different styles, 
//while adding some elements I think would make the game more enjoyable, on the eyes and how you play. 
//I was creative by adding everyday elements ex: leaderboard, (rotating pong). I’m hoping this leaderboard 
//will make the players want to beat the highest ranked player. That way the player will play the game more than once. 
//Another creative element is the way I made the paddles be random, (random pong) it makes the game more exciting.
//It might be boring looking at the same ball and paddles all the time, and also the player will not know what the ball and paddles 
//will look like, they will always be surprise, as to what teh ball and paddles look like next. The last creative element is I made a 
//pong game with more than one ball, it gives the game a exciting and cool look. I’m hoping with more than one ball
//the player will have a hard time hitting the ball that gives you the pont and want to keep playing until they win, because I know I would want to play
//until I can win and I hope the player thinks like that too.
//interesting coding: Well everything was pretty interesting and overwhelming.
//But the most interesting code, I would say is the frame rate, I was able to make the balls and paddles random with it. Even if there is a lot of code I still think
//it’s pretty cool how it works. The array was also pretty interesting but confusing at first, but once I figured how to pin point one of the balls to make it
//different from the rest, all was ok. The coding for the rotating pong was a little hard for me to understanding (timer and rotating paddle) 
//and I think that’s what makes it most interesting for me because to see how the code I did not understand comes to life.
//lastly I made A ball ID which helps a lot trying to figure out which ball goes to which game. (basic, blue and ten pong) because I use
// the same ball and i did not want the ball for basic and blue to change just the ten pong. 



// A version of Pong that can run multiple versions of the game.
// Each version is a class and the game is able to show a title screen,
// a menu for selection versions, and the versions themselves.

// An enum is a way to group together a set of named options
// In this case I'm using it for tracking the state the program is in.
enum State {
  NONE, 
    TITLE, 
    MENU, 
    BASIC_PONG, 
    BLUE_PONG, 
    TEN_PONG, //ADDED THIS FOR THE 10 BALL PONG
    ROTATING_PONG, ////ADDED THIS FOR THE ROTATING PONG GAME
    RANDOM_PONG
}
// This is the variable that actually tracks the state in the game
State state;

// Now we create variables to store the different objects that
// represent the different states of the game
Title title;
Menu menu;
BasicPong basicPong;
BluePong bluePong;
TenPong tenPong; //ADDED THIS FOR THE 10 BALL PONG 
RotatingPong rotatingPong; //ADDED THIS FOR THE ROTATING PONG GAME
LeaderBoard leaderBoard;
RandomPong randomPong;

// setup()
//
// Sets the size and creates the various state objects

void setup() {
  // Set the size
  size(640, 480);

  // Create the different states
  title = new Title();
  menu = new Menu();
  basicPong = new BasicPong();
  bluePong = new BluePong();
  tenPong = new TenPong(); //ADDED THIS FOR THE 10 BALL PONG
  rotatingPong = new RotatingPong(); //ADDED THIS FOR THE ROTATING PONG GAME
  leaderBoard = new LeaderBoard();
  randomPong = new RandomPong();


  // We start our state in the title screen
  state = State.TITLE;
}

// draw()
//
// This uses a "Finite State Machine" (FSM) to run the game
// depending on what state we're in. So if we're in the title state,
// it uses the title object to draw the title etc.

void draw() {
  // A "switch" statement is like an "if" statement with different
  // syntax. Notice how we use "break;" after the instructions for
  // each state are finished.
  switch (state) {
    // If our state is NONE, we do nothing
  case NONE:

    break;

    // If our state is TITLE we update the title object
    // which displays it, and then we check whether the title
    // screen is finished and if so we go to the menu state
  case TITLE:
    title.update();
    if (title.finished) {
      state = State.MENU;
    }
    break;

    // If our state is MENU we update the menu
    // We then check whether anything has been selected
    // in the menu and if so we switch to that state
    // (And reset the menu selection for next time.)
  case MENU:
    menu.update();
    if (menu.selection != State.NONE) {
      state = menu.selection;
      menu.selection = State.NONE;
    }
    break;

    // If our state is BASIC_PONG we update the
    // basicPong object which runs the game and then check whether 
    // the player has chosen to return to the menu. If so we set
    // the state appropriate, and reset the game.
  case BASIC_PONG:
    basicPong.update();
    if (basicPong.returnToMenu) {
      state = State.MENU;
      basicPong.reset();
    }
    break;

    // If our state is BLUE_PONG we do all the same things,
    // but for the bluePong object instead
  case BLUE_PONG:
    bluePong.update();
    if (bluePong.returnToMenu) {
      state = State.MENU;
      bluePong.returnToMenu = false;
      bluePong.reset();
    }
    break;

    //CASE FOR THE 10 BALL PONG
  case TEN_PONG:
    tenPong.update();
    if (tenPong.returnToMenu) {
      state = State.MENU;
      tenPong.returnToMenu = false;
      tenPong.reset();
    }
    break;

    //CASE FOR THE ROTATING PONG
  case ROTATING_PONG:
    if (rotatingPong.gameOverRotatePong ==false)
    {
      // println("test");
      rotatingPong.update();
    } else
    {
      background(0);
      rotatingPong.displayGameOverScreen();
    }
    if (rotatingPong.returnToMenu) {
      state = State.MENU;
      rotatingPong.returnToMenu = false;
      rotatingPong.reset();
    } 
    break;

    //CASE FOR THE RANDOM PONG
  case RANDOM_PONG:
    randomPong.update();
    if (randomPong.returnToMenu) {
      state = State.MENU;
      randomPong.returnToMenu = false;
      randomPong.reset();
      //function to check score
      //checkScore();
    }
    break;
  }
}

// keyPressed()
//
// Here we just call the keyPressed() method of the appropriate
// object for the state we're in.

void keyPressed() {
  switch (state) {
  case NONE:
    break;

  case TITLE:
    title.keyPressed();
    break;

  case MENU:
    menu.keyPressed();
    break;

  case BASIC_PONG:
    basicPong.keyPressed();
    break;

  case BLUE_PONG:
    bluePong.keyPressed();
    break;

    //for the 10 pong
  case TEN_PONG:
    tenPong.keyPressed();
    break;

    //ADDED THIS FOR THE ROTATING PONG
  case ROTATING_PONG:
    rotatingPong.keyPressed();
    break;

    //ADDED THIS FOR THE random PONG
  case RANDOM_PONG:
    randomPong.keyPressed();
    break;
  }
}


// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  switch (state) {
  case NONE:
    break;

  case TITLE:
    title.keyReleased();
    break;

  case MENU:
    menu.keyReleased();
    break;


  case BASIC_PONG:
    basicPong.keyReleased();
    break;

  case BLUE_PONG:
    bluePong.keyReleased();
    break;

  case TEN_PONG:
    tenPong.keyReleased();
    break;

    //ADDED THIS FOR ROTATING PONG
  case ROTATING_PONG:
    rotatingPong.keyReleased();
    break;

    //ADDED THIS FOR random PONG
  case RANDOM_PONG:
    randomPong.keyReleased();
    break;
  }
}