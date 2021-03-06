// Pong(s)
// by jessica filippelli
//
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
    ROTATING_PONG ////ADDED THIS FOR THE ROTATING PONG GAME
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
    rotatingPong.update();
    if (rotatingPong.returnToMenu) {
      state = State.MENU;
      rotatingPong.returnToMenu = false;
      rotatingPong.reset();
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

  case TEN_PONG:
    tenPong.keyPressed();
    break;
   
    //ADDED THIS FOR THE ROTATING PONG
    case ROTATING_PONG:
    rotatingPong.keyPressed();
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
  }
}