int grid = 20;
PVector trash;
int speed;
boolean dead = true;
int highscore;
int score;
int timeLeft;
Timer timer;
Student student;

void setup() {
  size(800, 600);
  student = new Student();
  trash = new PVector();
  timer = new Timer(50);
  newTrash();
}

void draw() {
  background(0);
  fill(255);
  
 
  if (!dead) {

    if (frameCount % speed == 0) {
      student.update();
    }
    student.show();
    student.clean();
    fill(255, 0, 0);
    rect(trash.x, trash.y, grid, grid);
    textAlign(LEFT);
    textSize(15);
    fill(255);
    text("Score: " + student.score, 10, 20);
    text("Timer: " + timer.getTime(),90,20);
      if(timer.getTime() >0){
        timer.countDown();
      }
      else{
        background(0);
        fill(225);
        textSize(25);
        textAlign(CENTER);
        text("THE END"+ "\nscore: " + highscore, width/2, height/2);
      }
  }
  

 
    else {
    textSize(25);
    textAlign(CENTER, CENTER);
    text("Student time to clean up!\nClick to start", 400,300);
    }

  }


void newTrash() {
  trash.x = floor(random(width));
  trash.y = floor(random(height));
  trash.x = floor(trash.x/grid) * grid;
  trash.y = floor(trash.y/grid) * grid;
}

void mousePressed() {
  if (dead) {
    student = new Student();
    newTrash();
    speed = 5;
    dead = false;

    
  }
}
