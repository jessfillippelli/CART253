//this is the main parts of the code 


color backgroundColor = color(200,150,150);
Bouncer bouncer;
Bouncer bouncer2;

//info about the screen 
void setup() {
  size(640,480);
  background(backgroundColor);
  //float red = random(50,100); // CHANGED MADE THE COLOR OF THE BALL TO RANDOM WHEN IT HIT THE WALL 
  //float green = random(25,200);
  //float blue = random(300,100);
  //fill(red,green,blue);
  //}
  bouncer = new Bouncer(width/2,height/2,2,2,50,color(150,0,0,50),color(255,0,0,50));
  bouncer2 = new Bouncer(width/2,height/2,-2,2,50,color(0,0,150,50),color(0,0,255,50));
}

void draw() {
  bouncer.update();
  bouncer2.update();
  bouncer.draw();
  bouncer2.draw();
}

//ADDED THIS: TELL THE BOUNCER THAT THE BALL HAS BEEN CLICKED  
void mouseClicked() {
 bouncer.mouseClicked();
 bouncer2.mouseClicked();
}