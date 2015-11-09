float gravity_acceleration = 0.98;
float air_resistance = 0.99;

//declare a class which contains the ball variables
class Ball{
  float x, y;
  float velX, velY;
  float diam;
  float hue;
  
  Ball(){
    //initialize variables
    x = random(width);
    y = random(height);
    diam = 80;
    velX = random(-5, 5);
    velY = random(-5, 5);
    hue = random(255);
  }
  
  void run(){
    //bounce ball if it hits walls
    if (x + diam/2 >= width) {
      velX = -abs(velX);    //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (x - diam/2 <= 0) {
      velX = abs(velX);     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (y + diam/2 >= height) {
      velY = -abs(velY);
    } else if (y - diam/2 <= 0) {
      velY = abs(velY);
    }
      
    //add velocity to position
    x += velX;
    y += velY;
    
    //simulate gravity
    velY += gravity_acceleration;
    
    //simulate air resistance
    velY *= air_resistance;
    
    //increment the hue
    hue++;
  }
  void bdraw(){
    //draw ball
    fill(hue % 255, 255, 255);
    ellipse(x, y, diam, diam);
  }
}

int bnum = 100;

Ball[] balls = new Ball[bnum];

void setup() {
  
  colorMode(HSB, 255);
  
  //set size of canvas
  size(800, 600);
  
  //initialize all of the balls
  for(int i = 0; i < bnum; i++){
    balls[i] = new Ball();
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);
  
  for(Ball ball: balls){
    ball.run();
    ball.bdraw();
  }
}