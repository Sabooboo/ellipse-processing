static final int ELLIPSE_WIDTH = 100;
static final int ELLIPSE_HEIGHT = 100;

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
  // drawEllipse(ELLIPSE_WIDTH, ELLIPSE_HEIGHT);
  
  // draw rectangle
  stroke(0, 255, 255);
 
  //rect(
  //  -ELLIPSE_WIDTH / 2,
  //  -ELLIPSE_HEIGHT / 2,
  //  ELLIPSE_WIDTH,
  //  ELLIPSE_HEIGHT
  //);
  
  // points
  drawPoints();
}

void drawPoints() {
  int dots = 0;
  for (float i = 0; i <= ELLIPSE_WIDTH; i+= POINT_SPACING) {
    for (float j = 0; j <= ELLIPSE_HEIGHT; j += POINT_SPACING) {
       if (pointWithinBounds(i - ELLIPSE_WIDTH / 2, j - ELLIPSE_HEIGHT / 2)) {
         stroke(0, 255, 0);
         dots++;
       } else {
        stroke(255, 0, 0); 
       }
       point(i - ELLIPSE_WIDTH / 2, j - ELLIPSE_HEIGHT / 2);
    }
  }
  println(dots);
}

boolean pointWithinBounds(float x, float y) {
  float angle = getDegrees(x, y);
  float ellipseRadius = getRadiusAtAngle(angle);
  // sqrt(x² + y²) == radius of point
  float distance =  sqrt(x*x + y*y);
  // println("(" + x + "," + y + ") => " + distance + " " + ellipseRadius);
  if (x == 0 && y == 0) return true;
  return abs(distance) < ellipseRadius;
}

float getDegrees(float x, float y) {
  // just right angle trig then convert to deg.
  float theta = atan(y / x);
  return theta;
}

float getRadiusAtAngle(float theta) {
  // diameter = l*w / (sqrt(l² * sin²θ + w² * cos²θ)).
  // im using full width and not the radius of each axis,
  // so divide by 2 later for radius
  float diamAtAngle = (
    (ELLIPSE_WIDTH / 2f * ELLIPSE_HEIGHT / 2f) / (
      sqrt(
        (ELLIPSE_WIDTH / 2f * ELLIPSE_WIDTH / 2f) * (sin(theta) * sin(theta))
        + (ELLIPSE_HEIGHT / 2f * ELLIPSE_HEIGHT / 2f) * (cos(theta) * cos(theta))
      )
    )
  );
  return diamAtAngle;
}

void drawEllipse(int a, int b) {
  ellipse(0, 0, a, b);
}
