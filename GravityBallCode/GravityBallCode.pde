//declare variables
int count = 30;

float[] x = new float[count];
float[] y = new float[count];
float[] velX = new float [count];
float[] velY = new float [count];
float[] diam = new float [count];
float[] grav = new float [count];

void setup() {
  //set size of canvas
  size(800, 600);
  textSize(40);

  //initialize variables
  
  for (int i = 0; i < count; i++){
  x[i] = random(width);  //make random so all the balls won't spawn in one place
  y[i] = random(height/2);
  diam[i] = 80;
  grav[i] = .3;
  velX[i] = 2;
  velY[i] = 0;
  }
 
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  for(int i = 0; i < count; i++){
  
  ellipse(x[i], y[i], diam[i], diam[i]);
  
  velY[i] += grav[i];  //acceleration: velY = velY + grav ... velocity slightly increases over time = acceleration 
  x[i] += velX[i];  //add velocity to position
  y[i] += velY[i];  //add velocity to position
  
  //bounce ball if it hits walls
  if(y[i] + diam[i]/2 >= height){
    velY[i] = -abs(velY[i]);
  }
  
  if (x[i] + diam[i]/2 >= width) {
    velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (x[i] - diam[i]/2 <= 0) {
    velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  

  if(dist(mouseX, mouseY, x[i], y[i]) <= diam[i]/2){
    print("      splat tim");
    fill(255, 165, 0);  //orange
    text("SPLAT TIM", width/2-100, height/2);
  } else if(dist(mouseX, mouseY, x[i], y[i]) >= diam[i]/2);
    fill(255);
  }
}