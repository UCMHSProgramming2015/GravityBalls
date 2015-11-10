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
    diam = random(10, 90);
    velX = random(-5, 5);
    velY = random(-5, 5);
    hue = random(255);
  }
  
  void run(Ball[] balls){
    //bounce ball if it hits walls
    if (x + diam/2 >= width) {
      velX = -abs(velX);    //if the ball hits the right wall, assign x velocity the negative version of itself
      x = width - diam/2;    
    } else if (x - diam/2 <= 0) {
      velX = abs(velX);     //if the ball hits the left wall, assign x velocity the positive version of itself
      x = diam/2;
    }
    if (y + diam/2 >= height) {
      velY = -abs(velY);
      y = height - diam/2;
    } else if (y - diam/2 <= 0) {
      velY = abs(velY);
      y = diam/2;
    }
    
    //bounce off of the mouse cursor
    if(dist(x, y, mouseX, mouseY) < diam){
      velY = -10;
    }
    
    //bounce off of other balls
    for(Ball ball : balls){
      if(ball != this && dist(x, y, ball.x, ball.y) < diam/2 + ball.diam/2){
        x += (ball.diam/2 + diam/2)*((x - ball.x)/dist(x, y, ball.x, ball.y))*0.1;
        y += (ball.diam/2 + diam/2)*((y - ball.y)/dist(x, y, ball.x, ball.y))*0.1;
        velX *= 0.9;
        velY *= 0.9;
      }  
    }
      
    //simulate air resistance
    velY *= air_resistance;
    
    //simulate gravity
    velY += gravity_acceleration;  
      
    //add velocity to position
    x += velX;
    y += velY;
    
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
    ball.run(balls);
    ball.bdraw();
  }
}