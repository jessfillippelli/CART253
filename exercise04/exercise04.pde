// Griddies
// by Pippin Barr
// MODIFIED BY: jessica filippelli
//
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.

// The size of a single grid element
int gridSize = 20;
// An array storing all the griddies
Griddie[] griddies = new Griddie[100];
Hab hab;
Hab[] habs= new Hab[7]; // added this for teh array

// setup()
//
// Set up the window and the griddies

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(10);


  // QUESTION: What does this for loop do?
  //this loop adds all the red squares on the screen. its a array
  for (int i = 0; i < griddies.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
  }

  hab = new Hab((int) random(width), (int) random(height),2, -2); //the last  2 # are teh vx(speed)
  //THE ARRAY
  for (int i = 0; i < habs.length; i++) {
    habs[i] = new Hab((int) random(width), (int) random(height) ,2,2); //CHNAGED THE LOACTION TO RANDOM fro array
  
}

}


// draw()
//
// Update all the griddies, check for collisions between them, display them.

void draw() {
 // println(frameRate);
  background(50);
  
  //ADDED THIS FOR THE NEW CLASS AND ARRAY
  hab.move();
  hab.draw();
   for (int i = 0; i < habs.length; i++) {
    habs[i].move();
    habs[i].draw();
  }

  // We need to loop through all the griddies one by one
  for (int i = 0; i < griddies.length; i++) {

    // Update the griddies
    griddies[i].update();

    // Now go through all the griddies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?
      // int = gridSize 
      //this if statement is if the gridsize is less than the griddies.lenghts than
      if (j != i) {
        // QUESTION: What does this line check?
        //i think this line means to cheek if a ball collides with another ball, if the balls touch eachother.
        griddies[i].collide(griddies[j]);
      }
    }
    
    // Display the griddies
    griddies[i].display();
  }

}