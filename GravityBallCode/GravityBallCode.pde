//declare variables
int count = 30; //sets count

float[] x = new float[count];
float[] y = new float[count];
float[] velX = new float[count];
float[] velY = new float[count];
float[] diam = new float[count];
float[]earthg = new float[count]; 

void setup() {
  //set size of canvas
  size(800, 600);
  for (int i =0; i<count; i++) { //if int is between 0 to 30, add 1 to i
    //initialize variables
    x[i] = width/2;
    y[i] = height/2;
    diam[i] = 80;
    velX[i] = random(-5, 5);
    velY[i] = random(-5, 5);
    earthg[i] = .1;
  }
}
void draw() {
  //draw background to cover previous frame
  background(0, 70, 250);

  //draw ball

  for (int i =0; i<count; i++) {
    ellipse(x[i], y[i], diam[i], diam[i]); //draws ellipse
    velY[i]+=earthg[i]; //adds gravity variable to velY
    //add velocity to position
    x[i] += velX[i];
    y[i] += velY[i];


    //bounce ball if it hits walls
    if (x[i] + diam[i]/2 >= width) {
      velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (x[i] - diam[i]/2 <= 0) {
      velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (y[i] + diam[i]/2 >= height) {
      velY[i] = -abs(velY[i]); //if the ball hits bottom wall, reverse velocity
    y[i]= height - diam[i]/2; // makes Y position above bottom 
    //else if (y[i] - diam[i]/2 <= 0) {
    //  velY[i] = abs(velY[i]);
    //}
  }
  }
}