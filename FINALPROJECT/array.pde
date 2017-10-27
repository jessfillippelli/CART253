//THIS ARRAY GOES WITH THE TenBallPong TAB
class Tenball {


  int SPEED = 5;
  int SIZE = 16;

  // The location of the ball
  int x;
  int y;

  // The velocity of the ball
  int vx;
  int vy;

  // The colour of the ball
  //color = TenballColor = color(0); //9 BALLS

  Ball(int _x, int _y) {
    x = _x;
    y = _y;
    vx = SPEED;
    vy = SPEED;
  }

 //ellipse(56, 46, 55, 55);



  TenBall tenball;
  TenBall[] TenBalls= new TenBall[9]; // added this for the array 



  //Tenball = new Tenball((int) random(width), (int) random(height), 2, -2); //the last  2 # are teh vx(speed)
  //THE ARRAY
 // for (int i = 0; i < habs.length; i++) {
   // tenballs[i] = new TenBall((int) random(width), (int) random(height), 2, 2); //CHNAGED THE LOACTION TO RANDOM for array
  }
}