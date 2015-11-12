int woof = 30;
float[] x = new float[woof];
float[] y = new float[woof];
float[] velX = new float[woof];
float[] velY = new float[woof];
float[] diam = new float[woof];
float[] gravity = new float[woof];
float[] friction = new float[woof];
float[] y2 = new float[woof];

void setup() 
{
  size(800, 600);
  for(int i = 0;i < woof; i++)
  {
    x[i] = random(width);
    y[i]= random(height);
    diam[i] = 50;
    y2[i] = height - diam[i]/2;
    velX[i] = random(-4.9, 5);
    velY[i]= random(-4.9, 5);
    gravity[i]= 0.4;
    friction[i] = 0.95;
  }
}

void draw() 
{
  background(0);
for(int i = 0;i < woof; i++)
{
  noStroke();
  fill(random(255),random(255),random(255));
  ellipse(x[i], y[i], diam[i], diam[i]);

  x[i] += velX[i];
  y[i] += velY[i];

  if (x[i] + diam[i]/2 >= width) 
  {
    velX[i] = -abs(velX[i]);    
  } else if (x[i] - diam[i]/2 <= 0) {
    velX[i] = abs(velX[i]);   
  }
  if (y[i] + diam[i]/2 >= height) 
  {
    velY[i] = -abs(velY[i]);
  } else if (y[i] - diam[i]/2 <= 0) {
    velY[i] = abs(velY[i]);
  }
  if (y[i] > -1)
  {
    velY[i] = velY[i] + gravity[i];
  }
  if (y[i]+diam[i]/2 > height)
  {
    y[i] = y2[i];
  }
   if (y[i] + diam[i]/2 >= height)
   {
     velX[i] = velX[i] * friction[i];
   }
}
}