//declare variables

int count=30;
  //initialize variables
float[] x = new float[count];
float[] y = new float[count];
float[] velX = new float[count];
float[] velY = new float[count];
float[] diam = new float[count];
float[] colorsr = new float[count]; 
float[] colorsg = new float[count];
float[] colorsb = new float[count];


float gravity =1;
void setup() {
  //set size of canvas
  size(800, 600);
  //initialize variables
  for(int i=0; i<count; i++) {
   //ARRAY FOR CHARACTERISTICS 
    x[i] = random(width);
    y[i] = random(height);
    velX[i] = random(-5, 5);
    velY[i] = 5;
    diam[i] = random(20,50);
    //Adds color
    colorsr[i]= random(0,255);
    colorsg[i]= random(0,255);
    colorsb[i]= random(0,255);
  }
}

void draw() {
  //draw background to cover previous frame
  background(frameCount%360,0,255);

  //draw ball
  for ( int i=0; i<count;i++){
  //Adds color
  fill(colorsr[i],colorsg[i],colorsb[i]);  
  ellipse(x[i], y[i], diam[i], diam[i]);
  //add gravity to ball
  velY[i] += gravity;

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
    velY[i] = -abs(velY[i]);
    y[i] = height-diam[i]/2;
  } /*else if (y[i] - diam[i]/2 <= 0) {
    velY[i] = abs(velY[i]);
  }*/
  //add gravity to ball
  if(y[i]+diam[i]/2<height){
    velY[i] += gravity;
  }
  if(velY[i]==0){
    velX[i]=0;
  }
  }
}
void keyPressed(){
  if(keyCode==ESC){    //Exits program at ESC
    exit();
  }
}