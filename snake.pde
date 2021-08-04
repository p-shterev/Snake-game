class Snake {
  int x;
  int y;
  int x_prev;
  int y_prev;
  int x_dir = 0;
  int y_dir = 0;
  ArrayList<PVector> tails = new ArrayList<PVector>();

  Snake(int x, int y) {
    this.x = x;
    this.y = y;
    tails.add(new PVector(this.x-size_sqr, y));
    tails.add(new PVector(this.x-2*size_sqr, y));
  }

  void setXY(int x, int y) {
    this.x_dir = x;
    this.y_dir = y;
  }
  ArrayList<PVector> snakeLocation() {
    ArrayList<PVector> result = new ArrayList<PVector>();
    result.add(new PVector(this.x, this.y));
    for (PVector vec : tails) {
      result.add(vec);
    }
    return result;
  }


  void update() {
    int row = x / size_sqr;
    int col = y / size_sqr;
    this.x_prev = this.x;
    this.y_prev = this.y;
    this.x += x_dir * size_sqr;
    this.y += y_dir * size_sqr;
   // this.x = constrain(this.x, 0 + size_sqr/2, scr_wid - size_sqr/2);
    //this.y = constrain(this.y, 0 + size_sqr/2, scr_hei - size_sqr/2);
    //shifting
    if (tails.size() > 0) {
      for (int i = tails.size()-1; i >= 0; i--) {
        if (i==0) {
          tails.set(i, new PVector(x_prev, y_prev));
        } else {
          tails.set(i, tails.get(i-1));
        }
      }
    }
    //еating
    if (grid[row][col].getFood()) {
      grid[row][col].setFood(false);
      tails.add(new PVector(this.x_prev, this.y_prev));
      food();
    }
  }
  void isDead() {
    //hit wall
    if (x < size_sqr/2 || x >scr_wid - size_sqr/2 || y< size_sqr/2 || y >scr_hei - size_sqr/2) {
      newGame();
      return;
    }
   
    //hit tail
    for(PVector tail : tails){
      if(tail.x == x && tail.y == y){
       print("ouch ;'(");
       newGame();
       return;
      }
    }
  }

  void show() {
    push();
    fill(56, 187, 56);
    rectMode(CENTER);
    rect(x, y, size_sqr, size_sqr);
    fill(76, 255, 94);
    for (PVector tail : tails) {
      rect(int(tail.x), int(tail.y), size_sqr, size_sqr);
    } 
    pop();
  }
}
