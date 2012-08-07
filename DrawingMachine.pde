// motors
float motor1X = 0;
float motor1Y = 0;

float motor2X = 200;
float motor2Y = 0;

// line 
float startX = 100;
float startY = 100;

float endX = 150;
float endY = 120;

// useful things
float directionX = endX - startX;
float directionY = endY - startY;

float lineLength = sqrt((directionX *directionX) + (directionY *directionY)) ;
float unitDirectionX = directionX/lineLength; 
float unitDirectionY = directionY/lineLength; 

float currentPosition = 0;
float currentDirection = 1;
float stepSize = lineLength / 256.0; 

void setup() {
  size(200,200);
  smooth();
  background(255);
}

void draw() {
  float x = startX + (unitDirectionX * currentPosition);
  float y = startY + (unitDirectionY * currentPosition);

  currentPosition += stepSize * currentDirection;
  
  if (currentPosition < 0.0 )
  {
    currentPosition = 0.0;
    currentDirection = -currentDirection;
  }
  else if (currentPosition > lineLength)
  {
     currentPosition = lineLength;
     currentDirection = -currentDirection;   
  }

  // Fade the old data
  noStroke();
  fill(255,10);
  rect(0,0,width,height);

  // Display at x,y location
  stroke(0);
  fill(175);
  ellipse(x,y,16,16);
  
  // draw the chains
  line(motor1X, motor1Y, x, y);
  line(motor2X, motor2Y, x, y);
}
