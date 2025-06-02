private int score;
private int combos;
private int[] pieceLineUp;
static String scoreText;
private Board gameBoard;
private int x = 460;
private int y = 275;
public Piece piece;
  
public void setup(){
  size(920,920);//MAGIC NUMBERS
  pieceLineUp=new int[3];
  gameBoard=new Board();
  piece=new Piece("T3x3");
}
  

public void draw(){
  background(255);
  fill(255);
  rect(380,15,200,40);
  fill(0);
  textSize(20);
  text("Score: "+score,395,40);
  gameBoard.drawBoard();
  piece.drawPiece(x, y);
}
  
public void scoreRow() {
  for(int row = 0; row < 8; row++) {
    boolean full = true;
    for(int col = 0; col < 8; col++) {//MAGIC NUMBERS
      if(gameBoard.getBoard()[row][col]==0) {
        full = false;
      }
    }
    if(full) {
      for(int col = 0; col < 8; col++) {
        gameBoard.getBoard()[row][col] = 0;
      }
      score += 80;
    }
  }
}


void mouseDragged(){
  x=mouseX+10;
  y=mouseY+10;
}

void mouseReleased(){
  int pieceCenterOffset = 2*gameBoard.cellSize();
  int adjustedX = x-pieceCenterOffset;
  int adjustedY = y-pieceCenterOffset;
  int boardCol = (adjustedX-250+25)/50;//WE NEED TO REMOVE THESE MAGIC NUMBERS
  int boardRow = (adjustedY-175+25)/50;
  if(gameBoard.placePiece(piece, boardRow, boardCol)) {
    scoreRow();
    scoreCol();
    String[] pieceTypes = {"T3x3", "L3x3", "L2x3", "L2x2"};
    piece = new Piece(pieceTypes[(int)random(pieceTypes.length)]);
  }
}

public void scoreCol() {
  for(int col = 0; col < 8; col++) {//MORE MAGIC NUMBERS
    boolean full = true;
    for(int row = 0; row < 8; row++) {
      if(gameBoard.getBoard()[row][col] == 0) {
        full = false;
      }
    }
    if(full) {
      for (int row = 0; row < 8; row++) {
        gameBoard.getBoard()[row][col] = 0;
      }
      score += 80;
    }
  }
}


public void combos(){
  combos = 0;
}
