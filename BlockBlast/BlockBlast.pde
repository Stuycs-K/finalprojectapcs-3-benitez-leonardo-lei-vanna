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
void score(){
  score = 0;
  boolean full = false;
  int[][] board = new int[8][8];
  for(int row = 0; row<8; row++){
    for(int col = 0; col<8; col++){
      if(board[row][col] == 0){
        full=false;
      }
    }
    full=true;
    if(full){
      score+=80;
      for(int r = 0; r<8; r++){
        for(int c = 0; c<8; c++){
          board[r][c] = 0;
        }
      }
      
    }
  }
  
}
void combos(){
  combos = 0;
}
