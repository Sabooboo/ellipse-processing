static final int ELLIPSE_WIDTH = 100;
static final int ELLIPSE_HEIGHT = 100;

static final int POINT_SPACING = 3;


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
  stroke(255, 0, 255);
  drawPoints();
}

boolean pointWithinBounds(int x, int y) {
  double angle = getDegrees(x, y);
  double ellipseRadius = getRadiusAtAngle((float) angle);
  // sqrt(x^2 + y^2) == radius of point
  double distance =  sqrt(x*x + y*y);
  println("(" + x + "," + y + ") => " + distance);
  
  return distance < ellipseRadius;
}

void drawPoints() {
  for (int i = 1; i < ELLIPSE_WIDTH; i+= POINT_SPACING) {
    for (int j = 1; j < ELLIPSE_HEIGHT; j += POINT_SPACING) {
      // line(0, 0, i - ELLIPSE_WIDTH / 2, j - ELLIPSE_HEIGHT / 2);
       if (pointWithinBounds(i - ELLIPSE_WIDTH, j - ELLIPSE_HEIGHT)) {
        point(i - ELLIPSE_WIDTH / 2, j - ELLIPSE_HEIGHT / 2);
       }
    }
  }
}

double getDegrees(int x, int y) {
  float theta = atan((float) y / (float) x) * 180 / PI;
  return theta;
}

double getRadiusAtAngle(float theta) {
  double radiusAtAngle = (
    (ELLIPSE_WIDTH * ELLIPSE_HEIGHT) / (
      sqrt(
        (ELLIPSE_WIDTH * ELLIPSE_WIDTH) * (sin(theta) * sin(theta))
        + (ELLIPSE_HEIGHT * ELLIPSE_HEIGHT) * (cos(theta) * cos(theta))
      )
    )
  );
  return (float) radiusAtAngle;
}

void drawEllipse(int a, int b) {
  ellipse(0, 0, a, b);
}
