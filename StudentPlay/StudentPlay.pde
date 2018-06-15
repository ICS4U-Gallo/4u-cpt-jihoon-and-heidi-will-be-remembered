int grid = 20;
PVector trash;
int speed;
boolean dead = true;
int highscore;
int score;
Timer timeLeft;

Student student;

void setup() {
  size(800, 600);
  student = new Student();
  timeLeft = new Timer(5);
  trash = new PVector();
  newFood();
}

void draw() {
  background(0);
  fill(255);
  if (timeLeft.getTime() == 0) {
    dead = true;
  }


 
  if (!dead) {

    if (frameCount % speed == 0) {
      student.update();
    }
    timeLeft.countDown();
    
    
    student.show();
    student.eat();
    fill(255, 0, 0);
    rect(trash.x, trash.y, grid, grid);
    textAlign(LEFT);
    textSize(15);
    fill(255);
    text("Score: " + student.score, 10, 20);
    text("Timer: " + timeLeft.getTime(),90,20);
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
    speed = 5;
    dead = false;


    
  }
}