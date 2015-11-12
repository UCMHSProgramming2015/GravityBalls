//declare variables
int count = 30;

float [] x = new float [count];
float [] y = new float [count];
float [] velX = new float [count];
float [] velY = new float [count];
float [] diam = new float [count];

float gravity = 1;

void setup() {
  //set size of canvas
  size(800, 600);
  
for (int i= 0; i < count; i++) {
   x[i] = random(width);
   y[i] = random(height);
   diam[i] = random(10,50);
   velX[i] = random(10);
   velY[i] = random(10);
     }
   }
     
void draw() {
  //draw background to cover previous frame
  background(0);
 
  //draw ball
 for (int i = 0; i < count; i++) {
   ellipse(x[i], y[i], diam[i], diam[i]);
   velY[i] += gravity;
   x[i] += velX[i];
   y[i] += velY[i];
  
  if (x[i] + diam[i] >= width) {
    velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (x[i] - diam[i]/2 <= 0) {
    velX[i] = abs(velX[i]); //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  
  if (y[i] + diam[i]/2 >= 600) {
    velY[i] = -abs(velY[i]);
    y[i] = 600 - diam[i];
  } else if (y[i] - diam[i] <= 0) {
    velY[i] = abs(velY[i]);
  }
 }
}