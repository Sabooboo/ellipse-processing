static final int ELLIPSE_WIDTH = 300;
static final int ELLIPSE_HEIGHT = 400;

static final int POINT_SPACING = 5;


void setup() {
    size(500, 500);
    background(0);
    noFill();
    ellipseMode(CENTER);
}

void draw() {
  // draw ellipse
  stroke(255);
  translate(width/2, height/2);
  drawEllipse(ELLIPSE_WIDTH, ELLIPSE_HEIGHT);
  
  // draw rectangle
  stroke(0, 255, 255);
 
  rect(
    -ELLIPSE_WIDTH / 2,
    -ELLIPSE_HEIGHT / 2,
    ELLIPSE_WIDTH,
    ELLIPSE_HEIGHT
  );
  
  // draw points
  drawPoints();
}

boolean pointWithinBounds(float x, float y) {
  float angle = getDegrees(x, y);
  float ellipseRadius = getRadiusAtAngle(angle);
  // sqrt(x^2 + y^2) == radius of point
  float distance =  sqrt(x*x + y*y);
  println("(" + x + "," + y + ") => " + distance + " " + ellipseRadius);
  
  return abs(distance) < ellipseRadius;
}

void drawPoints() {
  for (float i = 1; i < ELLIPSE_WIDTH; i+= POINT_SPACING) {
    for (float j = 1; j < ELLIPSE_HEIGHT; j += POINT_SPACING) {
       if (pointWithinBounds(i - ELLIPSE_WIDTH / 2, j - ELLIPSE_HEIGHT / 2)) {
         stroke(255, 0, 255);
       } else {
        stroke(0, 255, 255); 
       }
       point(i - ELLIPSE_WIDTH / 2, j - ELLIPSE_HEIGHT / 2);
    }
  }
}

float getDegrees(float x, float y) {
  float theta = atan(y / x) * 180 / PI;
  return theta;
}

float getRadiusAtAngle(float theta) {
  float diamAtAngle = (
    (ELLIPSE_WIDTH * ELLIPSE_HEIGHT) / (
      sqrt(
        (ELLIPSE_WIDTH * ELLIPSE_WIDTH) * (sin(theta) * sin(theta))
        + (ELLIPSE_HEIGHT * ELLIPSE_HEIGHT) * (cos(theta) * cos(theta))
      )
    )
  );
  return diamAtAngle / 2f;
}

void drawEllipse(int a, int b) {
  ellipse(0, 0, a, b);
}
