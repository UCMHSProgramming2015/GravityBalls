//declare variables
int num = 10;
float[] x = new float [num];
float[] y = new float [num];
float[] velX= new float [num];
float[] velY = new float [num];
float[] diam = new float [num];
float[] a = new float [num];
color[] c = new color [num];

void setup() {
  //set size of canvas
  size(800, 600);
  //initialize variables
  for(int i = 0; i < num; i++){
  x[i] = width/2;  
  y[i] = 0;
  diam[i] = 30;
  velX[i] = random(-5, 5);
  velY[i] = random(-5, 5);
  a[i] = .3;  //adds gravity 
  c[i]=color(random(59), random(255), random(128));
}
}

void draw() {
  //draw background to cover previous frame
  background(0);

  for( int j = 0; j< num; j++){
   fill(c[j]);
  ellipse(x[j], y[j], diam[j], diam[j]);

  //add velocity to position
  velY[j] += a[j];
  x[j] += velX[j];
  y[j] += velY[j];
  
  //bounce ball if it hits walls
  if (x[j] + diam[j]/2 >= width) {
    velX[j] = -abs(velX[j]);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (x[j] - diam[j]/2 <= 0) {
    velX[j] = abs(velX[j]);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  if (y[j] + diam[j]/2 >= height) {
    velY[j] = -abs(velY[j]);
  } else if (y[j] - diam[j]/2 <= 0) {
    velY[j] = abs(velY[j]);
  } else {
    velY[j]++;
  }
  if(dist(x[j], y[j], mouseX,mouseY)<=diam[j]/2){                        //if the mouse touchs a ball the size and color will change
   c[j] = color(random(255),random(195), random(186));
    diam[j] = random(50,60);
  }
  }
}