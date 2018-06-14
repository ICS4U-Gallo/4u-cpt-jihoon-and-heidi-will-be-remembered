int grid = 20; //How big each grid square will be
PVector trash;
int speed = 10;
boolean dead = true;
int highscore = 0;

Student student;

void setup() {
  size(500, 500);
  student = new Student();
  trash = new PVector();
  newFood();
  //frameRate(8);
}

void draw() {
  background(0);
  fill(255);
  if (!dead) {

    if (frameCount % speed == 0) {
      student.update();
    }
    student.show();
    student.eat();
    fill(255, 0, 0);
    rect(trash.x, trash.y, grid, grid);
    textAlign(LEFT);
    textSize(15);
    fill(255);
    text("Score: " + student.score, 10, 20);
  } else {
    textSize(25);
    textAlign(CENTER, CENTER);
    text("Student time to clean up!\nClick to start" + "\nHighscore: " + highscore, width/2, height/2);
  }
}

void newFood() {
  trash.x = floor(random(width));
  trash.y = floor(random(height));
  trash.x = floor(trash.x/grid) * grid;
  trash.y = floor(trash.y/grid) * grid;
}

void mousePressed() {
  if (dead) {
    student = new Student();
    newFood();
    speed = 10;
    dead = false;
  }
}