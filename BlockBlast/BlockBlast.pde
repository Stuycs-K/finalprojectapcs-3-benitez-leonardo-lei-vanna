private int score;
private int combos;
private int numPlaced;
private Piece[] pieceLineUp;
static String scoreText;
private Board gameBoard;
private int x = 460;
private int y = 275;
public Piece piece;
private int select = -1;
  
public void setup(){
  size(920,920);//MAGIC NUMBERS
  pieceLineUp = new Piece[3];
  newLineUp();
  gameBoard=new Board();
  //piece=new Piece("T3x3");
  piece = null;
}
  

public void draw(){
  background(255);
  fill(255);
  rect(380,15,200,40);
  fill(0);
  textSize(20);
  text("Score: "+score,395,40);
  gameBoard.drawBoard();
  if(piece != null){
    piece.drawPiece(x, y);
  }
  for(int i = 0; i<3; i++){
    if(pieceLineUp[i]!=null && i != select)
    pieceLineUp[i].drawPiece(350 + i*170, 725);
  }
}

void newLineUp(){
  String[] pieceTypes = {"T3x3", "L3x3", "L2x3", "L2x2"};
  for(int i = 0; i < 3; i++){
    pieceLineUp[i] = new Piece(pieceTypes[(int)random(pieceTypes.length)]);
  }
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
      combos++;
      score += 80;
    }
  }
}


void mouseDragged(){
  if(piece != null){
    x=mouseX+10;
    y=mouseY+10;
  }
}

void mousePressed(){
  for(int i = 0; i<3; i++){
    if(mouseX > 250 + i*150 && mouseX < 400 + i*150 && mouseY >600 && mouseY <750){
      if(pieceLineUp[i] != null){
        piece = pieceLineUp[i];
        select = i;
        x = mouseX;
        y = mouseY;
      }
    }
  }
}

void mouseReleased(){
  if(piece == null) return;
  int pieceCenterOffset = 2*gameBoard.cellSize();
  int adjustedX = x-pieceCenterOffset;
  int adjustedY = y-pieceCenterOffset;
  int boardCol = (adjustedX-250)/50;//WE NEED TO REMOVE THESE MAGIC NUMBERS
  int boardRow = (adjustedY-175)/50;
  if(gameBoard.placePiece(piece, boardRow, boardCol)) {
    scoreRow();
    scoreCol();
    numPlaced++;
    combos();
    if(combos>1){
      score += 80*combos;
    }
    piece = null;
    if(select >= 0 && select < 3){
      pieceLineUp[select] = null;
    }
    piece = null;
    select = -1;
    //String[] pieceTypes = {"T3x3", "L3x3", "L2x3", "L2x2"};
    //piece = new Piece(pieceTypes[(int)random(pieceTypes.length)]);
    boolean empty = true;
    for(Piece p : pieceLineUp){
      if(p != null){
        empty = false;
        break;
      }
    }
    if(empty){
      newLineUp();
    }
  }
  else{
    piece = null; 
    select = -1;
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
      combos++;
    }
  }
}


public void combos(){
  if(combos > 1){
    if(numPlaced>3){
      combos = 0;
    }
  }
}
