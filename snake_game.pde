import java.io.*; 
import java.util.*; 

int size_sqr = 20;
int len = 30;
float speed = 3;
Grid[][] grid = new Grid[len][len];
int scr_wid = 600;
int scr_hei = 600;
boolean dir_flag = true;
Snake snake;
boolean lup = true;
void setup() {
  size(601, 601); 
  createGrid();
  newGame();
}

void draw() { 
  if (lup) {//loop e vrgradene :'( zatova lup got it :D 
    if (frameCount % 8 ==0) {
      background(51);
      showGrid(); 
      snake.update();
      snake.show();
      snake.isDead();
    }
  }
 
}

void keyPressed() {
  if (key == ' ') {
    lup = !lup;
    if (!lup) {
      printArray(snake.snakeLocation());
    }
  }
  if (dir_flag) {
    if (keyCode == UP) {
      snake.setXY(0, -1);
      dir_flag = false;
    } else if (keyCode == DOWN) {
      snake.setXY(0, 1);
      dir_flag = false;
    }
  } else {
    if (keyCode == LEFT) {
      snake.setXY(-1, 0);
      dir_flag = true;
    } else if (keyCode == RIGHT) {
      snake.setXY(1, 0);
      dir_flag = true;
    }
  }
  if (key == 'r') {
    newGame();
  }
}
