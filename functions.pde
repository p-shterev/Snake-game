void createGrid() {
  for (int i = 0; i < len; i++) {
    for (int j = 0; j < len; j++) {
      grid[i][j] = new Grid(i * size_sqr, j * size_sqr);
    }
  }
}

void showGrid() {
  for (int i = 0; i < len; i++) {
    for (int j = 0; j < len; j++) {
      grid[i][j].show();
    }
  }
}
void newGame() {
  clearBoard();
  dir_flag = true;
  snake = new Snake(scr_wid / 2 - size_sqr/2, scr_hei / 2 - size_sqr/2);
  snake.setXY(1, 0);
  food();
}
void clearBoard(){
   for (int i = 0; i < len; i++) {
    for (int j = 0; j < len; j++) {
      grid[i][j].setFood(false);
    }
  }
}
void food() {
  ArrayList<PVector>rand = new ArrayList<PVector>(snake.snakeLocation());
  int rand_x;
  int rand_y;
  do {
    rand_x = floor(random(len));
    rand_y = floor(random(len));
  } while (rand.contains(new PVector(rand_x, rand_y)));
  grid[rand_x][rand_y].setFood(true);
}
