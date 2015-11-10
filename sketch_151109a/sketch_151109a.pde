int count = 10;
//declare arrays
float[] x = new float [count];
float[] y = new float [count];
float[] velX = new float [count];
float[] velY = new float [count];
float[] diam = new float [count];
float[] grav = new float [count];

void setup() {
  size (800,600);
  for(int i = 0; i<count; i++){
x[i]= random(width);
y[i]= height/2;
diam[i] = 80;
velX[i] = 0;
velY[i] = 0;
grav[i] = .8;
  }
}
void draw() {
background(0);
for(int i = 0; i<count; i++){
  ellipse (x[i],y[i], diam[i], diam[i]);
  velY[i]+= grav[i];
  x[i]+=velX[i];
  y[i]+=velY[i];
  if (y[i]+ diam[i]/2 >= height) {
   velY[i]= -abs(velY[i]);
  }
  if(dist(x[i],y[i],mouseX,mouseY) <= diam[i]/2){
  background(random(255), random(255), random(255));
   }
}
}