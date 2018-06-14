class Student {
  PVector pos;
  PVector vel;
  ArrayList<PVector> hist;
  int len;
  int moveX = 0;
  int moveY = 0;
  int score = 0;



  Student() {
    pos = new PVector(0, 0);
    vel = new PVector();
    hist = new ArrayList<PVector>();
    len = 0;
    score = 0;
  }

  void update() {
    hist.add(pos.copy());
    pos.x += vel.x*grid;
    pos.y += vel.y*grid;
    moveX = int(vel.x);
    moveY = int(vel.y);

    pos.x = (pos.x + width) % width;
    pos.y = (pos.y + height) % height;

    if (hist.size() > len) {
      hist.remove(0);
    }
    if (score > highscore) highscore = score;

  }

  void eat() {
    if (pos.x == trash.x && pos.y == trash.y) {
      score++;
      if (speed > 5) speed--;
      newFood();
    }
  }

  void show() {
    noStroke();
    fill(125);
    rect(pos.x, pos.y, grid, grid);
    for (PVector p : hist) {
      rect(p.x, p.y, grid, grid);
    }
  }

}

void keyPressed() {
  if (keyCode == LEFT && student.moveX != 1) {
    student.vel.x = -1;
    student.vel.y = 0;
  } else if (keyCode == RIGHT && student.moveX != -1) {
    student.vel.x = 1;
    student.vel.y = 0;
  } else if (keyCode == UP && student.moveY != 1) {
    student.vel.y = -1;
    student.vel.x = 0;
  } else if (keyCode == DOWN && student.moveY != -1) {
    student.vel.y = 1;
    student.vel.x = 0;
  }
}