//declare variables
int count = 30;
float [] x= new float [count];
float [] y= new float [count];
float [] velY= new float [count];
float [] diam= new float [count];
float [] a= new float [count];

void setup() {
  //set size of canvas
  size(800, 600);   //set size

  //initialize variables
int i=0; //set local variable

  while(i<count){
    y[i]=height/2;
    x[i]= random(0,width);
    diam[i]= random(20,40);  //while i is less than 30, all these variables are true
    velY[i]= random(5,10);
    a[i]= random(0.5, 5);
    
    i++;  //i increases by 1
  }

 
}

void draw() {
 background(0);  //set background
 int i=0;  //set local variable
 
 //while i is less than 30, all this is true
 while(i<count){
  ellipse(x[i], y[i], diam[i], diam[i]);
  
 if(dist(x[i], y[i], mouseX, mouseY) < diam[i]/2){   //if distance between mouse and center is less than the radius of the circle...
  diam[i]= diam[i]+5;                                //... increase the circle size
 }

velY[i] = velY[i] + a[i];  //"gravity" acts on balls- decrease distance it bounces each time
y[i] += velY[i];         

if(y[i]>=height){
 velY[i]=-abs(velY[i]); 
y[i]=height;                  //change y direction when it hits the bottom
}
i++;
}
}