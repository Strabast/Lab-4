int ballNum;
PVector balls[];
float rangeX;
float rangeY;
boolean noFill;
boolean line;

void setup() {
  size(500, 500);
  background(255);
  ballNum = 10;
  balls = new PVector[ballNum];
  noFill = false;
  line = false;
}

void draw() {
}

//Click to place a scatter of balls on the board
void mouseReleased() {
  for (int i = 0; i < ballNum; i++) {
    rangeX = int(random(-50, 50));
    rangeY = int(random(-50, 50));
    balls[i] = new PVector(mouseX + rangeX, mouseY + rangeY, 0);
    
    //States that determine what gets drawn.
    if (noFill == true) {
      noFill();
      stroke(random(0, 255), random(0, 255), random(0, 255));
    }

    if (noFill == false) {
      stroke(0);
      fill(random(0, 155), random(0, 155), random(0, 155));
    }
    
    if(line == true && i > 0){
      line(balls[i-1].x, balls[i-1].y,balls[i].x, balls[i].y);
    }
    
    ellipse(balls[i].x, balls[i].y, 20, 20);
  }
}


/*Controls:
- C: clears background
- L: Toggles lines between the circles
- N: Toggles fill
*/

void keyPressed() {
  if (key == 'c') {
    background(255);
  }

  if (key == 'l') {
    if (line == false) {
      line = true;
    } else {
      line = false;
    }
  }

  if (key == 'n') {
    if (noFill == false) {
      noFill = true;
    } else {
      noFill = false;
    }
  }
}
