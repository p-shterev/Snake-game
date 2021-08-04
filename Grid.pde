class Grid {
  int x; 
  int y;
  boolean food;
  boolean snake;

  Grid(int x, int y) {
    this.x = x;
    this.y = y;
    food = false;
    snake = false;
  }

  void setFood(boolean food) {
    this.food = food;
  }

  boolean getFood() {
    return this.food;
  }
  void setSnake(boolean snake) {
    this.snake = snake;
  }

  void show() {
    noStroke();
    
    if (this.food) {
      fill(255, 25, 32);
    } else if (this.snake) {
      fill(25,255,25);
    }else{
      fill(255,255,255);
    }
    rect(x, y, size_sqr, size_sqr);
  }
}
