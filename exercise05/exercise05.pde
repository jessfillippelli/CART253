float t1 = random(0,100);
float t2 = random(0,100);
float t3 = random(0,100);
int x;
int y;
int[][] my2DArray;


void setup() {
  size(200,200);
  my2DArray = new int[height][width];
}

void draw() {
   for (int y = 0; y < my2DArray.length; y++) {
  for (int x = 0; x < my2DArray[y].length; x++) {
    stroke(random(255));
    point(x,y);
  }
}
  
  float petOneX = width*noise(t1);
  ellipse(petOneX,100,20,20);
  float petTwoX = width*noise(t2);
  ellipse(petTwoX,150,20,20);
  float petThreeX = width*noise(t3);
  ellipse(petThreeX,175,20,20);
  t1+= 01;
  t2+= 0.13;
  t3+= 0.10;
 
}