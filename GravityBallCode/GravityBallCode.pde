//declare variables
//float x, y, velX, velY, diam, gravity;


//edit ball count
int count=30;

//create arrays
float[]x=new float[count];
float[]y=new float[count];
float[]velX=new float[count];
float[]velY=new float[count];
float[]diam=new float[count];
float[]gravity=new float[count];

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  for (int i=0; i < count; i++) {

    //define positions of balls referring to the array
    x[i]=random(width);
    x[i]=random(height);
    velX[i]=random(-5, 5);
    velY[i]=random(-5, 5);
    diam[i]=30;
    gravity[i]=.1;
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);

  for (int i=0; i < count; i++) {

    //draw ball
    ellipse(x[i], y[i], diam[i], diam[i]);

    //add velocity to position
    x[i] += velX[i];
    y[i] += velY[i]; 
    //add gravity to velocity
    velY[i] +=gravity[i];

    //bounce ball if it hits walls
    if (x[i] + diam[i]/2 >= width) {
      velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (x[i] - diam[i]/2 <= 0) {
      velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (y[i] + diam[i]/2 >= height) {
      velY[i] = -abs(velY[i]);
    } else if (y[i] - diam[i]/2 <= 0) {
      velY[i] = abs(velY[i]);
    }
  }
}