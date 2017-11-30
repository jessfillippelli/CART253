class LeaderBoard {

  int x= 170;
  int y=40;
  int m =0;
  boolean minuteChanged =false;
  int s;


  LeaderBoard() {
  }

  void display()
  {
    // update the second variable
    s =  (millis()/100)%60;
    if (s == 59 && minuteChanged ==false)
    {

      m++;
      minuteChanged=true;
    }

    if (s!=59)
    {
      minuteChanged=false;
    }
 

    fill(255, 10);
    stroke(0);
    rectMode(CORNER);
    rect(x, y, 300, 300);

    //top
    rect(x, y, 300, 50); //x,x w,h


    //LEFT
    rect(x, y+50, 150, 50); 
    rect(x, y+100, 150, 50);
    rect(x, y+150, 150, 50);
    rect(x, y+200, 150, 50);
    rect(x, y+200, 150, 50);
    rect(x, y+250, 150, 50);
    rect(x, y+300, 150, 50);


    //RIGHT
    rect(x+150, y+50, 150, 50); 
    rect(x+150, y+100, 150, 50);
    rect(x+150, y+150, 150, 50);
    rect(x+150, y+200, 150, 50);
    rect(x+150, y+250, 150, 50);
    rect(x+150, y+300, 150, 50);


    textAlign(CENTER, CENTER);
    textSize(30);
    fill(255);
    text("LEADER BOARD!", width/2, 60);

    //FIRST ROW
    textSize(20);
    text("DARYL", 245, 111); //first number (number has to up) its the width the 2nd number is the height
    textSize(20);
    text("6 Hours", 395, 111);

    //2ND ROW
    textSize(20);
    text("RICK", 244, 160); //first number (number has to up) its the width the 2nd number is the height
    textSize(20);
    text("5 Hours", 395, 160);

    //3RD ROW
    textSize(20);
    text("MAGGIE", 244, 212); //first number (number has to up) its the width the 2nd number is the height
    textSize(20);
    text("4 Hours", 395, 212);

    //4TH ROW
    textSize(20);
    text("GLEEN", 244, 260); //first number (number has to up) its the width the 2nd number is the height
    textSize(20);
    text("3 Hours", 395, 260);

    //5TH ROW
    textSize(20);
    text("NEGAN", 244, 311); //first number (number has to up) its the width the 2nd number is the height
    textSize(20);
    text("2 Hours", 395, 311);

    ////6TH ROW
    textSize(20);
    text("YOU", 244, 360); //first number (number has to up) its the width the 2nd number is the height
    textSize(20);
    text(m+":"+s, 395, 360);
  }
}