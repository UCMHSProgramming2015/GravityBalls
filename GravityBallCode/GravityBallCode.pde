//declare variables
float gravity, airResistance;
int count = 30;
int size = 80;
//declare array
float[] x = new float[count];
float[] y = new float[count];
float[] velX = new float[count];
float[] velY = new float[count];
float[] diam = new float[count];
float[] t = new float[count];
PImage bg;
int amp = 100;

void setup() {
  //set size of canvas
  size(800, 600);
  //initialize variables
 
 for(int i = 0; i < count; i++) {
  x[i] = width/2;
  y[i] = height/2;
  diam[i] = size;
  velX[i] = random(-5, 5);
  velY[i] = random(-5, 5);
  colorMode(HSB,800,600,100);
  bg = loadImage("bg.jpg");
 }
}

void draw() {
  //draw background to cover previous frame
  background(bg);
  for (int i = 0; i < count; i++){
    gravity = 0.45;
    airResistance = 0.99;
    //draw ball
    ellipse(x[i], y[i], diam[i], diam[i]);
  
    //add velocity to position
    x[i] += velX[i];
    y[i] += velY[i];
    fill(x[i],y[i],100);
    
    velY[i] += gravity; //add gravity
    velY[i] *= airResistance; //make sure the ball doesn't get higher than starting point
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
    
    if (y[i] >= height) { //make sure ball doesn't escape from bottom of screen
      y[i] = height - velY[i];
      velY[i] = -abs(velY[i]);
    }  
    diam[i] = -amp*cos(t[i])+size+amp/2;
    
    if (sq(mouseX - x[i]) + sq(mouseY - y[i]) < sq(diam[i]/2)) { //increase size if mouse is inside circle
      if (t[i] < 2*PI) {
        t[i] += .1;
      }
      else {
        t[i]=0;
      }
    }
    else if (t[i] > 0){ //automatically decrease if mouse is not in contact and circle is larger than original size
      t[i] -= .05;
         }
  }
}