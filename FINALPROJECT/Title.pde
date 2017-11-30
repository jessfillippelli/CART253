// Title
//
// A simple class to display the title of the game on the
// screen and listen for a press of any key. When a key is pressed
// it remembers the title is finished and the main program checks
// this in order to advance to the menu.

class Title {

  // A variable to track whether the title screen is finished
  boolean finished = false;

  // The constructor does nothing
  Title() {
  }

  // update()
  //
  // Just displays the title

  void update() {
    display();
  }

  // display()
  //
  // Displays the title of the game and the basic instructions
  // to press any key
  void display() {
    background(0);
    textAlign(CENTER, CENTER);

    textSize(64);
    fill(153, 50, 204);
    text("Pong Extravaganza!", width/2, height/2);

    fill(255);
    textSize(27);
    text("Wanna Play?", width/2, 300);

    fill(255);
    textSize(27);
    text("Press any key to continue then", width/2, 335);
  }

  // keyPressed()
  //
  // Called by the main program when the title is active.
  // Sets finished to true immediately (since it's any key)

  void keyPressed() {
    finished = true;
  }

  // keyReleased()
  //
  // Does nothing.

  void keyReleased() {
  }
}