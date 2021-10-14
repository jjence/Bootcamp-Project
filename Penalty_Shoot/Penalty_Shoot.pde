//Position of ball
float xPos;
float yPos;

//Speed of ball
float vx;
float vy;

//Position of 3 targetS
float bottomX;
float bottomY;
float centerX;
float centerY;
float topX;
float topY;

//Points scored
float point;

int time;
int right;
boolean shoot;

void setup()
{
  size(800, 600);
  textSize(30);
  
  xPos = width/2;
  yPos = height/1.1;
  
  bottomX = 245;
  bottomY = 225;
  centerX = 400;
  centerY = 160;
  topX = 555;
  topY = 95;
  
  right = 572;
  point = 0;
}

void mousePressed()
{
  vx = (mouseX - xPos) / 50;
  vy = (mouseY - yPos) / 50;
  shoot = true;
}

void draw()
{
  //Pitch, stands & ball
  background(210, 210, 210);
  stroke(0);
  fill(0, 255, 0);
  quad(200,150, 600,150, 800,600, 0,600);
  fill(255);
  line(200, 150, 0, 60);
  line(600, 150, 800, 60);
  
  //People in stands
  for(float left=521; left>0; left=left-85)
  {
    for(float lPos=-7; lPos<240; lPos=lPos+18)
    {  
      drawPeople(lPos, left - lPos*2.25);
    }
  }
  
  for(float center=220; center<600; center=center+26)
    {
      drawPeople(center, 118);
      drawPeople(center+16, 76);
      drawPeople(center+32, 34);
      drawPeople(center+48, -8);
      drawPeople(center+438, -8);
      drawPeople(center+422, 34);
      drawPeople(center+406, 76);
      
      drawPeople(center+420, 115);
      drawPeople(center+402, 160);
      drawPeople(center+422, 205);
      drawPeople(center+442, 250);
      drawPeople(center+462, 295);
      drawPeople(center+482, 340);
      drawPeople(center+502, 385);
      drawPeople(center+522, 430);
      drawPeople(center+542, 475);
      drawPeople(center+562, 520);
    }
  
  //Timer
  fill(0);
  text("Time: " + time/60, 350, 280);
  if (time == 600)
  {
    text("GAME OVER", 330, 343);
    frameRate(0);
  }
  else
  {
  time = time + 1;
  }

  //Lines
  noStroke();
  fill(255);
  rect(159, 241, 482, 10);
  quad(237,151, 257,151, 167,400, 147,400);
  quad(545,151, 565,151, 653,400, 633,400);
  rect(160, 385, 480, 15);
  
  //Goal and score count
  stroke(0);
  rect(200, 50, 20, 200);
  rect(580, 50, 20, 200);
  rect(200, 50, 400, 20);
  fill(0);
  text("Score: " + point, 340, 310);
  line(xPos, yPos, mouseX, mouseY);
  
  //Goal net
  for(int i=25; i<58; i=i+3)
  {
    stroke(255);
    line(i*10, 70, i*10, 220);
  }
  for(int i=10; i<25; i=i+3)
  {
    line(220, i*10, 580, i*10);
  }
  
  //Draw targets
  target(245, 225);
  target(400, 160);
  target(555, 95);
  
  shooting();
}

void drawPeople(float manX, float manY)
{
  noStroke();
  fill(255);
  circle(manX+10, manY-10, 20);
  fill(random(255), random(255), random(255));
  rect(manX, manY, 20, 30);
}
