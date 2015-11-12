//declare variables//
int count=30;
float[] x = new float[count]; //count each variable
float[] y = new float[count];
float[] velX = new float[count];
float[] velY = new float[count];
float[] diam = new float [count];
int i= 0;

float gravity;  //gravity variable

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  x[i] = width/2;             //positions of balls
  y[i] = height/2;
  diam[i] = 80;
  velX[i] = random(-5, 5);
  velY[i] = random(-5, 5);
  gravity=.1;
}

void draw() {
  //draw background to cover previous frame
  background(0);
  
  for(int i = 0; i < count; i++){

  //draw ball
 
  ellipse(x[i], y[i], diam[i], diam[i]);    //1      // draw 30 ellipses
  ellipse(x[i]/2, y[i], diam[i], diam[i]);//2
  ellipse(x[i]/3, y[i], diam[i], diam[i]);//3
  ellipse(x[i]/4, y[i], diam[i], diam[i]);//4
  ellipse(x[i]/5, y[i], diam[i], diam[i]);//5
  ellipse(x[i]/6, y[i], diam[i], diam[i]);//6
  ellipse(x[i]/7, y[i], diam[i], diam[i]);//7
  ellipse(x[i]/8, y[i], diam[i], diam[i]);//8
  ellipse(x[i]/9, y[i], diam[i], diam[i]);//9
  ellipse(x[i]/10, y[i], diam[i], diam[i]);//10
  ellipse(x[i]/11, y[i], diam[i], diam[i]);//11
  ellipse(x[i]/12, y[i], diam[i], diam[i]);//12
  ellipse(x[i]/13, y[i], diam[i], diam[i]);//13
  ellipse(x[i]/14, y[i], diam[i], diam[i]);//14
  ellipse(x[i]/15, y[i], diam[i], diam[i]);//15
  ellipse(x[i]/16, y[i], diam[i], diam[i]);//16
  ellipse(x[i]/17, y[i], diam[i], diam[i]);//17
  ellipse(x[i]/18, y[i], diam[i], diam[i]);//18
  ellipse(x[i]/19, y[i], diam[i], diam[i]);//19
  ellipse(x[i]/20, y[i], diam[i], diam[i]);//20
   ellipse(x[i]/21, y[i], diam[i], diam[i]);    //21
  ellipse(x[i]/22, y[i], diam[i], diam[i]);//22
  ellipse(x[i]/23, y[i], diam[i], diam[i]);//23
  ellipse(x[i]/24, y[i], diam[i], diam[i]);//24
  ellipse(x[i]/25, y[i], diam[i], diam[i]);//25
  ellipse(x[i]/26, y[i], diam[i], diam[i]);//26
  ellipse(x[i]/27, y[i], diam[i], diam[i]);//27
  ellipse(x[i]/28, y[i], diam[i], diam[i]);//28
  ellipse(x[i]/29, y[i], diam[i], diam[i]);//29
  ellipse(x[i]/30, y[i], diam[i], diam[i]);//30

  //add velocity to position
  x[i] += velX[i]; //x velocity changes
  y[i] += velY[i];   //y velocity changes
  velY[i] += gravity; //Adds gravity to velocity

  //bounce ball if it hits walls
  if (x[i] + diam[i]/2 >= width) {
    velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (x[i] - diam[i]/2 <= 0) {
    velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  if (y[i] + diam[i]/2 >= height) {  //if ball hits bottom changes dirtection
    velY[i] = -abs(velY[i]);
  } else if (y[i] - diam[i]/2 <= 0) { //ball hits top changes direction
    velY[i] = abs(velY[i]);
  }
  }
}