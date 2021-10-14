void target(float x, float y)
{
  noStroke();
  fill(0);
  circle(x, y, 50);
  fill(255, 0, 0);
  circle(x, y, 34);
  fill(0);
  circle(x, y, 14);
}

void shooting()
{
  //Shooting the ball
  if (shoot)
  {
    xPos = xPos + vx;
    yPos = yPos + vy;
 
    stroke(0);
    fill(255);
    circle(xPos, yPos, 45);
    
    if (dist(xPos, yPos, bottomX, bottomY) < 10 + 15) 
    {
      point = point + 1;
      reset();
    }
    if (dist(xPos, yPos, centerX, centerY) < 10 + 15) 
    {
      point = point + 1;
      reset();
    }
    if (dist(xPos, yPos, topX, topY) < 10 + 15) 
    {
      point = point + 1;
      reset();
    }
  }
  else
  {
    stroke(0);
    fill(255);
    circle(xPos, yPos, 45);
  }
}

void reset()
{
  xPos = width/2;
  yPos = height/1.1;
  shoot = false;
  
  stroke(0);
  fill(255);
  line(xPos, yPos, mouseX, mouseY);
  circle(xPos, yPos, 45);
}
