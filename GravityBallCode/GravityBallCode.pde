int count=30;  //declare and initialize integer count
//declare variables
float[]x=new float[count];
float[]y=new float[count];
float[]velX=new float[count];
float[]velY=new float[count];
float[]diam=new float[count];
float[]gravity=new float[count];

void setup() {
  size(800, 600);  //set size of canvas

  for (int i=0; i<count; i+=1) {  //while i<count, increase i by 1
    //initialize variables
    x[i]=width/2;
    y[i]=height/2;
    diam[i]=80;
    velX[i]=random(-5, 5);
    velY[i]=random(-5, 5);
    gravity[i]=.1;
  }
}
void draw() {
  background(0);  //draw background to cover previous frame

  for (int i=0; i<count; i+=1) {  //while i<count, increase i by 1
    ellipse(x[i], y[i], diam[i], diam[i]);  //draw ball
    //add velocity to position
    x[i]+=velX[i];
    y[i]+=velY[i];

    //add gravity to the ball (acceleration=change in velocity over time; change the velocity)
    velY[i]+=gravity[i];

    //bounce ball if it hits walls
    if (x[i]+diam[i]/2>=width) {
      velX[i]=-abs(velX[i]);    //if ball hits R wall, assign x velocity the negative version of itself
    } else if (x[i]-diam[i]/2<=0) {
      velX[i]=abs(velX[i]);     //if ball hits L wall, assign x velocity the positive version of itself
    }
    if (y[i]+diam[i]/2>=height) {
      velY[i]=-abs(velY[i]);  //if ball hits bottom wall, assign y velocity the positive version of itself
      y[i]=height-diam[i]/2;   //if ball hits bottom wall, it will not sink below
    } else if (y[i]-diam[i]/2<=0) {
      velY[i]=abs(velY[i]);  //if ball hits top wall, assign y velocity the negative version of itself
    }


    //add gravity (acceleration in downward direction)
    if (velY[i]+diam[i]/2>=height) {
      gravity[i]=-abs(gravity[i]);
    }
  }
}