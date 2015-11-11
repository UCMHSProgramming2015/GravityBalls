
int count = 30; //create 30 balls

//declare arrays
float[] x = new float[count]; //create location and movement variables for balls
float[] y = new float[count];
float[] velX = new float[count];
float[] velY = new float[count];
float[] diam = new float[count];
float[] g = new float[count];

void setup() {
  //set size of canvas
  size(800, 600);
  
  int i = 0;
  while(i < count){
    x[i] = random(width); //spawn each ball inside the canvas
    y[i] = random(height);
    velX[i] = random(-5,5); //move each ball at a max rate of 5 in a random direction
    velY[i] = random(-5,5);
    diam[i] = random(5,100); //make each ball a radically different size
    g[i] = 0.1;
    i++; //increase i by 1 during each cycle; have different instances of the above variables for each ball
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);

  for(int i = 0; i < count; i++){ //initialize i as 0; draw 300 balls and change the variables each time

    //draw ball
    ellipse(x[i], y[i], diam[i], diam[i]);

    //add gravity to velocity
    velY[i] += g[i];
  
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
    } else if (y[i] - diam[i]/2 <= 0) {
      velY[i] = abs(velY[i]);
    }
    
    //prevent ball from phasing through walls
    if (y[i] > height - diam[i]/2 ){
      y[i] = height - diam[i]/2;
    }
  }
}