private int score;
private int combos;
private int[] pieceLineUp;
static String scoreText;
//private Board gameboard;

void setup(){
  size(920,920);
  pieceLineUp = new int[3];
}
void draw(){
  background(255);
  fill(255);
  rect(380, 2, 200, 40);
  fill(0);
  textSize(20);
  text("Score: " + score, 395, 26);
}

void scoreRow(){
  int[][] board = new int[8][8];
  for(int row = 0; row<8; row++){
    boolean full = true;
    for(int col = 0; col<8; col++){
      if(board[row][col] == 0){
        full=false;
      }
    }
    if(full){
      for(int i = 0; i<8; i++){
        board[row][i] = 0;
        score += 80;
      }
    }
  }
}

void scoreCol(){

}

void combos(){
  combos = 0;
}
