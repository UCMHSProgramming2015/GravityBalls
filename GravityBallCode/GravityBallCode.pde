//declare variables
float x, y, velX, velY, diam, gravity;

void setup(){
//set size of canvas
size(800,600);

//initialize variables
x=width/2;
y=height/2;
diam=80;
velX=random(-5,5);
velY=random(-5,5);
gravity=.1;
}

void draw(){
//draw background to cover previous frame
background(0);

//draw ball
ellipse(x,y,diam,diam);

//add velocity to position
x+=velX;
y+=velY;

//add gravity to the ball (acceleration=change in velocity over time; change the velocity)
velY+=gravity;

//bounce ball if it hits walls
if(x+diam/2>=width){
    velX=-abs(velX);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if(x-diam/2<=0) {
      velX=abs(velX);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
if(y+diam/2>=height){
    velY=-abs(velY);
  } else if(y-diam/2<=0){
      velY=abs(velY);
  }
  
//add gravity (acceleration in downward direction)
if(velY+diam/2>=height){
  gravity=-abs(gravity);  //if the ball hits the bottom wall, assign y velocity the negative version of itself
  }
}